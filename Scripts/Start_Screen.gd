extends Node2D

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Options.tscn")

func _on_quit_pressed():
	get_tree().quit()
