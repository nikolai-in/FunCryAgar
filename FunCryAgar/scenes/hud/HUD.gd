extends CanvasLayer
signal start_game


var time: float


func _ready() -> void:
	time = Global.data.options.kWt_min
	$HSlider.min_value = Global.data.options.kWt_min
	$HSlider.max_value = Global.data.options.kWt_max


func show_message(text: String):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over():
	$VBoxContainer/TimeLabel.hide()
	show_message("Good Job!")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")

	$Message.text = "Собери Биткоины!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	$HSlider.show()
	$StartButton.show()
	$ExitButton.show()

func update_score(score: float):
	$VBoxContainer/ScoreLabel.text = 'BTC: %s' % str(score)


func update_time(time_left: float):
	$VBoxContainer/TimeLabel.text = "Осталось времени: " + str(int(time_left * 10))


func _on_StartButton_pressed() -> void:
	$StartButton.hide()
	$ExitButton.hide()
	$VBoxContainer/TimeLabel.show()
	$VBoxContainer/ScoreLabel.show()
	emit_signal("start_game")


func _on_HSlider_value_changed(value: float) -> void:
	$Message.text = "Собери Биткоины!\n" + str(value) + " kWt"
	time = value


func _on_MessageTimer_timeout() -> void:
	$Message.hide()
	$HSlider.hide()


func _on_Exit_pressed() -> void:
	get_tree().quit()
