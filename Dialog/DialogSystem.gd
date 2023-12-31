extends Node

# func _on_DialogSystem_DialogActive(active: bool, controller: DialogController = null):
signal dialogActive

var dialog_controller = preload("res://Dialog/DialogController.tscn")

# stateful vars
var curController: DialogController = null

func show_dialog(dialogEntry: DialogEntry):
	if curController != null:
		push_warning("Attempted to show dialog while another dialog was active!")
		return
	
	GameController.currentLevel.curRoom.set_interactable(false)
	curController = dialog_controller.instance()
	GameController.root.add_ui_element(curController)
	curController.show_entry(dialogEntry)
	emit_signal("dialogActive", true, curController)

func dialog_finished():
	var dismissing = curController
	curController = null
	emit_signal("dialogActive", false, dismissing)
	GameController.currentLevel.curRoom.set_interactable(true)

func force_dismiss_dialog():
	if curController != null:
		curController.dismiss()
