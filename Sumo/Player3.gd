extends KinematicBody2D

export var player_id = 0

var speed = 400
var velocity = Vector2()

var explosion = preload("res://Cameron Stuff/Explosion/Explosion.tscn")

var hitstun = false

var win = false


func _ready():
	if player_id == 1:
		#$Particles2D.texture = load("res://Sumo/assets/red1.png")
		$AnimatedSprite.animation = "redDefault"
	else:
		$AnimatedSprite.flip_h = true
	hitstun = true
	$MessageTimer.start()

func hit(vel):
	hitstun = true
	if (player_id == 0):
		$AnimatedSprite.animation = "oof"
	else:
		$AnimatedSprite.animation = "redOof"
	$HitStun.start()
	velocity = vel

func megumin():
	var megumin = explosion.instance()
	var randinteger = rand_range(0, PI/4)
	var random = randi()%2
	if (random == 0):
		megumin.flip_h = true
	else:
		megumin.flip_h = false
	megumin.rotation = randinteger
	megumin.position = Vector2(0, 0)
	megumin.scale = Vector2(2,2)
	return megumin

func _physics_process(delta):
	if (player_id == 1):
		if Input.is_action_pressed('ui_right') && !hitstun:
			velocity.x = speed
			$AnimatedSprite.flip_h = true
		if Input.is_action_pressed('ui_left') && !hitstun:
			velocity.x = -speed
			$AnimatedSprite.flip_h = false
		if Input.is_action_pressed('ui_down') && !hitstun:
			velocity.y = speed
		if Input.is_action_pressed('ui_up') && !hitstun:
			velocity.y = -speed
			$AnimatedSprite.flip_v = false
	else:
		if Input.is_action_pressed('p1_right') && !hitstun:
			velocity.x = speed
			$AnimatedSprite.flip_h = true
		if Input.is_action_pressed('p1_left') && !hitstun:
			velocity.x = -speed
			$AnimatedSprite.flip_h = false
		if Input.is_action_pressed('p1_down') && !hitstun:
			velocity.y = speed
		if Input.is_action_pressed('p1_up') && !hitstun:
			velocity.y = -speed
			$AnimatedSprite.flip_v = false
	if (velocity.x > 0):
		velocity.x -= 10
		
	if (velocity.x < 0):
		velocity.x += 10
	
	if (velocity.y > 0):
		velocity.y -= 10
	
	if (velocity.y < 0):
		velocity.y += 10

	var collision = move_and_collide(velocity * delta)
	if collision:
		$Bump.play()
		hitstun = true
		$HitStun.start()
		if(collision.collider.has_method("hit")):
			$LoopFix.start()
			var random = randi()%2
			var multiplier = 1.5
			get_parent().get_node("Player2").add_child(megumin())
			get_parent().get_node("Player").add_child(megumin())
			if player_id == 0:
				if random == 0:
					get_parent().get_node("Player2").hit(velocity*multiplier)
				else:
					get_parent().get_node("Player2").hit(velocity)

			else:
				if random == 1:
					get_parent().get_node("Player").hit(velocity*multiplier)
				else:
					get_parent().get_node("Player").hit(velocity)

			#velocity = -velocity
		if(collision.collider.has_method("isAsteroid")):
			velocity = -velocity


func _on_HitStun_timeout():
	hitstun = false
	if (player_id == 0):
		$AnimatedSprite.animation = "default"
	else:
		$AnimatedSprite.animation = "redDefault"

func _on_LoopFix_timeout():
	velocity = -velocity 


func _on_VisibilityNotifier2D_screen_exited():
	$AnimatedSprite.animation = "explosion"
	get_parent().get_node("MessageLabel").text = "WASD Key Player\n has won!"
	get_parent().get_node("MessageLabel").show()
	get_parent().get_node("MobTimer").stop()
	get_parent().get_node("WinTimer").start()
	queue_free()
	transition.fade_to("res://Cameron Stuff/Main Menu/MainMenu.tscn")
	

func _on_MessageTimer_timeout():
	get_parent().get_node("MessageLabel").hide()
	hitstun = false
	

func _on_WinTimer_timeout():
	pass
