extends CharacterBody2D
@export var can_move = false
@onready var target = get_parent().get_node("Player")
func _physics_process(delta: float) -> void:
	if can_move:
		var direction = (target.global_position - global_position).normalized()
		global_position += direction * 0.6
func die():
	collision_layer = 0
	can_move = false
	$Sprite2D.scale.x = 1.4
	$Sprite2D.scale.y = 0.3
