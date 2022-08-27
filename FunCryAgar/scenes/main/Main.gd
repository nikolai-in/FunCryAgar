extends Node


var score : float = 0

func _ready() -> void:
	new_game()


func game_over() -> void:
	get_tree().call_group("coins", "queue_free")


func new_game() -> void:
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	# $HUD.update_score(score)
	# $HUD.show_message("Get Ready")
	
	$Music.play()


func _on_StartTimer_timeout() -> void:
	$GameTimer.start()
