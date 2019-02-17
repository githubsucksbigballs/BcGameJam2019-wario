extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var path = ""
var t = load("res://transition.tscn")
var inst


func fade_to(scn_path):
	print("iggkggkg")
	path = scn_path
	get_child(0).get_child(0).play("fade")
	$WaitTime.start()



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_WaitTime_timeout():
	print("big")
	get_tree().change_scene(path)
