extends TextureRect
@onready var label: Label = $"../Dialogue_text"
@onready var texture_rect: TextureRect = $"."
var current_text = ""
@onready var player: CharacterBody2D = $"../.."
var typing_speed = 0.05
@onready var skip_text: Label = $"../SkipText"

func _ready() -> void:
	player.still = true
	texture_rect.show()
	skip_text.text = "Press [E] to skip"
	await start_typing("What a beautiful and sunny sunday is today!")
	await wait_for_input("Interact")
	await start_typing("I should get my dog for a walk!")
	await wait_for_input("Interact")
	label.text = ""
	texture_rect.hide()
	skip_text.text = ""
	player.still = false

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
# Called every frame. 'delta' is the elapsed time since the previous frame.
