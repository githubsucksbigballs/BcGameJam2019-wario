extends Area2D

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



func _on_Balloon_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name.begins_with("Player1")):
		GlobalValues.health2 = GlobalValues.health2 - 1
		print("Health: " + str(GlobalValues.health1))
		print("2 Touched player")
		self.queue_free()

	if(body.name.begins_with("Top")):
		GlobalValues.health2 = GlobalValues.health2 - 3
		print("Health: " + str(GlobalValues.health1))
		print("2 Touched Top")
		self.queue_free()
		
	if(body.name.begins_with("Bottom")):
		GlobalValues.health2 = GlobalValues.health2 - 3
		print("Health: " + str(GlobalValues.health1))
		print("2 Touched Bottom")
		self.queue_free()
		
	if(body.name.begins_with("Left")):
		GlobalValues.health2 = GlobalValues.health2 - 3
		print("Health: " + str(GlobalValues.health1))
		print("2 Touched Left")
		self.queue_free()
		
	if(body.name.begins_with("Right")):
		GlobalValues.health2 = GlobalValues.health2 - 3
		print("Health: " + str(GlobalValues.health1))
		print("2 Touched Right")
		self.queue_free()	


