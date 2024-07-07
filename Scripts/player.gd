class_name Player extends CharacterBody2D

const SWIPE_LENGTH = 64
const LANE_DIFF_LENGTH = 192

var swiping = false

var player_allowed_positions : Array

var finger_current_position: Vector2
var finger_start_position: Vector2

# How fast the player moves in meters per second.
@export var speed = 14

@export var player_health = 2

#func _ready() -> void:
	#velocity.y += speed

func _process(delta):
	print(velocity.y)
	velocity.y += speed * delta
	player_move_gesture()
	move_and_collide(velocity * delta, true)

func player_move_gesture():
	if Input.is_action_just_pressed("SwipeGesture"):
		if !swiping:
			swiping = true
			finger_start_position = get_global_mouse_position()
	if Input.is_action_pressed("SwipeGesture"):
		if swiping:
			finger_current_position = get_global_mouse_position()
			if finger_current_position.distance_to(finger_start_position) >= SWIPE_LENGTH:
				if abs(finger_current_position.x - finger_start_position.x) >= SWIPE_LENGTH:
					move_player()
					swiping = false
	else:
		swiping = false
		velocity.x = 0

func move_player():
	var direction = 192 if finger_current_position.x > finger_start_position.x else -192
	var new_position = int(position.x + direction)
	position.x = new_position if new_position in player_allowed_positions else int(position.x)

func _on_player_collision_detection_body_entered(body :Node2D):
	if body is Car:
		body.queue_free()
		player_health -= 1

	if player_health == 0:
		queue_free()
		globals.game_over.emit()
		
