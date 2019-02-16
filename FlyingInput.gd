extends KinematicBody2D
	
	
var motion = Vector2()
var timer

func _ready():
	timer = get_child(1)
	
	

func _physics_process(delta):
	move_and_slide(motion)
	if (timer.time_left <= 0):
		 get_parent().remove_child(self)


