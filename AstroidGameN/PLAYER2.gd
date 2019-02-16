extends KinematicBody2D

#Constsants
const SPEED = 400
const SuperSPEED = 500
const GRAVITY = 50
const JUMP_POWER = -1000
const FLOOR = Vector2(0,-1)


# Variables
var velocity = Vector2()
var onGround = false




func _physics_process(delta):
	if Input.is_action_pressed("ui_d"):
		velocity.x = SPEED; 
	elif Input.is_action_pressed("ui_a"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("ui_w"):
		if onGround == true:
			velocity.y = JUMP_POWER;
			onGround = false;
		if onGround == false && Input.is_action_pressed("ui_d"):
			velocity.x = SuperSPEED;
		if onGround == false && Input.is_action_pressed("ui_a"):
			velocity.x = -SuperSPEED;
			
		
			
		
	velocity.y += GRAVITY	
	
	if is_on_floor():
		onGround = true
	else:
		onGround = false
		
	velocity = move_and_slide(velocity, FLOOR)
	