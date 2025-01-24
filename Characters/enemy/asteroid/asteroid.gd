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
