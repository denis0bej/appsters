extends AnimationPlayer
@onready var root = get_parent()
@onready var player = root.get_node("Player")
@onready var player_anim = root.get_node("PlayerAnimation")

@onready var dialogue_2: TextureRect = $"../Camera2D/Dialogue2"
@onready var dialogue_text: Label = $"../Camera2D/Dialogue_text"
@onready var skip_text: Label = $"../Camera2D/SkipText"



func _ready() -> void:
	player.visible = false
	play("Initial Scene")


func _on_animation_finished(anim_name: StringName) -> void:
	player.position = player_anim.position
	player.get_node("AnimatedSprite2D").play("Idle_North")
	player.visible = true
	player_anim.visible = false
