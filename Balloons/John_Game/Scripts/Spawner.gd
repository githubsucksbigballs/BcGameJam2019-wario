extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const enemy_ship = "res://Enemy.tscn"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func spawn():
	var enemy = enemy_ship.instance()
	var pos = Vector2()
	get_node("Container").add_child(enemy)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
