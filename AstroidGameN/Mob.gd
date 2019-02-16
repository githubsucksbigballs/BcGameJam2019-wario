extends RigidBody2D

export (int) var MIN_SPEED
export (int) var MAX_SPEED


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func returning():
	print("ay")