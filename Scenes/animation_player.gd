extends AnimationPlayer
@onready var root = get_parent()
@onready var player = root.get_node("Player")
@onready var player_anim = root.get_node("PlayerAnimation")
func _ready() -> void:
	player.visible = false
	play("Initial Scene")


func _on_animation_finished(anim_name: StringName) -> void:
	player.position = player_anim.position
	player.get_node("AnimatedSprite2D").play("Idle_North")
	player.visible = true
	player_anim.visible = false
