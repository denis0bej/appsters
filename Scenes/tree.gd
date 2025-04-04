extends CharacterBody2D

func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		body.artefact_use();


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name.contains("Player"):
		body.artefact_dont_use();
