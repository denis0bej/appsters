extends Control

@onready var dialogue_box = $TextureRect
@onready var dialogue_label = $Label

var current_text = ""
var typing_speed = 0.05  # Viteză de scriere (secunde per literă)

func _ready():
	dialogue_box.hide()
	dialogue_label.hide()

func show_dialogue(text):
	dialogue_label.show()
	dialogue_box.show()
	current_text = text
	dialogue_label.text = ""
	start_typing()

func start_typing():
	var i = 0
	while i < len(current_text):
		dialogue_label.text += current_text[i]
		await get_tree().create_timer(typing_speed).timeout
		i += 1
	
func process(delta):
	print("ddssd")
	
func hide_dialogue():
	dialogue_box.hide()
