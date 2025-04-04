extends Camera2D
var CamLimit1 = Vector2(0,0) #x1 y1 - x2 y2
var CamLimit2 = Vector2(0,0)
@export var target: CharacterBody2D
func _process(_delta) -> void:
	if target.position.y >= min(CamLimit1.y,CamLimit2.y) and target.position.y <= max(CamLimit1.y,CamLimit2.y):
		position = target.position
func _on_gate_front_body_entered(body: Node2D) -> void:
	CamLimit1 = $"../CameraAreas/GateFront/pos1".position
	CamLimit2 = $"../CameraAreas/GateFront/pos2".position


func _on_town_main_road_body_entered(body: Node2D) -> void:
	CamLimit1 = $"../CameraAreas/TownMainRoad/pos1".position
	CamLimit2 = $"../CameraAreas/TownMainRoad/pos2".position
