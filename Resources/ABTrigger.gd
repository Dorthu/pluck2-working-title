extends Trigger
tool 
class_name ABTrigger, "res://DialogTree/ab-trigger.svg"

export var questName: String
export var requiredMin: int = -1
export var requiredMax: int = -1

onready var ifTrue: Trigger = $yes
onready var ifFalse: Trigger = $no

func _ready():
	# hack required max to be really high if it wasn't set
	if requiredMax < 0:
		requiredMax = 9999
	
	if not ifTrue:
		push_warning("ABTrigger has no 'yes' child node")
	if not ifFalse:
		push_warning("ABTrigger has no 'no' child node")

func fire(data: Trigger.TriggerFireData) -> bool:
	var questStatus: int = GameController.currentLevel.get_quest_status(questName)
	if questStatus >= requiredMin and questStatus <= requiredMax:
		var _res = ifTrue.fire(data)
		yield(self, "trigger_finished")
	else:
		var _res = ifFalse.fire(data)
		yield(self, "trigger_finished")
	return true

func _get_configuration_warning() -> String:
	if not get_node("yes"):
		return "No postiive case defined"
	if not get_node("no"):
		return "No negative case defined"
	return ""
