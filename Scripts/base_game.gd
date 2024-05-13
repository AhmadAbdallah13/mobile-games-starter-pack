extends Node2D

@export var WorldScene: PackedScene


func change_to_game_scene():
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/world.tscn")

func _on_ui_start_game():
	change_to_game_scene()
