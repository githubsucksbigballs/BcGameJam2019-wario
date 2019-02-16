extends KinematicBody2D

var speed = 400
var velocity = Vector2()

var hitstun = false

func hit(vel):
	hitstun = true
	get_parent().get_node("HitStun").start()
	velocity = vel

func _physics_process(delta):
	if Input.is_action_pressed('ui_right') && !hitstun:
		velocity.x = speed
	if Input.is_action_pressed('ui_left') && !hitstun:
		velocity.x = -speed
	if Input.is_action_pressed('ui_down') && !hitstun:
		velocity.y = speed
	if Input.is_action_pressed('ui_up') && !hitstun:
		velocity.y = -speed
	
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
		hitstun = true
		get_parent().get_node("HitStun").start()
		get_parent().get_node("LoopFix").start()
		if(collision.collider.has_method("hit")):
			get_parent().get_node("Player2").hit(velocity*1.5)


func _on_HitStun_timeout():
	hitstun = false


func _on_LoopFix_timeout():
	velocity = -velocity / 2


func _on_VisibilityNotifier2D_screen_exited():
	print("deleted")
	queue_free()
