class_name Car extends CharacterBody2D


func _process(_delta):
	velocity.y = 4
	move_and_collide(velocity)
	
