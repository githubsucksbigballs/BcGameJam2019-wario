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
		Player2.health = Player2.health - 1
		print(Player2.health)
		self.queue_free()

	if(body.name.begins_with("Top")):
		Player2.health = Player2.health - 3
		print(Player2.health)
		self.queue_free()
		
	if(body.name.begins_with("Bottom")):
		Player2.health = Player2.health - 3
		print(Player2.health)
		self.queue_free()
		
	if(body.name.begins_with("Left")):
		Player2.health = Player2.health - 3
		print(Player2.health)
		self.queue_free()
		
	if(body.name.begins_with("Right")):
		Player2.health = Player2.health - 3
		print(Player2.health)
		self.queue_free()	

	if(Player2.health == 0):
		print("Player 1 Wins!")

