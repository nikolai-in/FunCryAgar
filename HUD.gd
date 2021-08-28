extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	$ScoreLabel.hide()
	$Time.hide()
	$FinalScore.text = 'BTC: %s' % str(Global.score)
	$FinalScore.modulate = Color("#ff3838")
	$FinalScore.show()

func update_time(time_left):
	$Time.text = str(time_left)

func update_score(_score):
	$ScoreLabel.text = 'BTC: %s' % str(Global.score)

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()


func _on_LineEdit_text_entered(new_text):
	var time = int(new_text)
	if 15 <= time and time <= 40:
		Global.time = time
		$LineEdit.hide()
		$StartButton.show()
