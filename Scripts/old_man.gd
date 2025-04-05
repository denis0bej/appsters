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
		show_dialogue()


func show_dialogue():
	$"../../Camera2D/Dialogue".show_dialogue("Sup homie, i got a cool rock, trade you\nfor that pookie u got there?")
	
