extends CharacterBody2D

@export var speed := 70
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
var direction := Vector2.ZERO

var artefact: bool
var can_use_art: bool #when in range of using
var in_range: bool
var art_cooldown: bool #false = no cooldown

func _ready() -> void:
	artefact = true
	can_use_art = true
	in_range = false
	art_cooldown = false

func _physics_process(delta: float) -> void:
	#Movement
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
	
	#Artefact
	if in_range and art_cooldown == false:
		can_use_art = true
	else:
		can_use_art = false
	
	if artefact == true: #player has artefact in hand
		if can_use_art == true: #didn't already use or is in range of using
			print("Press lmb to use")
			if Input.is_action_just_pressed("lmb"):
				print("used")
				art_cooldown = true
				$Timer.start(3)
				print("sdfsdf")

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

func artefact_use():
	in_range = true

func artefact_dont_use():
	in_range = false


func _on_timer_timeout() -> void:
	art_cooldown = false
