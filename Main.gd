extends Node


export (PackedScene) var Cell


func game_over():
	get_tree().call_group("cells", "queue_free")
	$HUD.show_game_over()
	$Player.hide()

func new_game():
	Global.score = 0
	$HUD.update_score(Global.score)
	$HUD.show_message("Приготовьтесь!")
	$Player.start($StartPossition.get_position())
	$StartTimer.start()
	

func _process(_delta):
	$HUD.update_time($GameOverTimer.get_time_left())
	$HUD.update_score(Global.score)
	if Global.score >= Global.data.options.score_max:
		$GameOverTimer.stop()

func _on_GameOverTimer_timeout():
	if Global.score < Global.data.options.score_min:
		Global.score = Global.data.options.score_min
	game_over()


func _on_StartTimer_timeout():
	$GameOverTimer.start(Global.time)
	$HUD/Time.show()
	$HUD/ScoreLabel.show()
	spawn_cells()

func spawn_cells():
	for _blob in range(Global.data.options.coin_ammount):
		var x = rand_range(0, 10000)
		var y = rand_range(0, 10000)
		var cell = Cell.instance()
		add_child(cell)
		cell.position = Vector2(x, y)
