extends Node2D



func _on_animation_player_animation_finished(anim_name) -> void:
	get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
