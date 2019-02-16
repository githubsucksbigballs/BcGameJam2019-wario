extends Node

func _on_Quit_pressed():
	get_tree().quit()


func _on_2_Player_pressed():
	get_tree().change_scene("res://Cameron Stuff/Pumping Game/PumpScene.tscn")


func _on_1_Player_pressed():
	pass
