extends Node2D

var cars_x_ranges: Array

const CAR_SCENCE = preload("res://Scenes/car.tscn")

@onready var player = $Player
@onready var cars_container: Node2D = $TrafficCarsSpawns/CarsContainer

@onready var spawn_marker_1: Marker2D = %SpawnMarker1
@onready var spawn_marker_2: Marker2D = %SpawnMarker2
@onready var spawn_marker_3: Marker2D = %SpawnMarker3

func _ready():
	globals.game_over.connect(_on_player_game_over)
	cars_x_ranges = [
		int(spawn_marker_1.position.x),
		int(spawn_marker_2.position.x),
		int(spawn_marker_3.position.x)
	]
	player.player_allowed_positions = cars_x_ranges

func _on_playable_area_body_exited(body):

	# destroy cars when exiting the playable area.
	if body is Car:
		body.queue_free()

func _on_cars_spawn_timeout():
	"""spawn cars"""
	var car = CAR_SCENCE.instantiate()
	car.position = Vector2(cars_x_ranges.pick_random(), -50)
	cars_container.add_child(car)

func _on_player_game_over():
	show()
	get_tree().call_group("game_over", "show_game_over_screen")
