extends CharacterBody2D
var PlayerInRange = false
@export var freeable = false
@onready var animation_player: AnimationPlayer = $"../doggy/AnimationPlayer"
@onready var dialogue_2: TextureRect = $"../Camera2D/Dialogue2"
@onready var dialogue_text: Label = $"../Camera2D/Dialogue_text"
var typing_speed = 0.05
@onready var animation_player2: AnimationPlayer = $"../Teleportation_/AnimationPlayer"

func _ready() -> void:
	$AnimatedSprite2D.play("cry")

func _physics_process(delta: float) -> void:
	if PlayerInRange and freeable and Input.is_action_just_pressed("rmb"):
		$AnimatedSprite2D.play("free")
		await get_tree().create_timer(1).timeout
		visible=false
		$"../doggy".visible = true
		animation_player.play("final")
		await get_tree().create_timer(6).timeout
		dialogue_2.show()
		dialogue_text.text = ""
		dialogue_text.show()
		start_typing("Oh buddy...")
		await get_tree().create_timer(3).timeout
		start_typing("I think I know how to go back home")
		await get_tree().create_timer(2.5).timeout
		start_typing("I think if I touch these 2 gems, it will do")
		await get_tree().create_timer(2.5).timeout
		start_typing("*Click*")
		await get_tree().create_timer(1).timeout
		dialogue_2.hide()
		dialogue_text.hide()
		animation_player2.play("explosion")
		get_tree().change_scene_to_file("res://Scenes/ending.tscn")
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		PlayerInRange = true
		print("DENIS")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name.contains("Player"):
		PlayerInRange = false
		print("Denis left")

func start_typing(current_text):
	dialogue_text.text = ""
	var i = 0
	while i < len(current_text):
		dialogue_text.text += current_text[i]
		await get_tree().create_timer(typing_speed).timeout
		i += 1
		if Input.is_action_just_pressed("Interact"):
			dialogue_text.text = current_text  # Arată tot textul instantaneu
			break 
		
		
func wait_for_input(action_name: String) -> void:
	while true:
		await get_tree().process_frame  # Așteaptă un frame
		if Input.is_action_just_pressed(action_name):
			break
