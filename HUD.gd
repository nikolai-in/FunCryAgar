extends CanvasLayer

signal start_game


func show_message(text, time = 2.0, color = Color("#ffffff")):
	$Message.text = text
	$Message.modulate = color
	$Message.show()	
	$MessageTimer.start(time)

func show_game_over():
	$ScoreLabel.hide()
	$Time.hide()
	show_message('BTC: %s' % str(Global.score), 15,  Color("#ff3838"))
	yield($MessageTimer, "timeout")
	$Message.text = "Собери биткойны!"
	$Message.show()
	yield(get_tree().create_timer(1), "timeout")
	$LineEdit.show()
	

func update_time(time_left):
	$Time.text = str(int(time_left * 10))

func update_score(_score):
	$ScoreLabel.text = 'BTC: %s' % str(Global.score)

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
	$Message.modulate = Color("#ffffff")

func _on_LineEdit_text_entered(new_text):
	var time = int(new_text)
	if Global.data.options.kWt_min <= time and time <= Global.data.options.kWt_max:
		Global.time = time
		$LineEdit.hide()
		$LineEdit.clear()
		$StartButton.show()
