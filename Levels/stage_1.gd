extends Node2D


func _ready() -> void:
	%Countdown.start()

func distance_to_earth():
	var time_left = %Countdown.time_left
	var second = int(time_left)
	return [second+1]


func _process(delta: float) -> void:
	if %Countdown.time_left > 0:
		%DistanceLabel.text = "Distance to Earth: %02d au" %distance_to_earth()
	elif %Countdown.time_left < 1:
		%DistanceLabel.text = "Distance to Earth: 0.002569 au"
	
	%ScoreLabel.text = str(Global.score)
	
	
	if Input.is_action_just_pressed("Pause"):
		print("pause pressed")
		%GameOver.visible = true
		%GameOver/ColorRect/Label.text = "Paused"
		get_tree().paused = true



func _on_countdown_timeout() -> void:
	%CrabHealth.visible = true


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	%GameOver/ColorRect/Label.text = "Game Over"
	$GameOver/ColorRect/VBoxContainer/Retry.visible = true
	$GameOver/ColorRect/VBoxContainer/Resume.visible = false
	get_tree().paused = true


func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	%GameOver.visible = false
	get_tree().paused = false
