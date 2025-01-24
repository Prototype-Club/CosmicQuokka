class_name Crab
extends CharacterBody2D

var playerTarget
@export var moveSpeed := 1
@export var health := 200.0
var healthBarRef : ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Finds player (may change if multiplayer
	playerTarget = get_tree().get_first_node_in_group("player")


# processes fixed delata value of 1 / 60 of a second by default, preventing the moving through walls buga
func _physics_process(delta: float) -> void:
	#Possibly have more active process for finding player (like for multiplayer)
	if playerTarget:
		chaseTarget(moveSpeed, playerTarget)
	

func chaseTarget(speed: float, target: Node2D):
	#get direction of enemy to player
	var direction := Vector2(playerTarget.position.x - position.x , playerTarget.position.y - position.y)
	velocity = direction * moveSpeed
	move_and_slide()

func take_damage():
	health -= 1
	# place animation code here later, e.g. %enemy.play_hurt()
	healthBarRef.value = health

	if health <= 0:
		queue_free()
		Global.score += 1
		get_tree().change_scene_to_file("res://Levels/outtro.tscn")
