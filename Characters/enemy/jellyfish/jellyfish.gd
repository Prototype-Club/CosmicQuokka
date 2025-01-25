extends Enemy
class_name Jellyfish

@export var windUpTime : float = 0.3

func chaseTarget(speed: float, target: Node2D):
	#get direction of enemy to player
	var direction := Vector2(playerTarget.position.x - position.x , playerTarget.position.y - position.y).normalized()	
	if velocity.length() > 200:
		velocity *= 0.95
	else:
		velocity = direction * velocity.length()
		var RotationTarget = direction.angle() + PI/2
		rotation = lerp_angle(rotation, RotationTarget, 0.1)
	move_and_slide()

func speedBurst():
	var direction := Vector2(playerTarget.position.x - position.x , playerTarget.position.y - position.y).normalized()
	await get_tree().create_timer(windUpTime).timeout
	velocity = direction * moveSpeed
