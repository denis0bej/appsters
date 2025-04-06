extends PathFollow2D
var running = 1
func _physics_process(delta: float) -> void:
	progress += 1*running
