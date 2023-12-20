extends Control

# listen for signals from our singletons
func _ready():
	var _res = DialogSystem.connect("dialogActive", self, "_on_DialogSystem_DialogActive")
	_res = GameController.connect("collect_item", self, "_on_GameController_CollectItem")

func _on_DialogSystem_DialogActive(_active: bool, _controller: DialogController = null):
	pass

func _on_GameController_CollectItem(item: InventoryItem):
	$HUD/Inventory/Inventory.add_item(item)

func _on_UI_mouse_entered():
	$InOutTween.play("TweenIn")

func _on_UI_mouse_exited():
	$InOutTween.play_backwards("TweenIn")
