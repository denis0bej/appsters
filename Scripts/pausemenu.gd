extends Control
@onready var menu: TextureRect = $Menu
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var player: CharacterBody2D = $"../.."

var is_menu_on = true
func _ready():
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

func _on_settings():
	get_tree().change_scene_to_file("res://scenes/settings_menu.tscn")

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
