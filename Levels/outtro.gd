extends Node2D


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$VBoxContainer.visible = true



func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
