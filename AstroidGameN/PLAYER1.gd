extends KinematicBody2D

signal hit

#Constsants
const SPEED = 400
const SuperSPEED = 500
const GRAVITY = 50
const JUMP_POWER = -1000
const FLOOR = Vector2(0,-1)


# Variables
var velocity = Vector2()
var onGround = false

func game_over():
	queue_free()
func _ready():
	get_parent().get_node("MobTimer").start()


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED; 
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("ui_up"):
		if onGround == true:
			velocity.y = JUMP_POWER;
			onGround = false;
		if onGround == false && Input.is_action_pressed("ui_right"):
			velocity.x = SuperSPEED;
		if onGround == false && Input.is_action_pressed("ui_left"):
			velocity.x = -SuperSPEED;
			
		
			
	if collision:
		if collision.collider.has_method("returning"):
			game_over()
		 
		
	velocity.y += GRAVITY	
	
	if is_on_floor():
		onGround = true
	else:
		onGround = false
		
	velocity = move_and_slide(velocity, FLOOR)
	
	