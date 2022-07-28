extends KinematicBody2D

export (int) var speed = 1

var direction = 1

func _process(delta):
	var move_vector = Vector2(speed * direction * delta, 0)
	var collision = move_and_collide(move_vector, delta)
	if collision:
		if collision.collider.has_method("GameOver"):
			collision.collider.GameOver()
			queue_free()

func Start(dir, pos):
	direction = dir
	position = pos
