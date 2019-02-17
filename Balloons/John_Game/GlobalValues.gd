extends CanvasLayer

var health1 = 3
var health2 = 3
var score1 = 0
var score2 = 0


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	if($MessageLabel.show()):
		$MessageTimer.start()

func show_score1(text):
	$P1Score.text = text
	$P1Score.show()

func show_score2(text):
	$P2Score.text = text
	$P2Score.show()

func total_score(text):
	$TotalScore.text = text
	$TotalScore.show()

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

