extends Control


func _on_restart_btn_pressed():
	hide()
	get_tree().reload_current_scene()
