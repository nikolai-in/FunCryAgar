extends Node


export(int) var coins_ammount = 500
export(PackedScene) var coins


func _ready() -> void:
	randomize()
	var rng = RandomNumberGenerator.new()
	for i in range(coins_ammount):
		var coin : Area2D = coins.instance()
		
		var coin_location : Vector2 = Vector2(rng.randi_range(-1920*3, 1920*3),
		rng.randi_range(-1080*3, 1080*3))
		
		coin.position = coin_location
		
		add_child(coin)


func time_update() -> void:
	$HUD.update_time($GameTimer.time_left)
	


func game_over() -> void:
	$Player.stop()
	get_tree().call_group("coins", "queue_free")
	$Music.stop()
	$HUD.show_game_over()
	$UpdateTimer.stop()


func new_game() -> void:
	$Player.score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	# $HUD.update_score(score)
	$HUD.show_message("Приготовьтесь!")
	
	$Music.play()

func _on_StartTimer_timeout() -> void:
	get_tree().call_group("coins", "show")
	$GameTimer.wait_time = $HUD.time
	$GameTimer.start()
	$UpdateTimer.start()
