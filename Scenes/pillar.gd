extends StaticBody2D

func _ready() -> void:
	$Timer.start(2)

func shine():
	var original_color = $Sprite2D.modulate
	var tween = create_tween()
	# Flash to blue over 0.1 seconds
	tween.tween_property($Sprite2D, "modulate", Color(0.8, 0.8, 1, 1), 0.3)
	# Then go back to original color over 0.1 seconds
	tween.tween_property($Sprite2D, "modulate", original_color, 0.3)
func _on_timer_timeout() -> void:
	shine()
	$Timer.start(2)
	
