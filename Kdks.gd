extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# clicked(node)
signal clicked

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Kdks_input_event(camera, event, position, normal, shape_idx):
	var mouse_button_event = event as InputEventMouseButton
	if mouse_button_event and mouse_button_event.pressed :
		emit_signal("clicked", self)
		pass # Replace with function body.
