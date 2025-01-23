extends CharacterBody2D

signal health_depleted

var health = 100.0

# processes fixed delata value of 1 / 60 of a second by default, preventing the moving through walls buga
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	
	
	if velocity.length() > 0.0:
		pass
		#place animation code here later, e.g. %Quokka.play_walk_animation()
	else:
		pass
		# place animation code here later, e.g. %Quokka.play_idle_animation()
	
	const DAMAGE_RATE = 5.0
	var overlapping_mobs =  %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
