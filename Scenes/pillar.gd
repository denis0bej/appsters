extends StaticBody2D
var broken = false
var midAnimation = false
var PlayerInRangeLeft = false
var PlayerInRangeRight = false
var DamageDirection = "Left"
@onready var Sprite = $AnimatedSprite2D

func _ready() -> void:
	$Timer.start(2)
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("rmb") and !broken and !midAnimation:
		if PlayerInRangeLeft:
			_break("Right")
		elif PlayerInRangeRight:
			_break("Left")
	if Input.is_action_just_pressed("lmb") and broken and !midAnimation:
		if PlayerInRangeLeft or PlayerInRangeRight:
			_repair()

func _break(direction: String):
	midAnimation = true
	if direction == "Left":
		DamageDirection = "Left"
		Sprite.flip_h = true
	else:
		DamageDirection = "Right"
	$DamageTimer.start(1)
	
	Sprite.play("break")
	broken = true
	await Sprite.animation_finished
	midAnimation = false
func DealDamage(direction: String):
	if direction == "Left":
		$Area2D/Left.disabled = false
	elif direction == "Right":
		$Area2D/Right.disabled = false
	$Timer2.start(0.3)
func _repair():
	midAnimation = true
	Sprite.play("repair")
	broken = false
	await Sprite.animation_finished
	midAnimation = false
	Sprite.flip_h = false
func shine_blue():
	var original_color = Sprite.modulate
	var tween = create_tween()
	# Flash to blue over 0.1 seconds
	tween.tween_property(Sprite, "modulate", Color(0.8, 0.8, 1, 1), 0.3)
	# Then go back to original color over 0.1 seconds
	tween.tween_property(Sprite, "modulate", original_color, 0.3)
func shine_red():
	var original_color = Sprite.modulate
	var tween = create_tween()
	# Flash to blue over 0.1 seconds
	tween.tween_property(Sprite, "modulate", Color(1, 0.8, 0.8, 1), 0.3)
	# Then go back to original color over 0.1 seconds
	tween.tween_property(Sprite, "modulate", original_color, 0.3)
func _on_timer_timeout() -> void:
	if !broken:
		shine_blue()
	else:
		shine_red()
	$Timer.start(2)
func _on_right_area_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		PlayerInRangeRight = true
func _on_right_area_body_exited(body: Node2D) -> void:
	if body.name.contains("Player"):
		PlayerInRangeRight = false
func _on_left_area_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		PlayerInRangeLeft = true
func _on_left_area_body_exited(body: Node2D) -> void:
	if body.name.contains("Player"):
		PlayerInRangeLeft = false
func _on_damage_timer_timeout() -> void:
	DealDamage(DamageDirection)

func _on_timer_2_timeout() -> void:
	$Area2D/Left.disabled = true
	$Area2D/Right.disabled = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.contains("knight"):
		body.die()
