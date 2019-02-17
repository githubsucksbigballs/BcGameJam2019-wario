extends Node

export (PackedScene) var Mob
var score
var win = false

func _ready():
	randomize()
	
	
func new_game():
	pass#$StartTimer.start()

#
func _on_StartTimer_timeout():
	print("WOW")
	$MobTimer.start()
	
func _on_MobTimer_timeout():
	print("GG")
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawnLocation.rotation
	mob.position = $MobPath/MobSpawnLocation.position
	# adds randomness
	direction += rand_range(-PI/12, PI/12)
	mob.rotation = direction
	# sets mobs linear velocity
	mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED),0).rotated(deg2rad(90)+direction))
	#$MobTimer.start()

func _on_ScoreTimer_timeout():
	score+= 1
