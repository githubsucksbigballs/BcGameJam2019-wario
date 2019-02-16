extends VisibilityNotifier2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_onScreen1_screen_exited():
	Player1.health = 0
	
	pass # replace with function body


func _on_onScreen1_viewport_exited(viewport):

	pass # replace with function body
