extends Node2D

@export var sceneRootNode: Node2D

@export var enemyTypes: Array[PackedScene] = [preload("res://Characters/enemy/enemy.tscn")]
@export var enemyMax: int = 30
var enemyList: Array[Node2D] = []

#@export var asteroid: PackedScene = preload("res://Characters/enemy/asteroid/asteroid.tscn")
@export var asteroids: Array[PackedScene] = [preload("res://Characters/enemy/asteroid/asteroid.tscn")]
@export var asteroidMax: int = 15
var asteroidList: Array[Node2D] = []

@export var repositionDistanceThreshold: float = 2000

var playerTarget

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Finds player (may change if multiplayer
	playerTarget = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	if playerTarget:
		position = playerTarget.position
	
func spawn_entity(scenefab) -> Node:
	var new_entity = scenefab.instantiate()
	spawn_position(new_entity)
	if sceneRootNode:
		sceneRootNode.add_child(new_entity)
	else:
		get_parent().add_child(new_entity)
	#print("spawnwing %s at: %s" % [new_entity, new_entity.global_position])
	return new_entity

func spawn_position(target):
	%PathFollow2D.progress_ratio = randf()
	target.global_position = %PathFollow2D.global_position

func spawn_enemy():
	enemyList = sanitize_array(enemyList)
	for i in enemyList:
		if !is_instance_valid(i):
			continue
		if (i.position-position).length()>repositionDistanceThreshold:
			spawn_position(i)
	
	if enemyList.size() < enemyMax:
		var new_enemy = enemyTypes[0] #TODO: pick random enemies from list
		enemyList.append(spawn_entity(new_enemy))

func spawn_asteroid():
	asteroidList = sanitize_array(asteroidList)
	for i in asteroidList:
		if !is_instance_valid(i):
			continue
		if (i.position-position).length()>repositionDistanceThreshold:
			spawn_position(i)
			
	if asteroidList.size() < asteroidMax:
		#var new_asteroid = asteroids[0] #TODO: pick random asteroid from list
		print("%s mod %s = %s" % [asteroidList.size(),asteroids.size(),asteroidList.size()%asteroids.size()])
		var new_asteroid = asteroids[asteroidList.size()%asteroids.size()] #cycles through asteroid types
		asteroidList.append(spawn_entity(new_asteroid))
		
func sanitize_array(dirty_array: Array[Node2D]) -> Array[Node2D]:
	var clean_array: Array[Node2D] = []
	for item in dirty_array:
		if is_instance_valid(item):
			clean_array.append(item)
	return clean_array

func _on_enemy_timer_timeout() -> void:
	spawn_enemy()
	spawn_asteroid()
