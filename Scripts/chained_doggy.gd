extends CharacterBody2D
var PlayerInRange = false
@export var freeable = false


func _ready() -> void:
	$AnimatedSprite2D.play("cry")

func _physics_process(delta: float) -> void:
	if PlayerInRange and freeable and Input.is_action_just_pressed("rmb"):
		$AnimatedSprite2D.play("free")
		await get_tree().create_timer(1).timeout
		visible=false
		$"../doggy".visible = true
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		PlayerInRange = true
		print("DENIS")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name.contains("Player"):
		PlayerInRange = false
		print("Denis left")
