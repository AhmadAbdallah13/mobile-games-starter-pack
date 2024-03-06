extends Node2D

@export var WorldScene: PackedScene


func start_game():
	var world = WorldScene.instantiate()
	add_child(world)


func _on_ui_start_game():
	start_game()
