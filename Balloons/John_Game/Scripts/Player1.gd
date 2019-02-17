extends KinematicBody2D

const SPEED = 200
const GRAVITY = 10
var JUMP_POWER = -250
const FLOOR = Vector2(0,-1)
const CEIL = Vector2(0,1)
var velocity = Vector2()
var player = 1
func _physics_process(delta):
	
	if Input.is_action_pressed("p1_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("p1_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("p1_up"):
		velocity.y = JUMP_POWER
	elif Input.is_action_pressed("p1_down"):
		velocity.y = SPEED + velocity.y + GRAVITY
	else:
#		velocity.y = 0	
		velocity.y = velocity.y + GRAVITY
	velocity = move_and_slide(velocity, FLOOR) 


	if(GlobalValues.health1 <= 0):
		velocity.y = 1000
		JUMP_POWER = 1000

	

