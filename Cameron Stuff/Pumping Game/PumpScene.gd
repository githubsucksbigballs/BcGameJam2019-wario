extends Node

var p1
var p2

func _ready():
	p1 = get_child(0)
	p2 = get_child(1)

func _process(delta):
	if (Input.is_action_just_pressed("p2_down")):
		p2.pump_down()
	if (Input.is_action_just_released("p2_down")):
		p2.pump_up()
	if (Input.is_action_just_pressed("ui_down")):
		p1.pump_down()
	if (Input.is_action_just_released("ui_down")):
		p1.pump_up()