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




func _on_Balloon1_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name.begins_with("Player2")):
		GlobalValues.health1 = GlobalValues.health1 - 1
		print("Health: " + str(GlobalValues.health1))
		print("1 Touched player")
		self.queue_free()
		
	if(body.name.begins_with("Top")):
		GlobalValues.health1 = GlobalValues.health1- 3
		print("Health: " + str(GlobalValues.health1))
		print("1 Touched Top")
		self.queue_free()
		
	if(body.name.begins_with("Bottom")):
		GlobalValues.health1 = GlobalValues.health1 - 3
		print("Health: " + str(GlobalValues.health1))
		print("1 Touched Bottom")
		self.queue_free()
		
	if(body.name.begins_with("Left")):
		GlobalValues.health1 = GlobalValues.health1 - 3
		print("Health: " + str(GlobalValues.health1))
		print("1 Touched Left")
		self.queue_free()
		
	if(body.name.begins_with("Right")):
		GlobalValues.health1 = GlobalValues.health1 - 3
		print("Health: " + str(GlobalValues.health1))
		print("1 Touched Right")
		self.queue_free()	

