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

#export (PackedScene) var Explosion

func game_overP1():
	get_parent().game_overP1W()
	queue_free()
	
	
#func _ready():
	#get_parent().get_node("MobTimer").start()


const Explosion = preload("res://Explosion.tscn")

func megumin():	
	var megumin = Explosion.instance()
	var pos = velocity
	megumin.position = pos
	megumin.scale = Vector2(3,3)
	return megumin

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
			get_parent().add_child(megumin())
			game_overP1()
			print("COOOOOOOOL")
		if collision.collider.has_method("game_overP2"):
			velocity = -velocity
		
		 
		
	velocity.y += GRAVITY	

	
	if is_on_floor():
		onGround = true
	else:
		onGround = false
		
	velocity = move_and_slide(velocity, FLOOR)
	
	
