extends Enemy
class_name Asteroid

var rotationSpeed = 0
var moveDirection = 0
var speed = 0

func _ready() -> void:
	set_parameters()

func _physics_process(delta: float) -> void:
	rotation += rotationSpeed/20
	#move_and_slide()

func set_parameters():
	rotationSpeed = randf_range(-1,1)
	scale *= randf_range(0.7,1.1)
	moveDirection = randf_range(0,360)
	rotation_degrees = moveDirection
	#speed = randf_range(0,100)
	
	#velocity = speed * Vector2.RIGHT.rotated(deg_to_rad(moveDirection))
	
	#print("moveDirection: %s" % moveDirection)
	#print("Velocity: %s" % velocity)

func destroy():
	queue_free()
	
	const AsteroidParticles = preload("res://Characters/enemy/asteroid/asteroid_particles.tscn")
	var bang = AsteroidParticles.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	get_parent().add_child(bang)
	bang.global_position = global_position
	
