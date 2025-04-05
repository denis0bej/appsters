extends Control

var nr_item:= 0
var cnt1:= 0
var cnt2:= 0
var cnt3:= 0
var cnt4:= 0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	
	if cnt1 > 1:
		$Slot1/Label.text = str(cnt1)
	if cnt2 > 1:
		$Slot2/Label2.text = str(cnt2)
	if cnt3 > 1:
		$Slot3/Label3.text = str(cnt3)
	if cnt4 > 1:
		$Slot4/Label4.text = str(cnt4)

func item_counter() -> void:
	if nr_item == 1:
		cnt1 = cnt1 + 1
	elif nr_item == 2:
		cnt2 = cnt2 + 1
	elif nr_item == 3:
		cnt3 = cnt3 + 1
	elif nr_item == 4:
		cnt4 = cnt4 + 1

func item_slot(nr) -> void:
	nr_item = nr
