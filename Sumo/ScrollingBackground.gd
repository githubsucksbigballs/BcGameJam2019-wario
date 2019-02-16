extends ParallaxLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)

func _process(delta):
	var curPos = position
	curPos.x = curPos.x - 10 *delta
	position = curPos
