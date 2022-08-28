extends CanvasLayer
signal start_game


var time: float


func _ready() -> void:
	time = Global.data.options.kWt_min
	
	$LineEdit.placeholder_text = "Введите kWt от " + str(Global.data.options.kWt_min) + " до " + str(Global.data.options.kWt_max)


func show_message(text: String):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over():
	$VBoxContainer/TimeLabel.hide()
	show_message("Good Job!")
	yield($MessageTimer, "timeout")

	$Message.text = "Собери Биткоины!"
	$Message.show()
	yield(get_tree().create_timer(1), "timeout")
	$LineEdit.show()
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


func _on_MessageTimer_timeout() -> void:
	$Message.hide()


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_LineEdit_text_entered(new_text: String) -> void:
	time = int(new_text)
	if Global.data.options.kWt_min <= time and time <= Global.data.options.kWt_max:
		Global.time = time
		$LineEdit.hide()
		$LineEdit.clear()
		$StartButton.show()


func _on_LineEdit_visibility_changed() -> void:
	if $LineEdit.visible:
		$LineEdit.grab_focus()
