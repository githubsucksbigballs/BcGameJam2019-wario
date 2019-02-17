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
var hitstun = false
var dontgethit = false

#var Explosion = preload("res://Astroid/Explosion.tscn")
var Explosion = preload("res://Cameron Stuff/Explosion/Explosion.tscn")

#export (PackedScene) var Explosion

func game_overP1():
	get_parent().get_node("ScoreTimer").stop()
	get_parent().get_node("MobTimer").stop()
	get_parent().get_node("HUD").game_over()
	get_parent().get_node("HUD").show_message("ARROW KEY PLAYER WINS!")
	if get_parent().get_node("PLAYER2") != null:
		get_parent().get_node("PLAYER2").dontgethit = true
	queue_free()
	
	
	
#func _ready():
	#get_parent().get_node("MobTimer").start()


#const Explosion = preload("res://Astroid/Explosion.tscn")

func megumin():	
	var megumin = Explosion.instance()
	#var pos = velocity
	#megumin.position = pos
	megumin.scale = Vector2(4.5,4.5)
	return megumin

func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)
	if Input.is_action_pressed("ui_right") && !hitstun:
		velocity.x = SPEED; 
	elif Input.is_action_pressed("ui_left") && !hitstun:
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("ui_up"):
		if onGround == true:
			velocity.y = JUMP_POWER;
			onGround = false;
		if onGround == false && Input.is_action_pressed("ui_right") && !hitstun:
			velocity.x = SuperSPEED;
		if onGround == false && Input.is_action_pressed("ui_left")&& !hitstun:
			velocity.x = -SuperSPEED;
			
		
			
	if collision && dontgethit == false:
		if collision.collider.has_method("returning"):
			var explo = megumin()
			explo.global_position = global_position;
			explo.global_position.x += 7
			explo.global_position.y += -50
			get_parent().add_child(explo)
			game_overP1()
			print("COOOOOOOOL")
		if collision.collider.has_method("game_overP2"):
			hitstun = true
			$HitstunTimer.start()
			velocity = -velocity
		
		 
		
	velocity.y += GRAVITY	

	
	if is_on_floor():
		onGround = true
	else:
		onGround = false
		
	velocity = move_and_slide(velocity, FLOOR)
	
	



func _on_HitstunTimer_timeout():
	hitstun = false
