extends KinematicBody2D

var speed = 400
var velocity = Vector2()
var friction = 0.3

func hit():
	print("neat")
	pass

func _physics_process(delta):
	if Input.is_action_pressed('ui_right'):
		velocity.x = speed
	elif Input.is_action_pressed('ui_left'):
		velocity.x = -speed
	elif Input.is_action_pressed('ui_down'):
		velocity.y = speed
	elif Input.is_action_pressed('ui_up'):
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
		velocity = velocity.bounce(collision.normal)
