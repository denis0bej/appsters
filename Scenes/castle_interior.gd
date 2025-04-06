extends Node2D
@export var can_move = false
@export var target: CharacterBody2D
@export var knight: CharacterBody2D
@export var knightsAlive = 3

func _physics_process(delta: float) -> void:
	if knightsAlive == 0:
		$AnimationPlayer.play("Victory")
	if can_move:
		var direction = (target.global_position - knight.global_position).normalized()
		knight.global_position += direction * 0.6
