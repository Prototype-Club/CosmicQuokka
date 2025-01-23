extends Node2D


func _ready() -> void:
	%Countdown.start()

func distance_to_earth():
	var time_left = %Countdown.time_left
	var second = int(time_left)
	return [second]


func _process(delta: float) -> void:
	%DistanceLabel.text = "Distance to Earth: %02d au" %distance_to_earth()
	%ScoreLabel.text = str(Global.score)
	
	if Input.is_action_just_pressed("Pause"):
		%GameOver.visible = true
		get_tree().paused = true
	


func _on_countdown_timeout() -> void:
	$EnemyManager.process_mode = Node.PROCESS_MODE_DISABLED
	$EnemyManager2.process_mode = Node.PROCESS_MODE_INHERIT


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	$GameOver/ColorRect/Retry.visible = true
	$GameOver/ColorRect/Resume.visible = false
	get_tree().paused = true


func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	%GameOver.visible = false
	get_tree().paused = false
