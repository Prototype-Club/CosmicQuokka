extends CharacterBody2D

const RUNNER_DOWN = preload("res://Sprites/Example Sprites/runner_down.png")
const RUNNER_DOWN_RIGHT = preload("res://Sprites/Example Sprites/runner_down_right.png")
const RUNNER_RIGHT = preload("res://Sprites/Example Sprites/runner_right.png")
const RUNNER_UP = preload("res://Sprites/Example Sprites/runner_up.png")
const RUNNER_UP_RIGHT = preload("res://Sprites/Example Sprites/runner_up_right.png")

const UP_LEFT = Vector2.UP + Vector2.LEFT
const UP_RIGHT = Vector2.UP + Vector2.RIGHT
const DOWN_LEFT = Vector2.DOWN + Vector2.LEFT
const DOWN_RIGHT = Vector2.DOWN + Vector2.RIGHT

var max_speed := 600.0

@onready var _skin: Sprite2D = $Skin
# processes fixed delata value of 1 / 60 of a second by default, preventing the moving through walls buga
func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * max_speed
	move_and_slide()
	
	var direction_discrete := direction.sign()
	match direction_discrete:
		Vector2.RIGHT, Vector2.LEFT:
			_skin.texture = RUNNER_RIGHT
		Vector2.UP:
			_skin.texture = RUNNER_UP
		Vector2.DOWN:
			_skin.texture = RUNNER_DOWN
		UP_RIGHT, UP_LEFT:
			_skin.texture = RUNNER_UP_RIGHT
		DOWN_RIGHT, DOWN_LEFT:
			_skin.texture = RUNNER_DOWN_RIGHT
	
	if direction_discrete.length() > 0:
		_skin.flip_h = direction.x < 0.0
