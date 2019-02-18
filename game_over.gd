extends Node



func _on_Button_pressed():
	transition.fade_to("res://Cameron Stuff/Main Menu/MainMenu.tscn")

func _ready():
	$VBoxContainer/sumo1.text = str(Scores.player1sumo)
	$VBoxContainer2/sumo2.text = str(Scores.player2sumo)
	$VBoxContainer/pump1.text = str(Scores.player1pump)
	$VBoxContainer2/pump2.text = str(Scores.player2pump)
	$VBoxContainer/balloon1.text = str(Scores.player1balloon)
	$VBoxContainer2/balloon2.text = str(Scores.player2balloon)
	$VBoxContainer/meteor1.text = str(Scores.player1meteor)
	$VBoxContainer2/meteor2.text = str(Scores.player2meteor)
	$VBoxContainer/total1.text = "Total: " + str(Scores.player1total)
	$VBoxContainer2/total2.text = "Total: " + str(Scores.player2total)
	if(Scores.player1total > Scores.player2total):
		$Winner.text = "Player 1 Wins!"
	elif Scores.player1total == Scores.player2total:
		$Winner.text = "Tied Game!"
	else:
		$Winner.text = "Player 2 Wins!"