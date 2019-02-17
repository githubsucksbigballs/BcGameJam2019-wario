extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageLabel.start()

func game_over():
	show_message("Game Over!")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text("PUSH YOUR OPPONENT\nOFF THE SCREEN!")
	$MessageLabel.show()

func _on_MessageTimer_timeout():
	$MessageLabel.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
