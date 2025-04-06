extends CharacterBody2D

var previous_position : Vector2

func _ready():
	previous_position = global_position
	
	
func _physics_process(delta):
	update_animation()
	previous_position = global_position 
	
func update_animation():
	var direction = global_position - previous_position
	var sprite = $AnimatedSprite2D
	if direction.length() < 0.1:
		if not sprite.is_playing() or sprite.animation != "idle_s":
			sprite.play("idle_s")
		return

	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			sprite.play("walk_e")
		else:
			sprite.play("walk_w")
	else:
		if direction.y > 0:
			sprite.play("walk_s")
		else:
			sprite.play("walk_n")

func die():
	collision_layer = 0
	$AnimatedSprite2D.scale.x = 1.4
	$AnimatedSprite2D.scale.y = 0.3
	$interact_area.monitoring = false
	get_tree().current_scene.knightsAlive -= 1
	if get_parent().name.contains("Path"):
		get_parent().running = 0
	else: 
		get_parent().can_move = false


func _on_interact_area_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		get_tree().reload_current_scene()


##
