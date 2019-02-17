extends CanvasLayer

var health1 = 3
var health2 = 3
var score1 = 0
var score2 = 0
var playing_john_game = false
var game_over = false
var timer = 4

func _process(delta):
	if playing_john_game:
		show_score1("P1 Score: " + str(score1))
		show_score2("P2 Score: " + str(score2))
		total_score("Total Score: " + str(score1 + score2) + "/80")
		if !game_over:
			if(GlobalValues.health1 == 0):
				GlobalValues.show_message("PLAYER 2 WINS!")
				game_over = true
			elif(GlobalValues.health2 == 0):
				GlobalValues.show_message("PLAYER 1 WINS!")
				game_over = true
			elif(GlobalValues.score1 + GlobalValues.score2 >= 80):
				GlobalValues.show_message("ENERGY FULL! GOOD WORK.")
				game_over = true
		elif game_over:
			timer -= delta
			if timer <= 0:
				playing_john_game = false;
				show_score1("")
				show_score2("")
				total_score("")
				print("gg")
				transition.fade_to("res://Sumo/test.tscn")
		

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()

func show_score1(text):
	$P1Score.text = text
	$P1Score.show()

func show_score2(text):
	$P2Score.text = text
	$P2Score.show()

func total_score(text):
	$TotalScore.text = text
	$TotalScore.show()

