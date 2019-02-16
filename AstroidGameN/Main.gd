extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()
	
func new_game():
	score = 0
	$StartTimer.start()


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawnLocation.rotation
	mob.position = $MobPath/MobSpawnLocation.position
	# adds randomness
	direction += rand_range(-PI/6, PI/6)
	mob.rotation = direction
	# sets mobs linear velocity
	#mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED),0).rotated(direction))

func _on_ScoreTimer_timeout():
	score+= 1
