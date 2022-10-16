extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rotating = false
var rotation_x = 1.0
var rotation_y = 1.0
var rotation_z = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/PopupDialog/VBoxContainer/CheckButton.pressed = rotating
	$CanvasLayer/PopupDialog/VBoxContainer/HSliderX.value = rotation_x
	$CanvasLayer/PopupDialog/VBoxContainer/HSliderY.value = rotation_y
	$CanvasLayer/PopupDialog/VBoxContainer/HSliderZ.value = rotation_z
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotating:
		var rot = Vector3(rotation_x, rotation_y, rotation_z)
		$MeshInstance.rotate(rot.normalized(), delta * rot.length())
	pass


func _on_Button_pressed():
	$CanvasLayer/PopupDialog.popup()


func _on_CheckButton_toggled(button_pressed):
	rotating = button_pressed



func _on_HSliderX_value_changed(value: float) -> void:
	rotation_x  = value


func _on_HSliderY_value_changed(value: float) -> void:
	rotation_y = value

func _on_HSliderZ_value_changed(value: float) -> void:
	rotation_z = value
