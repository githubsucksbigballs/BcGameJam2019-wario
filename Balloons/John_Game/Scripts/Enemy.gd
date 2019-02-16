extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var velocity = Vector2()
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	translate(-velocity * delta)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
