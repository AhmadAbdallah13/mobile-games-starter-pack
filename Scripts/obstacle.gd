extends CharacterBody2D


func _process(delta):
	velocity.y = 4
	move_and_collide(velocity)
	
