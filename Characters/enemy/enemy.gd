extends CharacterBody2D

var playerTarget
var moveSpeed := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerTarget = get_tree().get_first_node_in_group("player")


# processes fixed delata value of 1 / 60 of a second by default, preventing the moving through walls buga
func _physics_process(delta: float) -> void:
	#get direction of enemy to player
	var direction := Vector2(playerTarget.position.x - position.x , playerTarget.position.y - position.y)
	velocity = direction * moveSpeed
	move_and_slide()
