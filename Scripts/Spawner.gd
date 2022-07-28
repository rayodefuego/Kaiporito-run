extends Node2D

var balon = preload("res://Scenes/Balon.tscn")

onready var timer = $Timer

var is_spawning = false
var game_over = false

var rng = RandomNumberGenerator.new()

export (int) var direction = 1

func _ready():
	rng.randomize()
	#timer.wait_time = rng.randf_range(1.0, 3.0)


func start_spawning():
	timer.start(rng.randf_range(1.0, 3.0))
	is_spawning = true

func _on_Timer_timeout():
	var b = balon.instance()
	b.Start(direction, position)
	get_parent().add_child(b)
	#timer.wait_time = rng.randf_range(1.0, 3.0)
	timer.start(rng.randf_range(1.0, 3.0))

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if !is_spawning:
				start_spawning()


func _on_Kaiporito_game_over():
	game_over = true
	timer.stop()
