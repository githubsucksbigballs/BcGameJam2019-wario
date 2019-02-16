extends KinematicBody2D

const SPEED = 80
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0,-1)
const CEIL = Vector2(0,1)
var velocity = Vector2()
var health = 2


func _physics_process(delta):
	
	if Input.is_action_pressed("d"):
		velocity.x = SPEED
	elif Input.is_action_pressed("a"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("w"):
		velocity.y = JUMP_POWER
	elif Input.is_action_pressed("s"):
		velocity.y = SPEED + velocity.y + GRAVITY
	else:
#		velocity.y = 0	
		velocity.y = velocity.y + GRAVITY
	velocity = move_and_slide(velocity, FLOOR) 

	