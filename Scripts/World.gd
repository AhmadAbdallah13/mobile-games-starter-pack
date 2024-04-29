extends Node2D

var cars_x_ranges = [97, 289, 481]

const CAR = preload("res://Scenes/car.tscn")
const PLAYER = preload("res://Scenes/player.tscn")

@onready var player = $Player
@onready var cars_container = $CarsContainer

func _on_playable_area_body_exited(body):
	if body is CharacterBody2D:
		body.queue_free()

func _on_cars_spawn_timeout():
	var car = CAR.instantiate()
	car.position = Vector2(cars_x_ranges.pick_random(), -50)
	cars_container.add_child(car)

func _on_player_game_over():
	show()
	get_tree().call_group("game_over", "show_game_over_screen")
