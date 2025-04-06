extends TextureRect
@onready var area_2d: Area2D = $Area2D
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D
@onready var quest_display: TextureRect = $Quest_display
@onready var quest_text: Label = $Quest_display/Quest_text
var typing_speed = 0.05
var quest_is_show = true
var isTriggered = true
var current_quest = ""
 #Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quest_display.hide()
	quest_text.hide()
	current_quest = "Get the dog outside.\nHint: yellow door"


 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("lmb") && is_mouse_over_object(collision_shape):
		if (quest_is_show) :
			quest_is_show = false
			quest_display.show()
			quest_text.show()
			start_typing(current_quest)
		else:
			quest_is_show = true
			quest_display.hide()
			quest_text.hide()
			
		
func start_typing(current_text):
	quest_text.text = ""
	var i = 0
	while i < len(current_text):
		if (quest_is_show == true):
			break
		quest_text.text += current_text[i]
		await get_tree().create_timer(typing_speed).timeout
		i += 1

func is_mouse_over_object(collision_shape: CollisionShape2D) -> bool:
	var shape = collision_shape.shape
	if shape is RectangleShape2D:
		# Obține coordonatele mouse-ului relativ la obiectul curent
		var mouse_position = get_global_mouse_position() - collision_shape.global_position
		# Verifică dacă mouse-ul este în interiorul formei
		return shape.get_rect().has_point(mouse_position)
	return false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (isTriggered) && body.name.contains("Player"):
		isTriggered = false
		current_quest = "Quest completed!"
		await start_typing(current_quest)
		await get_tree().create_timer(2.0).timeout
		current_quest = "Follow the dog"
		start_typing(current_quest)
	
	
