extends Node2D
signal toggleClickables
class_name LevelRoom

export var initialCameraPan: float = 0

var width = 0

func _ready():
	if $Background:
		# a RoomLayer will not have a texture, as it is an overlay on top of a room
		width = $Background.texture.get_width()


# our parent level will call this when it's ready; we can use it to listen to signals it emits
func registerLevel(level: Level):
#	var _r = level.connect("advanceDay", self, "_on_Level_AdvanceDay")
	pass

# set_interactable is used when overlays are shown to enable/disable all clickables
# in the room; this allows overlays to be shown over top of the room without having
# click events trigger clickables underneath
func set_interactable(interactable: bool):
	emit_signal("toggleClickables", interactable)
