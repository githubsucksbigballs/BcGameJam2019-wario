extends Node2D

var player
var count_direct = 360
var current_flying
var center
var spawn_pos
var input_box

func _ready():
	randomize()
	player = get_child(0)
	input_box = get_child(1)

	
func generate_random_flying_input(key):
	var random_pos = randi()%count_direct
	var radius = Vector2(200, 0)
	var center = Vector2(input_box.position.x,input_box.position.y)
	var step = 2 * PI / count_direct
	var spawn_pos = center + radius.rotated(step * random_pos)
	var flying_input = load("res://Cameron Stuff/Pumping Game/FlyingInput.tscn")
	var current_flying = flying_input.instance()
	var img_name = "pump1.png"
	if get_index() == 0:
		match key:
			0:
				img_name = "w.png"
			1:
				img_name = "s.png"
			2:
				img_name = "a.png"
			3:
				img_name = "d.png"
	current_flying.get_child(0).texture = load("res://Cameron Stuff/Pumping Game/" + img_name)
	#current_flying.get_child(0).scale = Vector2(0.25,0.25)
	add_child(current_flying)
	current_flying.position = spawn_pos
	current_flying.motion = (Vector2(center.x - spawn_pos.x, center.y - spawn_pos.y))
