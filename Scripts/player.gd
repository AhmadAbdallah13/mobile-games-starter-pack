extends CharacterBody2D

var length = 64
var swiping = false

var player_allowed_positions = [195, 387, 579]

var finger_current_position: Vector2
var finger_start_position: Vector2

@export var player_health = 2


func player_move_gesture():
	if Input.is_action_just_pressed("SwipeGesture"):
		if !swiping:
			swiping = true
			finger_start_position = get_global_mouse_position()
	if Input.is_action_pressed("SwipeGesture"):
		if swiping:
			finger_current_position = get_global_mouse_position()
			if finger_current_position.distance_to(finger_start_position) >= length:
				if abs(finger_current_position.x - finger_start_position.x) >= length:
					move_player()
					swiping = false
	else:
		swiping = false
		self.velocity.x = 0

func move_player():
	var direction = 192 if finger_current_position.x > finger_start_position.x else -192
	var new_position = int(self.position.x + direction)
	self.position.x = new_position if new_position in player_allowed_positions else int(self.position.x)

func _process(delta):
	player_move_gesture()
	move_and_collide(velocity * delta, true)

func _on_player_collision_detection_body_entered(body :Node2D):
	if body.is_in_group("car"):
		body.queue_free()
		player_health -= 1
	if player_health == 0:
		queue_free()
		globals.game_over.emit()
		
