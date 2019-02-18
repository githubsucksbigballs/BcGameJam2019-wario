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
#var explosion = preload("res://Explo.tscn")

var Explosion = preload("res://Cameron Stuff/Explosion/Explosion.tscn")

func megumin():	
	var megumin = Explosion.instance()
	#var pos = velocity
	#megumin.position = pos
	megumin.scale = Vector2(4.5,4.5)
	return megumin

func game_overP2():
	get_parent().get_node("ScoreTimer").stop()
	get_parent().get_node("MobTimer").stop()
	get_parent().get_node("HUD").game_over()
	get_parent().get_node("HUD").show_message("ARROW KEY PLAYER WINS!")
	Scores.player2meteor += 10
	Scores.player2total += 10
	if get_parent().get_node("PLAYER1") != null:
		get_parent().get_node("PLAYER1").dontgethit = true
	queue_free()
	
#func _ready():
	#get_parent().get_node("MobTimer").start()
#func megumin():
#	var megumin = explosion.instance()
#	megumin.position = Vector2(0,-160)
#	megumin.scale = Vector2(3,3)
#	return megumin

func _on_HitStun_timeout():
	hitstun = false
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if Input.is_action_pressed("p1_right"):
		velocity.x = SPEED; 
	elif Input.is_action_pressed("p1_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("p1_up"):
		if onGround == true:
			velocity.y = JUMP_POWER;
			onGround = false;
		if onGround == false && Input.is_action_pressed("p1_right") && !hitstun:
			velocity.x = SuperSPEED;
		if onGround == false && Input.is_action_pressed("p1_left") && !hitstun:
			velocity.x = -SuperSPEED;
			
		
			
	if dontgethit == false && collision:
		if collision.collider.has_method("returning") && !hitstun:
			var explo = megumin()
			explo.global_position = global_position;
			explo.global_position.x += 7
			explo.global_position.y += -50
			get_parent().add_child(explo)
			game_overP2()
			#add_child(megumin())
		if collision.collider.has_method("game_overP1") && !hitstun:
			velocity = -velocity
			hitstun = true
			$HitstunTimer.start()
			
		 
		
	velocity.y += GRAVITY	
	
	if is_on_floor():
		onGround = true
	else:
		onGround = false
		
	velocity = move_and_slide(velocity, FLOOR)
	

func _on_HitstunTimer_timeout():
	hitstun = false
