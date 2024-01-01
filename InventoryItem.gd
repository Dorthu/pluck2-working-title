extends Control

class_name InventoryItem

export var texture: Texture
var active: bool = false

func _ready():
	$TextureRect.texture = texture
	var _r = GameController.connect("change_active_item", self, "_on_GameController_active_item_changed")

func _on_InventoryItem_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("Inventory item is now active")
		GameController.set_active_item(self)

func _on_GameController_active_item_changed(new_active: InventoryItem):
	if new_active == self:
		print("I am now active")
		$Selected.show()
	else:
		$Selected.hide()
		print("I am not active")
