extends Node2D


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/stage_1.tscn")
