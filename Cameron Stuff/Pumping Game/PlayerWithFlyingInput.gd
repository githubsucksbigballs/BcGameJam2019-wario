extends Node2D

var player
var count_direct = 360
var current_flying
var center
var spawn_pos
var input_box
var speed = 2
var timing_text


func _ready():
	randomize()
	player = get_child(0)
	input_box = get_child(1)
	timing_text = get_child(2)
	
	
func generate_random_flying_input(input):
	var random_pos = randi()%count_direct
	var radius = Vector2(100*speed, 0)
	center = Vector2(input_box.position.x,input_box.position.y)
	var step = 2 * PI / count_direct
	spawn_pos = center + radius.rotated(step * random_pos)
	var flying_input = load("res://Cameron Stuff/Pumping Game/FlyingInput.tscn")
	current_flying = flying_input.instance()
	var img_name = "pump1.png"
	current_flying.input_sprite = current_flying.get_child(1)
	current_flying.input_sprite.play(input)
	#current_flying.get_child(0).scale = Vector2(0.25,0.25)
	add_child(current_flying)
	current_flying.position = spawn_pos
	current_flying.motion = (Vector2(center.x - spawn_pos.x, center.y - spawn_pos.y) * speed)

func get_displacement_box():
	return Vector2(abs(center.x - current_flying.position.x), abs(center.y - current_flying.position.y))

func _on_TimingTextAnimPlayer_animation_finished(anim_name):
	timing_text.stop()
