extends TextureRect
@onready var label: Label = $"../Dialogue_text"
@onready var skip_text: Label = $"../SkipText"
@onready var dialogue_2: TextureRect = $"."
var typing_speed = 0.05
@onready var audio_stream_player_2: AudioStreamPlayer = $"../../AudioStreamPlayer2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue_2.hide()
	label.hide()
	skip_text.hide()
	await get_tree().create_timer(0.5).timeout
	dialogue_2.show()
	label.show()
	skip_text.show()
	await start_typing("*GASP*")
	await get_tree().create_timer(0.5).timeout
	dialogue_2.hide()
	label.hide()
	skip_text.hide()
	await get_tree().create_timer(5.5).timeout
	dialogue_2.show()
	label.show()
	skip_text.show()
	await start_typing("GUARDS GET HIM!")
	await get_tree().create_timer(0.5).timeout
	dialogue_2.hide()
	label.hide()
	skip_text.hide()
	audio_stream_player_2.play()


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
