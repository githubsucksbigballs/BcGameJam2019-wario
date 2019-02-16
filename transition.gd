extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var path = ""

func fade_to(scn_path):
	self.path = scn_path
	get_node("AnimationPlayer").play("fade")

func change_scene():
	if path !=  "":
		get_tree().change_scene(path)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
