extends Area2D



func _on_Battery_body_entered(body):
	if(body.name.begins_with("Player1")):
		GlobalValues.score1 += 1
		print("Player1 Score: " + str(GlobalValues.score1))
	elif(body.name.begins_with("Player2")):
		GlobalValues.score2 += 1
		print("Player2 Score: " + str(GlobalValues.score2))
	queue_free()

