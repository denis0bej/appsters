extends Control
@onready var doggy: CharacterBody2D = $doggy
@onready var animation_player: AnimationPlayer = $doggy/AnimationPlayer
@onready var v_box_container_2: VBoxContainer = $VBoxContainer2
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var label: Label = $Label


func _ready():
	animation_player.play("main_menu")
	v_box_container_2.hide()
	$VBoxContainer/StartButton.pressed.connect(_on_start_pressed)
	$VBoxContainer/SettingsButton.pressed.connect(_on_options_pressed)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	print("Start Game")  # Sau schimbă scena aici
	get_tree().change_scene_to_file("res://Scenes/intro.tscn")

func _on_options_pressed():
	v_box_container.hide()
	v_box_container_2.show()
	label.hide()
	

func _on_quit_pressed():
	get_tree().quit()
