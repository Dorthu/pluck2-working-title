extends Area2D
# this class and its scene are intended to go behind everything in the main
# scene to allow resetting item selection when nothing was clicked.

class_name ItemResetFilter

func _process(delta):
	# follow the camera always
	if get_viewport().get_camera():
		self.position = get_viewport().get_camera().position

func _on_ItemResetFilter_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Item Reset Filter Clicked!")
	if event is InputEventMouseButton and event.pressed and GameController.activeItem:
		GameController.set_active_item(null)
