extends CharacterBody2D

@export var speed := 70
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
var direction := Vector2.ZERO
@export var still:= true


func _physics_process(delta: float) -> void:
	#Movement
	if still == false:
		direction.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
		direction.y = Input.get_action_strength("walk_down") - Input.get_action_strength("walk_up")
		
		if direction != Vector2.ZERO:
			direction = direction.normalized()
			velocity = direction * speed
			move_and_slide()
			play_walk_animation(direction)
		else:
			velocity = Vector2.ZERO
			anim_sprite.stop()
		global_position = global_position.snapped(Vector2.ONE)
	

func play_walk_animation(dir: Vector2) -> void:
	if abs(dir.x) >= abs(dir.y):
		if dir.x > 0:
			anim_sprite.play("Run_East")
		else:
			anim_sprite.play("Run_West")
	else:
		if dir.y > 0:
			anim_sprite.play("Run_South")
		else:
			anim_sprite.play("Run_North")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	still = false


func _on_animation_player_animation_started(anim_name: StringName) -> void:
	still = true
