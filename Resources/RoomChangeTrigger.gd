extends Trigger
class_name RoomChangeTrigger, "res://DialogTree/change-room-trigger.svg"

export var roomTarget: String
export var rightSide: bool = false

func fire(_data: Trigger.TriggerFireData):
	GameController.currentLevel.change_room(roomTarget, rightSide)

