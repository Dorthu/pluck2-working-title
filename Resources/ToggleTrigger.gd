extends Trigger
class_name ToggleTrigger, "res://Resources/toggle-trigger.svg"

onready var toggle = $toggle

export var initiallyVisible: bool = false

func _ready():
	if toggle:
		toggle.visible = initiallyVisible

func fire(data: Trigger.TriggerFireData) -> bool:
	print("Firing hover trigger!")
	if toggle:
		toggle.visible = data.hoverActive
	return false
