extends Label

func show(txt):
	text = txt
	get_child(0).play("show")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_child(0).stop()
