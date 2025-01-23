extends RigidBody2D

var rotationSpeed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotationSpeed = randf_range(-1,1)
	print(rotationSpeed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	rotation += rotationSpeed/20
