extends AnimationPlayerTrigger
class_name LadderTrigger

export var Up: bool = true
onready var camera = $camera

func fire(data: Trigger.TriggerFireData):
	# this should play an animation eventually
	GameController.currentLevel.curRoom.set_interactable(false)
	camera.current = true
	.fire(data)
	GameController.root.get_camera().position.y = -300 if Up else 300
	yield(self, "trigger_finished")
	GameController.root.get_camera().current = true
	GameController.currentLevel.curRoom.set_interactable(true)
