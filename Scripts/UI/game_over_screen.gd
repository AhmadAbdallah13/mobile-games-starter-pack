extends Control


func _on_restart_btn_pressed():
	get_tree().reload_current_scene()

func show_game_over_screen():
	show()
	visible = true
