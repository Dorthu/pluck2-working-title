extends Trigger
tool
class_name TextBoxTrigger, "res://Resources/text-box-trigger.svg"


export var dialogKey: NodePath

func fire(_data: Trigger.TriggerFireData) -> bool:
	var entry = get_node(dialogKey)
	
	if entry == null:
		push_error("TextBoxTrigger " + get_path() + " activated with  invalid dialogKey " + dialogKey)
		return
	
	DialogSystem.show_dialog(entry)
	
	yield(DialogSystem, "dialogActive")
	emit_signal("trigger_finished")
	return true

func _get_configuration_warning() -> String:
	if dialogKey == "":
		return "No Dialog Key set!"
	return ""
