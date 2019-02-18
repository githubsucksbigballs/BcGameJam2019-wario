extends Node

func _on_Quit_pressed():
	get_tree().quit()


func _on_2_Player_pressed():
	transition.fade_to("res://Astroid/Main.tscn")
	player1meteor = 0
	player1pump = 0
	player1balloon= 0
	player1sumo= 0
	player1total= 0
	
	player2meteor= 0
	player2pump= 0
	player2balloon= 0
	player2sumo= 0
	player2total= 0
