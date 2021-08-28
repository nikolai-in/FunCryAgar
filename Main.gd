extends Node


export (PackedScene) var Cell
export var cells = 200


func _ready():
	randomize()

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
	if Global.score >= 5:
		get_tree().call_group("cells", "queue_free")


func _on_GameOverTimer_timeout():
	if Global.score < 0.5:
		Global.score = 0.5
	game_over()


func _on_StartTimer_timeout():
	$GameOverTimer.start(Global.time)
	$HUD/Time.show()
	$HUD/ScoreLabel.show()
	spawn_cells()

func spawn_cells():
	for _blob in range(cells):
		var x = rand_range(0, 10000)
		var y = rand_range(0, 10000)
		var cell = Cell.instance()
		add_child(cell)
		cell.position = Vector2(x, y)
