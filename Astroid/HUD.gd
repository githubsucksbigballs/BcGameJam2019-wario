extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

	
func game_over():
	
	show_message("Game Over")
	yield($MessageTimer, "timeout")


func _on_MessageTimer_timeout():
	transition.fade_to("res://Cameron Stuff/Pumping Game/PumpScene.tscn")
