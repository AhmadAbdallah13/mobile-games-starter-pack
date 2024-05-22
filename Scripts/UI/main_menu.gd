extends Control

func _on_arena_btn_pressed():
	get_tree().call_group("ui", "go_to_arena")
