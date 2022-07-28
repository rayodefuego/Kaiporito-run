extends Control

var score = 0

var start = false
var game_over = false

func _ready():
	$Label.text = str("puntaje: ", score)

func _on_Timer_timeout():
	score += 100
	$Label.text = str("puntaje: ", score)

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if !start:
				$Timer.start()
				start = true


func _on_Kaiporito_game_over():
	game_over = true
	$Timer.stop()
