extends CharacterBody2D

func die():
	scale.x = 1.3
	scale.y = 0.2
	get_parent().running = 0
