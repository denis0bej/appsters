extends Area2D

var player_in_range = false

func _ready():
	pass

func _on_body_entered(body):
	if body.name == "Player":
		$"../interact_button2".on()
		player_in_range = true
		print("Apasă 'E' pentru a vorbi.")

func _on_body_exited(body):
	if body.name == "Player":
		$"../interact_button2"._ready()
		player_in_range = false
	

func _physics_process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("Interact"):
		player_in_range = false
		$"../../Camera2D/Dialogue".show()
		show_dialogue()


func show_dialogue():
	var inventory := $"../../Camera2D/Control"
	var bought:= false
	if bought == false:
		if inventory.cnt4 >= 10:
			$"../../Camera2D/Dialogue".show_dialogue("Pleasure doing business with you")
			inventory.cnt4 = 1
			inventory.cnt2 = 1
			$"../../Camera2D/Control/Slot4/Label4".text = "1"
			$"../../Camera2D/Control/Slot2/Item2".texture = $"../Artefact_fw".texture
			$"../Artefact_fw".visible = false
			bought = true
		else:
			$"../../Camera2D/Dialogue".show_dialogue("10 apples for a rock?\nThat's a steal to mee")
