extends CanvasLayer

signal start_game

func _update_score(score):
	$ScoreLabel.text = str(score)

func _show_message(text):
	$MessageLabel2.text = text
	$MessageLabel2.show()
	$MessageTimer.start()

func _show_game_over():
	_show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel2.text = "Dodge the Creeps"
	$MessageLabel2.show()
	yield(get_tree().create_timer(1.0),"timeout")
	$Button.show()

func _on_Button_pressed():
	$Button.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$MessageLabel2.hide()
