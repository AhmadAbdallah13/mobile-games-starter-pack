extends CanvasLayer
class_name UI

@onready var main_menu = $MainMenu
@onready var game_over_screen = $GameOverScreen

signal start_game()

func _on_player_game_over():
	game_over_screen.visible = true


func _on_main_menu_start_game():
	start_game.emit()
