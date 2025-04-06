extends Area2D
@onready var dialogue: TextureRect = $"../Player/Camera2D/Dialogue"
@onready var dialogue_text: Label = $"../Player/Camera2D/Dialogue_text"
@onready var player: CharacterBody2D = $"../Player"
@onready var skip_text: Label = $"../Player/Camera2D/SkipText"
@onready var animation_player: AnimationPlayer = $"../doggy/AnimationPlayer"
@onready var animation_player1: AnimationPlayer = $"../Teleportation_/AnimationPlayer"


func _on_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		dialogue.show()
		dialogue_text.show()
		skip_text.show()
		skip_text.text = "Press [E] to skip"
		player.speed = 0
		await get_node("../Player/Camera2D/Dialogue").start_typing("What is this ?!")
		await wait_for_input("Interact")
		await get_node("../Player/Camera2D/Dialogue").start_typing("It looks like some sort of artifact...")
		animation_player.play("artifact")
		await get_tree().create_timer(1.6).timeout
		skip_text.hide()
		dialogue.hide()
		dialogue_text.hide()
		animation_player1.play("explosion")
		await get_tree().create_timer(1.6).timeout
		get_tree().change_scene_to_file("res://Scenes/village.tscn")
		player.speed = 70


func wait_for_input(action_name: String) -> void:
	while true:
		await get_tree().process_frame  # Așteaptă un frame
		if Input.is_action_just_pressed(action_name):
			break
