extends TextureRect
@onready var dialogue: TextureRect = $"."
@onready var label: Label = $"../Dialogue_text"
@onready var animation_player: AnimationPlayer = $"../../../Teleportation_/AnimationPlayer"
var typing_speed = 0.05
@onready var player: CharacterBody2D = $"../.."
@onready var skip_text: Label = $"../SkipText"
@onready var animation_player1: AnimationPlayer = $"../../../doggy/AnimationPlayer"
@onready var ending: Sprite2D = $"../ending"
@onready var animation_player2: AnimationPlayer = $"../ending/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.hide()
	dialogue.hide()
	skip_text.hide()
	ending.hide()
	animation_player.play("explosion")
	player.still = true
	await get_tree().create_timer(2.0).timeout
	label.show()
	dialogue.show()
	skip_text.show()
	skip_text.text = "Press [E] to skip"
	await start_typing("WHAAAA...")
	await wait_for_input("Interact")
	await start_typing("What a day...")
	await wait_for_input("Interact")
	await start_typing("Who's a good boy?")
	await wait_for_input("Interact")
	await start_typing("Woof, woof, woof")
	await wait_for_input("Interact")
	label.hide()
	dialogue.hide()
	skip_text.hide()
	player.still = false
	animation_player1.play("ending")
	await get_tree().create_timer(3.8).timeout
	label.show()
	dialogue.show()
	skip_text.show()
	await start_typing("Don't runnnn, you know last time \n it didn't end well!!")
	await wait_for_input("Interact")
	label.hide()
	dialogue.hide()
	skip_text.hide()
	ending.show()
	animation_player2.play("ending")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_typing(current_text):
	label.text = ""
	var i = 0
	while i < len(current_text):
		label.text += current_text[i]
		await get_tree().create_timer(typing_speed).timeout
		i += 1
		if Input.is_action_just_pressed("Interact"):
			label.text = current_text  # Arată tot textul instantaneu
			break 
		
		
func wait_for_input(action_name: String) -> void:
	while true:
		await get_tree().process_frame  # Așteaptă un frame
		if Input.is_action_just_pressed(action_name):
			break
