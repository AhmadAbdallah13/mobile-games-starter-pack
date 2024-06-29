extends Control

func _on_arena_btn_pressed():
	get_tree().call_group("ui", "go_to_arena")


func _on_settings_pressed() -> void:
	get_tree().call_group("ui", "show_settings_pop_up")
