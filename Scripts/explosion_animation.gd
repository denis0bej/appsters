extends AnimationPlayer
@onready var explosion_animation: AnimationPlayer = $"."
@onready var dialogue: TextureRect = $"../Dialogue"
@onready var dialogue_text: Label = $"../Dialogue_text"
@onready var timer: Timer = $Timer
@onready var area_2d: Area2D = $Area2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var animation_doggy: AnimationPlayer = $"../../../doggy/AnimationPlayer"
@onready var falling_artefact: AudioStreamPlayer = $"../../../falling_artefact"
@onready var player: CharacterBody2D = $"../.."

var typing_speed = 0.05
var isTriggered = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (isTriggered) && body.name.contains("Player"):
		isTriggered = false
		player.speed = 0
		falling_artefact.play()
		await get_tree().create_timer(4).timeout
		explosion_animation.play("explosion")
		timer.start(1.5)
	


func _on_timer_timeout() -> void:
	dialogue.show()
	dialogue_text.show()
	await start_typing("Wh...Wh..What happend?")
	wait_for_input("Interact")
	player.speed = 70
	dialogue.hide()
	dialogue_text.hide()
	animation_doggy.play("run")
	
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
