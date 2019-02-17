extends KinematicBody2D

var speed = 400
var velocity = Vector2()

var hitstun = false

var win = false

func _ready():
	get_parent().get_node("MessageTimer").start()
	hitstun = true

func hit(vel):
	hitstun = true
	$AnimatedSprite.animation = "oof"
	get_parent().get_node("HitStun2").start()
	velocity = vel

func _physics_process(delta):
	if Input.is_key_pressed(KEY_D) && !hitstun:
		velocity.x = speed
		$AnimatedSprite.flip_h = true
	if Input.is_key_pressed(KEY_A) && !hitstun:
		velocity.x = -speed
		$AnimatedSprite.flip_h = false
	if Input.is_key_pressed(KEY_S) && !hitstun:
		velocity.y = speed
	if Input.is_key_pressed(KEY_W) && !hitstun:
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
		get_parent().get_node("HitStun2").start()
		if(collision.collider.has_method("hit")):
			get_parent().get_node("LoopFix2").start()
			get_parent().get_node("Player3").hit(velocity*2)
		if(collision.collider.has_method("isAsteroid")):
			velocity = -velocity
		

func _on_HitStun2_timeout():
	hitstun = false
	$AnimatedSprite.animation = "default"


func _on_LoopFix2_timeout():
	velocity = -velocity / 2


func _on_VisibilityNotifier2D_screen_exited():
	get_parent().get_node("MessageLabel").text = "Arrow Key Player\n has won!"
	get_parent().get_node("MessageLabel").show()
	get_parent().get_node("MobTimer").stop()
	get_parent().get_node("WinTimer").start()
	get_parent().get_node("Player3").win = true
	
func _on_MessageTimer_timeout():
	get_parent().get_node("MessageLabel").hide()
	hitstun = false

func _on_WinTimer_timeout():
	queue_free()
	if(win):
		transition.fade_to("res://Cameron Stuff/Main Menu/MainMenu.tscn")
