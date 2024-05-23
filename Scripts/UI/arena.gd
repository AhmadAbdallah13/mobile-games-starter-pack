extends Control


func _on_compete_online_pressed():
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/UI/Multiplayer/mltiplayer_search.tscn")
