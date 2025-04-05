extends Camera2D

@export var target: CharacterBody2D

func _process(_delta) -> void:
	position.y = target.position.y
