extends Camera2D
var hLim1
var hLim2
var vertical = false
@export var target: CharacterBody2D
@export var AreaPosition: Vector2

func _ready() -> void:
	pass
func _process(_delta) -> void:
	if vertical:
		position.y = clamp(target.position.y,min(hLim1,hLim2),max(hLim1,hLim2))
	else:
		position = lerp(position, AreaPosition, 0.1)
func _on_gate_front_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		vertical = false
		AreaPosition = $"../CameraAreas/GateFront/CollisionShape2D".position
		print("Entered gate area")

func _on_town_main_road_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		vertical = true
		print("Entered town main road")
		
		hLim2 = $"../CameraAreas/TownMainRoad/pos1".position.y
		hLim1 = $"../CameraAreas/TownMainRoad/pos2".position.y
		print(hLim1)
		print(hLim2)
