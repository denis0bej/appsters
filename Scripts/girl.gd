extends Area2D

var player_in_range = false

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("Interact"):
		player_in_range = false
		show_dialogue()


func show_dialogue():
	$"../../Camera2D/Dialogue".show_dialogue("Oh hey! Poor flowers...I forgot to take\ncare of them. Can you help me?")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$"../interact_button2".on()
		player_in_range = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		$"../interact_button2"._ready()
		player_in_range = false
