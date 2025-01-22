extends Node2D

@export var sceneRootNode: Node2D
var playerTarget

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Finds player (may change if multiplayer
	playerTarget = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	if playerTarget:
		position = playerTarget.position

func spawn_enemy():
	var new_enemy = preload("res://Characters/enemy/enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	if sceneRootNode:
		sceneRootNode.add_child(new_enemy)
	else:
		get_parent().add_child(new_enemy)
	
	print("spawnwing enemy at: %s" % new_enemy.global_position)


func _on_timer_timeout() -> void:
	spawn_enemy()
