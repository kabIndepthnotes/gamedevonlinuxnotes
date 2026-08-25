# ball.gd
extends Area2D

const DEFAULT_SPEED = 100
var _speed = DEFAULT_SPEED
var direction = Vector2.LEFT # go to the left at the start
@onready var _initial_pos = position

func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction


func reset():
	direction = Vector2(direction.x,0)
	position = _initial_pos
	_speed = DEFAULT_SPEED
	print("reseting!")
