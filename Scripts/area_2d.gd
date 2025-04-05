extends Area2D
@onready var dialogue: TextureRect = $"../Camera2D/Dialogue"
@onready var dialogue_text: Label = $"../Camera2D/Dialogue_text"



func _on_body_entered(body: Node2D) -> void:
	print("dnjdd")
	if body.name.contains("Player"):
		dialogue.show()
		dialogue_text.show()
	
