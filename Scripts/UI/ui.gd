extends CanvasLayer
class_name UI

@onready var main_menu = $MainMenu
@onready var game_over_screen = $GameOverScreen

signal start_game()

func show_game_over_screen():
	show()
	game_over_screen.visible = true
	main_menu.visible = false

func _on_main_menu_start_game():
	start_game.emit()
