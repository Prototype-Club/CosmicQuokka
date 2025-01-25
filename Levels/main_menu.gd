extends Node2D


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/intro.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	$CreditsWindow.visible = true


func _on_back_pressed() -> void:
	$CreditsWindow.visible = false
