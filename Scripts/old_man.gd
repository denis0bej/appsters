extends Area2D
@export var interaction_text: String = "Salut, ceafa lata"

var player_in_range = false

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body.name == "Player":
		player_in_range = true
		print("Apasă 'E' pentru a vorbi.")

func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("Interact"):
		show_dialogue()

func show_dialogue():
	get_node("/root/MainScene/Dialogue").show_dialogue("Salut, aventurierule!")
