extends CharacterBody2D 

var previous_position : Vector2

func _ready():
	previous_position = position

func _process(delta):
	update_animation()
	previous_position = position 


func update_animation():
	var direction = position - previous_position
	var sprite = $AnimatedSprite2D
	if direction.length() < 0.1:
		if not sprite.is_playing() or sprite.animation != "idle":
			sprite.play("idle")
		return

	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			sprite.play("east")
		else:
			sprite.play("west")
	else:
		if direction.y > 0:
			sprite.play("south")
		else:
			sprite.play("north")
