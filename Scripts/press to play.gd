extends Control

var text_hide = false

func _on_Timer_timeout():
	if !text_hide:
		$Label.hide()
		text_hide = true
	else:
		$Label.show()
		text_hide = false
	

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			queue_free()
