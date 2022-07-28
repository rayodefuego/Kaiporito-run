extends Control

var can_reload = false

func _on_Kaiporito_game_over():
	show()
	$Timer.start()


func _on_Timer_timeout():
	$pres.show()
	can_reload = true

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if can_reload:
				get_tree().reload_current_scene()
