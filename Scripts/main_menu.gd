extends Control


func _ready():
	$VBoxContainer/StartButton.pressed.connect(_on_start_pressed)
	$VBoxContainer/SettingsButton.pressed.connect(_on_options_pressed)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	print("Start Game")  # Sau schimbă scena aici
	get_tree().change_scene_to_file("res://Scenes/intro.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
