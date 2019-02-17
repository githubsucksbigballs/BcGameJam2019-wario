extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var velocity = Vector2()

func _process(delta):
	translate(-velocity * delta * 2.5)

	if(GlobalValues.health1 == 0):
		GlobalValues.show_message("PLAYER 1 KILLED PLAYER 2.")
	elif(GlobalValues.health2 == 0):
		GlobalValues.show_message("PLAYER 2 KILLED PLAYER 1.")
	elif(GlobalValues.score1 + GlobalValues.score2 == 80):
		GlobalValues.show_message("ENERGY FULL! GOOD WORK.")

	GlobalValues.start_message(("Collect 80 batteries."))
	GlobalValues.show_score1("P1 Score: " + str(GlobalValues.score1))
	GlobalValues.show_score2("P2 Score: " + str(GlobalValues.score2))
	GlobalValues.total_score("Total Score: " + str(GlobalValues.score1 + GlobalValues.score2) + "/80")

func _on_Right_body_entered(body):
	body.queue_free()


func _on_Left_body_entered(body):
	body.queue_free()



func _on_Bottom_body_entered(body):
	body.queue_free()


func _on_Top_body_entered(body):
	body.queue_free()
