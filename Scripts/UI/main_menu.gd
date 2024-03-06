extends Control

signal start_game()


func _on_start_game_alone_btn_pressed():
	start_game.emit()
	await get_tree().create_timer(.3).timeout
	hide()
