extends Node2D

var pump_counter = 0
var player_child
var pump_child
#var input_box

func _ready():
	player_child = get_child(0)
	pump_child = get_child(1)
	#input_box = get_child(2)
		
func pump_down():
	pump_child.play("PumpDown")
	
func pump_up():
	pump_child.play("PumpUp")


func increase_counter(value):
	pump_counter += value


func _on_PumpSprite_animation_finished():
	pump_child.stop()


func _on_PlayerSprite_animation_finished():
	player_child.stop()
