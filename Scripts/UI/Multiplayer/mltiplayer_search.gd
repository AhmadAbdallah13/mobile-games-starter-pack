extends Control

@onready var searching_label = %Searching

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().create_timer(1.5).timeout
	searching_label.text = "Found Game!"
	await get_tree().create_timer(1.5).timeout
	# redirect to the playable area.
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/world.tscn")
