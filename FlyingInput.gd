extends KinematicBody2D
	
var motion = Vector2()
var timer
var input_sprite

func _enter_tree():
	timer = get_child(0)
	input_sprite = get_child(1)
	print(input_sprite)
	
func _physics_process(delta):
	move_and_slide(motion)
	if (timer.time_left <= 0):
		 get_parent().remove_child(self)


