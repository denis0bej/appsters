extends CharacterBody2D

func die():
	collision_layer = 0
	$Sprite2D.scale.x = 1.4
	$Sprite2D.scale.y = 0.3
	$interact_area.monitoring = false
	get_tree().current_scene.knightsAlive -= 1
	if get_parent().name.contains("Path"):
		get_parent().running = 0
	else: 
		get_parent().can_move = false


func _on_interact_area_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		get_tree().reload_current_scene()
