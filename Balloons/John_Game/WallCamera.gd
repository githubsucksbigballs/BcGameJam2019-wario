extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocity = Vector2(0,40)
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	translate(-velocity * delta * 2.5)

func _on_wall_body_entered(body):
	if(body.name.begins_with("Player1")):
		GlobalValues.health1 = 0
	elif(body.name.begins_with("Player2")):
		GlobalValues.health2 = 0
	body.queue_free()
