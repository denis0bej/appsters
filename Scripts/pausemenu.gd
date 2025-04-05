extends Control
@onready var menu: TextureRect = $Menu
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var player: CharacterBody2D = $"../.."
@onready var settings_menu: Control = $SettingsMenu
@onready var texture_rect: TextureRect = $TextureRect


var is_menu_on = true
func _ready():
	texture_rect.hide()
	settings_menu.hide()
	menu.hide()
	v_box_container.hide()
	$VBoxContainer/ResumeButton.pressed.connect(_on_resume)
	$VBoxContainer/SettingsButton.pressed.connect(_on_settings)
	$VBoxContainer/ExitButton.pressed.connect(_on_quit)

func _on_resume():
	menu.hide()
	v_box_container.hide()
	player.speed = 70
	is_menu_on = true
	texture_rect.hide()

func _on_settings():
	settings_menu.is_main = 0
	settings_menu.show()
	texture_rect.show()
	menu.hide()
	v_box_container.hide()

func _on_quit():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		if is_menu_on:
			player.speed = 0
			is_menu_on = false
			menu.show()
			v_box_container.show()
		else:
			player.speed = 70
			is_menu_on = true
			menu.hide()
			v_box_container.hide()
