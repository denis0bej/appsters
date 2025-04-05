extends Control

var cnt2:= 0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	$Slot1/Label.text = str(cnt2)

func item2_counter() -> void:
	cnt2 = cnt2 + 1
