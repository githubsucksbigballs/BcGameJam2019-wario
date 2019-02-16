extends Node

var p1
var p2
var current_input_key = 0
var timer

func _ready():
	p1 = get_child(0)
	p2 = get_child(1)
	timer = get_child(2)

func _process(delta):
	#print(timer.time_left)
	check_input(0)
	check_input(1)
	check_input(2)
	check_input(3)
		
func get_random_input_key():
	current_input_key = randi()%4

func check_input(direct):
	var p1_dir
	var p2_dir
	if current_input_key == direct:
		match direct:
			0:
				p2_dir = "ui_up"
				p1_dir = "p2_up"
			1:
				p2_dir = "ui_down"
				p1_dir = "p2_down"
			2:
				p2_dir = "ui_left"
				p1_dir = "p2_left"
			3:
				p2_dir = "ui_right"
				p1_dir = "p2_right"
		if (Input.is_action_just_pressed(p2_dir)):
			get_score_value()
			p2.get_child(0).pump_down()
		if (Input.is_action_just_pressed(p1_dir)):
			get_score_value()
			p1.get_child(0).pump_down()
			
func _on_Timer_timeout():
	get_random_input_key()
	p1.generate_random_flying_input(current_input_key)
	p2.generate_random_flying_input(current_input_key)
	#print(current_input_key)
	
func get_score_value():
	if (timer.time_left >= 0.63):
		print("BAD")
	elif (0.63 > timer.time_left and timer.time_left > 0.50):
		print("GOOD")
	elif (timer.time_left >= 0.42):
		print("PERFECT")
	else:
		print("BAD")
