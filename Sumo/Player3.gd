extends KinematicBody2D

var speed = 400
var velocity = Vector2()

var hitstun = false

func _ready():
	get_parent().get_node("MessageTimer").start()
	get_parent().get_node("MobTimer").start()
	hitstun = true

func hit(vel):
	hitstun = true
	$AnimatedSprite.animation = "oof"
	get_parent().get_node("HitStun").start()
	velocity = vel

func _physics_process(delta):
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
	
	if (velocity.x > 0):
		velocity.x -= 10
		
	if (velocity.x < 0):
		velocity.x += 10
	
	if (velocity.y > 0):
		velocity.y -= 10
	
	if (velocity.y < 0):
		velocity.y += 10
	
#	if velocity.x != 0:
#		$AnimatedSprite.flip_v = false
#		$AnimatedSprite.flip_h = velocity.x < 0
#	elif velocity.y != 0:
#		$AnimatedSprite.flip_v = velocity.y > 0

	var collision = move_and_collide(velocity * delta)
	if collision:
		hitstun = true
		get_parent().get_node("HitStun").start()
		if(collision.collider.has_method("hit")):
			get_parent().get_node("LoopFix").start()
			get_parent().get_node("Player2").hit(velocity*2)
		if(collision.collider.has_method("isAsteroid")):
			velocity = -velocity


func _on_HitStun_timeout():
	hitstun = false
	$AnimatedSprite.animation = "default"


func _on_LoopFix_timeout():
	velocity = -velocity / 2


func _on_VisibilityNotifier2D_screen_exited():
	get_parent().get_node("MessageLabel").text = "WASD Key Player\n has won!"
	get_parent().get_node("MessageLabel").show()
	get_parent().get_node("Player2").hitstun = true
	get_parent().get_node("MobTimer").stop()
	queue_free()


func _on_MessageTimer_timeout():
	get_parent().get_node("MessageLabel").hide()
	hitstun = false
	
