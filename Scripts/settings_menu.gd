extends Control
@onready var settings_menu: Control = $"."


var is_main = 1
func _ready():
	$VolumeSlider.value_changed.connect(_on_volume_changed)
	$FullscreenCheckBox.toggled.connect(_on_fullscreen_toggled)
	$BackButton.pressed.connect(_on_back_pressed)

func _on_volume_changed(value: float):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	print("Volum setat la: ", value)

func _on_fullscreen_toggled(checked: bool):
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if checked else DisplayServer.WINDOW_MODE_WINDOWED)
	print("Fullscreen: ", checked)

func _on_back_pressed():
	if (is_main):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	else:
		settings_menu.hide()
		get_parent()._on_resume()
		
