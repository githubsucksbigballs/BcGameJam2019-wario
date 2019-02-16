extends RigidBody2D

export (int) var MIN_SPEED = 150
export (int) var MAX_SPEED = 250

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func isAsteroid():
	print("yeet")

func _on_Asteroid_body_entered(body):
	isAsteroid()
