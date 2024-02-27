extends Node2D

var obstacles_x_ranges = [97, 289, 481]

const OBSTACLE = preload("res://Scenes/obstacle.tscn")

@onready var obstacle_container = $ObstacleContainer

func _on_objects_spawn_timeout():
	var obstacle = OBSTACLE.instantiate()
	obstacle.position = Vector2(obstacles_x_ranges.pick_random(), -50)
	obstacle_container.add_child(obstacle)

func _on_playable_area_body_exited(body):
	if body is CharacterBody2D:
		body.queue_free()
	
