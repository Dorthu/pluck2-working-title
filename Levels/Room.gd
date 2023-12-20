extends Node2D
signal toggleClickables
class_name LevelRoom

export var initialCameraPan: float = 0
export var startNode: NodePath

var width = 0

func _ready():
	if has_node("Background"):
		# a RoomLayer will not have a texture, as it is an overlay on top of a room
		width = $Background.texture.get_width()
	
	if startNode: # and GameController.gameStart:
		var node = get_node(startNode)
		GameController.snap_camera(node.position.x, node.position.y, false)


# our parent level will call this when it's ready; we can use it to listen to signals it emits
func registerLevel(_level: Level):
	pass

func overrides_initial_snap() -> bool:
	return startNode != null

# set_interactable is used when overlays are shown to enable/disable all clickables
# in the room; this allows overlays to be shown over top of the room without having
# click events trigger clickables underneath
func set_interactable(interactable: bool):
	emit_signal("toggleClickables", interactable)
