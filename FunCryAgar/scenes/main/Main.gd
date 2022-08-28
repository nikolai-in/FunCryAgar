extends Node

export(PackedScene) var coins
var coins_ammount : int
var game_scale : int


func _ready() -> void:
	coins_ammount = Global.data.options.coin_ammount
	game_scale = Global.data.options.game_scale
	$Music.autoplay = bool(Global.data.options.music)
	$Music.playing = bool(Global.data.options.music)
	randomize()
	spawn_coins()
	
	$Grid.rect_position = $Player.screen_size * -game_scale
	$Grid.rect_size = $Player.screen_size * 2 * game_scale / $Grid.rect_scale

func spawn_coins() -> void:
	var rng = RandomNumberGenerator.new()
	for i in range(coins_ammount):
		var coin : Area2D = coins.instance()
		
		var coin_location : Vector2 = Vector2(rng.randi_range(-1920*game_scale, 1920*game_scale),
		rng.randi_range(-1080*game_scale, 1080*game_scale))
		
		coin.position = coin_location
		
		add_child(coin)


func time_update() -> void:
	$HUD.update_time($GameTimer.time_left)
	# bad stuff is below
	$HUD.update_score($Player.score)


func game_over() -> void:
	$Player.stop()
	get_tree().call_group("coins", "queue_free")
	$Music.volume_db = -40
	$HUD.show_game_over()
	$UpdateTimer.stop()
	spawn_coins()


func new_game() -> void:
	$Player.score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	# $HUD.update_score(score)
	$HUD.show_message("Приготовьтесь!")
	
	$Music.volume_db = -25

func _on_StartTimer_timeout() -> void:
	get_tree().call_group("coins", "show")
	$GameTimer.wait_time = $HUD.time
	$GameTimer.start()
	$UpdateTimer.start()
