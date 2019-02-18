extends Node

func _on_Quit_pressed():
	get_tree().quit()


func _on_2_Player_pressed():
	transition.fade_to("res://Astroid/Main.tscn")
	Scores.player1meteor = 0
	Scores.player1pump = 0
	Scores.player1balloon= 0
	Scores.player1sumo= 0
	Scores.player1total= 0
	
	Scores.player2meteor= 0
	Scores.player2pump= 0
	Scores.player2balloon= 0
	Scores.player2sumo= 0
	Scores.player2total= 0
