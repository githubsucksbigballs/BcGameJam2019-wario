extends Node2D

var pump_counter = 0
var player_child
var pump_child

func _ready():
	pump_child = get_child(0)
	pump_child = get_child(1)
		
func pump_down():
	pump_child.play("PumpDown")
	pump_counter += 1

func pump_up():
	pump_child.play("PumpUp")