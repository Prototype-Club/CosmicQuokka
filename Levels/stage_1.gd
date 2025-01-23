extends Node2D


func _on_timer_timeout() -> void:
	pass # Replace with function body.


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true


func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
