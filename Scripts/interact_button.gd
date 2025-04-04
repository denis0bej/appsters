extends Control
@onready var texture_rect: TextureRect = $TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	texture_rect.hide()

func on():
	texture_rect.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
