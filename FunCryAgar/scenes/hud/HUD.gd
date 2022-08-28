extends CanvasLayer
signal start_game


export var time: float = 30


func show_message(text):
	$Message.text = str(text)
	$Message.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")

	$Message.text = "Собери биткоины!"
	$HSlider.show()
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(4), "timeout")
	$StartButton.show()

func update_score(score: int):
	$VBoxContainer/ScoreLabel.text = str(score)


func _on_StartButton_pressed() -> void:
	$StartButton.hide()
	emit_signal("start_game")


func _on_HSlider_value_changed(value: float) -> void:
	show_message(value)
	time = value
	


func _on_MessageTimer_timeout() -> void:
	$Message.hide()
	$HSlider.hide()
