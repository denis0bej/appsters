extends CharacterBody2D

var in_range:= false
@onready var inventory := $"../Camera2D/Control"

func _ready() -> void:
	inventory.cnt4
	$AnimatedSprite2D.visible = false
	pass


func _physics_process(delta: float) -> void:
	if inventory.cnt2 == 1 and in_range and Input.is_action_just_pressed("rmb") and inventory.cnt4 == 1:
		$AnimatedSprite2D.visible = true
		in_range = false
		$AnimatedSprite2D.play()
		$"../AnimatedSprite2D".play("bloom")
		$"../AnimatedSprite2D2".play("bloom")
		$"../AnimatedSprite2D3".play("bloom")
		$"../AnimatedSprite2D4".play("bloom")
		$"../Camera2D/Control/Slot4/Item4".visible = false
		$"../Camera2D/Control/Slot4/Label4".text = ""
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and inventory.cnt2 == 1:
		$"../Camera2D/RMB".visible = true
		$Label.visible = false
		in_range = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player" and inventory.cnt2 == 1:
		$"../Camera2D/RMB".visible = false
		in_range = false


func _on_animated_sprite_2d_animation_finished() -> void:
	$"../gate_castle".visible = false
	$"../gate_castle/Gate_to_castle".disabled = true
	$"../Garden_reward".play("garden_reward")
	await get_tree().create_timer(0.5).timeout
	$"../Camera2D/Dialogue".show_dialogue("Knights: *gasp*")
	await get_tree().create_timer(1.5).timeout
	$"../Camera2D/Dialogue".show_dialogue("Knight 1: Mi..Miss, may we please come and\nsee the flowers")
	await get_tree().create_timer(4).timeout
	$"../Camera2D/Dialogue".show_dialogue("Knight 2: How did they grow so fast!?")
	await get_tree().create_timer(3).timeout
	$"../Camera2D/Dialogue".show_dialogue("Princess: Sure guys!")
	await get_tree().create_timer(1.5).timeout
	$"../Camera2D/Dialogue".hide()
	await get_tree().create_timer(0.5).timeout
	$"../Camera2D/Dialogue".show()
	$"../Camera2D/Dialogue".show_dialogue("Knights: They are the most beautiful thing we\nhave ever seen")
	await get_tree().create_timer(4).timeout
	$"../Camera2D/Dialogue".hide()
