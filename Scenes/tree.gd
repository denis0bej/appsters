extends CharacterBody2D

var in_range:= false
var can_use_art:= false
var art_cooldown:= false
var real_apples:= false
var apple_pickup:= false
var apple_to_grab: Sprite2D

func _ready() -> void:
	$Small_tree.visible = false
	$Apple1.visible = false
	$Apple2.visible = false
	$Apple3.visible = false
	$Apple4.visible = false
	$Apple5.visible = false
	$Apple6.visible = false
	$Apple7.visible = false
	$Apple8.visible = false
	$Apple9.visible = false
	$Apple10.visible = false
	$Apple11.visible = false

func _process(delta: float) -> void:
		#Artefact
	if in_range and art_cooldown == false:
		can_use_art = true
	else:
		can_use_art = false
	
	if can_use_art == true: #didn't already use or is in range of using
		#print("Press lmb to use")
		if Input.is_action_just_pressed("lmb"):
			print("used")
			art_cooldown = true
			$Timer.start(0.7)
			$Tree_bw_anim.play("tree_bw")
	
	if apple_pickup == true:
		if Input.is_action_just_pressed("Interact"):
			interact(apple_to_grab)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		#body.artefact_use();
		in_range = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name.contains("Player"):
		#body.artefact_dont_use();
		in_range = false
		

func interact(apple: Sprite2D) -> void:
	apple.visible = false
	apple_pickup = false

func _on_apple_area_1_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple1


func _on_apple_area_2_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple2


func _on_apple_area_3_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple3


func _on_apple_area_4_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple4


func _on_apple_area_5_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple5


func _on_apple_area_6_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple6


func _on_apple_area_7_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple7


func _on_apple_area_8_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple8


func _on_apple_area_9_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple9


func _on_apple_area_10_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple10


func _on_apple_area_11_body_entered(body: Node2D) -> void:
	apple_pickup = true
	apple_to_grab = $Apple11


func _on_timer_timeout() -> void:
	print("sdfsdf")
	if real_apples == false:
		$CollisionPolygon2D.disabled = true
		$Small_tree.visible = true
		$Apple1.visible = true
		$Apple2.visible = true
		$Apple3.visible = true
		$Apple4.visible = true
		$Apple5.visible = true
		$Apple6.visible = true
		$Apple7.visible = true
		$Apple8.visible = true
		$Apple9.visible = true
		$Apple10.visible = true
		$Apple11.visible = true
		$Tree_bw_anim.visible = false
		art_cooldown = false
		real_apples = true
