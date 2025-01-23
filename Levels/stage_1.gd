extends Node2D


func _ready() -> void:
	%Countdown.start()

func distance_to_earth():
	var time_left = %Countdown.time_left
	var second = int(time_left)
	return [second]


func _process(delta: float) -> void:
	%DistanceLabel.text = "Distance to Earth: %02d AU" %distance_to_earth()
	%ScoreLabel.text = str(Global.score)


func _on_countdown_timeout() -> void:
	$EnemyManager.visible = false
	


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true


func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
