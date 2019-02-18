extends Node

var is_game_over = false
var p1
var p2
var current_input_key = 0
var timer
var sound_good
var sound_perfect
var sound_bad
var sound_miss
const miss_threshold = 16
const bad_threshold = 12
const good_threshold = 5
var timing_text
var timing_text2
var p1_pressed = false
var p2_pressed = false
var score1
var score2
 

func _ready():
	p1 = $PlayerWithFlyingInput
	p2 = $PlayerWithFlyingInput2
	p2.get_child(0).player_child.play("redIdle")
	timer = $Timer
	sound_good = $Good
	sound_perfect = $Perfect
	sound_bad = $Bad
	sound_miss = $Miss
	get_random_input_key()
	var direction = get_direction(current_input_key)
	p1.generate_random_flying_input(direction[0])
	p2.generate_random_flying_input(direction[1])
	timer.start()
	
func _process(delta):
	#print(timer.time_left)
	if !is_game_over:
		check_input(current_input_key)
	#print(p1_pressed)
	
func game_over(text):
	$WinPanel.visible = true
	$WinPanel/Label.text = text
	$WinTimer.start()
	$Timer.stop()
	is_game_over = true;
	Scores.player1pump += 10 + 10 * p1.balloon_count
	Scores.player1total +=  10 + 10 * p1.balloon_count
	Scores.player2pump += 10 + 10 * p2.balloon_count
	Scores.player2total +=  10 + 10 * p2.balloon_count

		
func get_random_input_key():
	current_input_key = randi()%4

func check_input(direct):
	var directions = get_direction(direct)
	if (!p1_pressed):
		if (Input.is_action_just_pressed(directions[0])):
			get_score_value(p1)
			p1_pressed = true
		for x in get_other_direction(direct)[0]:
			if (Input.is_action_just_pressed(x)):
				p1.timing_text.show("MISS")
				sound_miss.play()
				p1_pressed = true
				break
	if (!p2_pressed):	
		if (Input.is_action_just_pressed(directions[1])):
			get_score_value(p2)
			p2_pressed = true
		for x in get_other_direction(direct)[1]:
			if (Input.is_action_just_pressed(x)):
				p2.timing_text.show("MISS")
				sound_miss.play()
				p2_pressed = true
				break
			
		

func get_other_direction(direct):
	var p1_other = []
	var p2_other = []
	if direct != 0:
				p2_other.append("ui_up")
				p1_other.append("p1_up")
	if direct != 1:
				p2_other.append("ui_down")
				p1_other.append("p1_down")
	if direct != 2:
				p2_other.append("ui_left")
				p1_other.append("p1_left")
	if direct != 3:
				p2_other.append("ui_right")
				p1_other.append("p1_right")
	return [p1_other,p2_other]

			
func get_direction(direct):
	var p1_dir
	var p2_dir
	match direct:
			0:
				p2_dir = "ui_up"
				p1_dir = "p1_up"
			1:
				p2_dir = "ui_down"
				p1_dir = "p1_down"
			2:
				p2_dir = "ui_left"
				p1_dir = "p1_left"
			3:
				p2_dir = "ui_right"
				p1_dir = "p1_right"
	return [p1_dir,p2_dir]

func _on_Timer_timeout():
	get_random_input_key()
	var direction = get_direction(current_input_key)
	p1.generate_random_flying_input(direction[0])
	p2.generate_random_flying_input(direction[1])
	if (p1_pressed	== false):
		p1.timing_text.show("MISS")
		p1.increase_air(-2)
		sound_miss.play()
	if (p2_pressed	== false):
		p2.timing_text.show("MISS")
		sound_miss.play()
		p2.increase_air(-2)
	p1_pressed = false
	p2_pressed = false
	
	#print(current_input_key)
	
func get_score_value(player):
	var displacement = player.get_displacement_box() 
	#print(displacement)
	if displacement.x >= miss_threshold and displacement.y >= miss_threshold:
		player.timing_text.show("MISS")
		sound_miss.play()
		player.increase_air(-2)
	else:
		if displacement.x >= bad_threshold and displacement.y >= bad_threshold:
			player.timing_text.show("BAD")
			sound_bad.play()
			player.increase_air(1)
		elif displacement.x >= good_threshold and displacement.y >= good_threshold:
			player.timing_text.show("GOOD")
			sound_good.play()
			player.increase_air(3)
		else:
			player.timing_text.show("PERFECT")
			sound_perfect.play()
			player.increase_air(5)
		player.get_child(0).pump_down()
		if (player == p1):
			player.get_child(0).player_child.play("blueDown")
		else:
			player.get_child(0).player_child.play("redDown")




func _on_PlayerWithFlyingInput_has_three_balloons():
	game_over("Player 1 Wins!")

func _on_PlayerWithFlyingInput2_has_three_balloons():
	game_over("Player 2 Wins!")



func _on_WinTimer_timeout():
	transition.fade_to("res://Balloons/John_Game/StageOne.tscn")
