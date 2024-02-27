extends CharacterBody2D

var tile_size = 64
var length = 64
var swiping = false

var player_allowed_positions = [97, 289, 481]
var player_current_positions = 289

var finger_current_position: Vector2
var finger_start_position: Vector2

const PLAYER_SPEED = -1  # to go up


func player_move_gesture():
	#position.y += PLAYER_SPEED
	
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

func _physics_process(delta):
	pass


func _on_player_collision_detection_body_entered(body :Node2D):
	if body.is_in_group("car"):
		# todo: implement two hits then game over mechanism.
		body.queue_free()
