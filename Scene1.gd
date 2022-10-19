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
	var err := OK
	Engine.target_fps = 0
	$CanvasLayer/PopupDialog/VBoxContainer/CheckButton.pressed = rotating
	$CanvasLayer/PopupDialog/VBoxContainer/HSliderX.value = rotation_x
	$CanvasLayer/PopupDialog/VBoxContainer/HSliderY.value = rotation_y
	$CanvasLayer/PopupDialog/VBoxContainer/HSliderZ.value = rotation_z
	err = $MeshInstance/Kdks.connect("clicked", self, "_on_Kdks_clicked", [], CONNECT_ONESHOT)
	assert(err == OK)
	pass

func _on_Kdks_clicked(node : Node) :
	print_tree()
	print("Clicked: ", node)
	node.queue_free()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotating:
		var rot = Vector3(rotation_x, rotation_y, rotation_z)
		if rot.length_squared() > 0 :
			$MeshInstance.rotate(rot.normalized(), delta * rot.length())
	$CanvasLayer/FPSLabel.text = "FPS: %2.2f" % (1.0 / delta)
	
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


func _on_VsyncCheckBox_toggled(button_pressed):
	ProjectSettings.set_setting("display/window/vsync/use_vsync", button_pressed)
#	ProjectSettings.set_setting("display/window/vsync/vsync_via_compositor", button_pressed)
