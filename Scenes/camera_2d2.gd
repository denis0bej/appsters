extends Camera2D

func _process(delta) -> void:
	position = get_parent().find_child("Player").position
