extends CanvasLayer
class_name UI

@onready var main_menu = $MainMenu
@onready var game_over_screen = $GameOverScreen
@onready var arena = $Arena

func show_game_over_screen():
	show()
	game_over_screen.visible = true
	main_menu.visible = false

func _on_main_menu_start_game():
	globals.start_game.emit()

func go_to_arena():
	main_menu.visible = false
	arena.visible = true
