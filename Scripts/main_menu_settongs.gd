extends VBoxContainer
@onready var fullscreen_check_box: CheckBox = $Label4/FullscreenCheckBox
@onready var v_box_container_2: VBoxContainer = $"."
@onready var v_box_container: VBoxContainer = $"../VBoxContainer"
@onready var label: Label = $"../Label"

func _ready():
	$VolumeSlider.value_changed.connect(_on_volume_changed)
	fullscreen_check_box.toggled.connect(_on_fullscreen_toggled)
	$BackButton.pressed.connect(_on_back_pressed)

func _on_volume_changed(value: float):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_fullscreen_toggled(checked: bool):
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if checked else DisplayServer.WINDOW_MODE_WINDOWED)
	
func _on_back_pressed():
	label.show()
	v_box_container_2.hide()
	v_box_container.show()
