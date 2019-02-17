extends Area2D


func _on_up_body_entered(body):
	if body.name.begins_with("SpaceCeil"):
		get_tree().quit()
