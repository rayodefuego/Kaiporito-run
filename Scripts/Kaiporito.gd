extends KinematicBody2D

signal game_over()

export (int) var gravity = 750
export (int) var jump_force = -500
export (int) var air_jump_force = -300
export (int) var speed = 300

export(float, 0, 1.0) var friction = 0.1
export(float, 0, 1.0) var aceleration = 0.25

var velocity = Vector2.ZERO

var air_jumps = 1

func Get_input():
	var dir = 0
	if Input.is_action_pressed("go_right"):
		dir = 1
		$Kaiporito.scale.x = 1 
	if Input.is_action_pressed("go_left"):
		dir = -1
		$Kaiporito.scale.x = -1 
	if dir != 0:
		velocity.x = lerp(velocity.x, speed * dir, aceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
	

func _process(delta):
	
	velocity.y += gravity * delta
	
	Get_input()
	
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_force
			air_jumps = 1
		elif air_jumps != 0:
			velocity.y = air_jump_force
			air_jumps -= 1
	

func GameOver():
	emit_signal("game_over")

