# paddle.gd
extends Area2D

const MOVE_SPEED = 100

var _ball_dir
var _up
var _down

@onready var _screen_size_y = get_viewport_rect().size.y # allows for responsive (web term) upper/lower bounds

func _ready():
	# as there are 2 paddles being controlled by the same code
	# name = the name you give the node in the node tree
	var n = String(name).to_lower()
	_up = n + "_move_up"
	_down = n + "_move_down"
	if n == "left":
		_ball_dir = 1
	else:
		_ball_dir = -1


func _process(delta):
	# Move up and down based on input.
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up) # todo
	position.y = clamp(position.y + input * MOVE_SPEED * delta, 16, _screen_size_y - 16) # force number to be between 2 values, in this case, 0 < where pos.y will be < screen_size (also account for paddle width is where the 16 comes from)


func _on_area_entered(area):
	if area.name == "Ball":
		# Assign new direction.
		area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
