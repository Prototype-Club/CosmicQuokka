extends Area2D



func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0] #can also use .front() at the end
		look_at(target_enemy.global_position)

	match Global.score:
		50:
			$Timer.wait_time = 0.22
		150:
			$Timer.wait_time = 0.2
		300:
			$Timer.wait_time = 0.16


func shoot():
	const BULLET = preload("res://Characters/quokka/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout():
	shoot()
