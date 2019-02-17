extends KinematicBody2D

signal hit

#Constsants
const SPEED = 400
const SuperSPEED = 500
const GRAVITY = 50
const JUMP_POWER = -500
const FLOOR = Vector2(0,-1)


# Variables
var velocity = Vector2()
var onGround = false
#var explosion = preload("res://Explo.tscn")

func game_overP2():
	get_parent().game_overP2W()
	queue_free()
	
#func _ready():
	#get_parent().get_node("MobTimer").start()
#func megumin():
#	var megumin = explosion.instance()
#	megumin.position = Vector2(0,-160)
#	megumin.scale = Vector2(3,3)
#	return megumin

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
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
		if onGround == false && Input.is_action_pressed("ui_r"):
			velocity.x = SuperSPEED;
		if onGround == false && Input.is_action_pressed("ui_a"):
			velocity.x = -SuperSPEED;
			
		
			
	if collision:
		if collision.collider.has_method("returning"):
			game_overP2()
			#add_child(megumin())
		if collision.collider.has_method("game_overP1"):
			velocity = -velocity
		 
		
	velocity.y += GRAVITY	
	
	if is_on_floor():
		onGround = true
	else:
		onGround = false
		
	velocity = move_and_slide(velocity, FLOOR)
	