extends Node2D

@export var WorldScene: PackedScene


func start_game():
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/world.tscn")

func _on_ui_start_game():
	start_game()
