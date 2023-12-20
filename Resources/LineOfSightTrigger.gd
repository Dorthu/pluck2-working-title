extends Node2D
tool
class_name LineOfSightTrigger

var seenEvent: Trigger = null
var unseenEvent: Trigger = null
var active: bool = true
var firedOnce: bool = false
export var OneShot: bool = true

func _ready():
	if not Engine.editor_hint:
		$Sprite.hide()
	
	for c in get_children():
		if c.name == "seen":
			seenEvent = c
		elif c.name == "unseen":
			unseenEvent = c

	# walk up the scene tree to find the Room we're in; if we're not in one that's fine too
	var myRoom = get_parent()
	while myRoom != null && not myRoom is LevelRoom:
		myRoom = myRoom.get_parent()
	
	if myRoom:
		myRoom.connect("toggleClickables", self, "_on_Room_ToggleClickables")
	else:
		push_warning("%s to find parent room" % self)

func _on_Room_ToggleClickables(on: bool):
	# TODO - do I want this behavior?
	active = on

func _on_VisibilityNotifier2D_screen_entered():
	if not active or (OneShot and firedOnce):
		print("Line of sight trigger seen, but not active or fired already")
		return
	print("Line of sight trigger seen")
	
	if seenEvent:
		firedOnce = true
		var _r = seenEvent.fire(Trigger.new_seen_event(self))


func _on_VisibilityNotifier2D_screen_exited():
	if not active or (OneShot and firedOnce):
		print("Line of sight triggen unseen, but not active or fired already")
		return
	print("Line of sight trigger unseen")
	
	if unseenEvent:
		firedOnce = true
		var _r = unseenEvent.fire(Trigger.new_unseen_event(self))
