extends Node2D
tool
class_name Clickable

var clickEvent: Trigger = null
var hoverEvent: Trigger = null
var itemEvent: Trigger = null
var active: bool = true

func item_fire(name: String, item: InventoryItem):
	if has_node(name):
		var trigger = get_node(name)
		if trigger is Trigger:
			trigger.fire(Trigger.new_item_event(self, name, item))
		else:
			push_warning("Item triggered %s which is not a Trigger!" % name)
	else:
		push_warning("Item requested unknown event %s on Clickable" % name)

func _ready():
	for c in get_children():
		if c.name == "click":
			clickEvent = c
		elif c.name == "hover":
			hoverEvent = c
		elif c.name == "item":
			itemEvent = c

	# walk up the scene tree to find the Room we're in; if we're not in one that's fine too
	var myRoom = get_parent()
	while myRoom != null && not myRoom is LevelRoom:
		myRoom = myRoom.get_parent()
	
	if myRoom:
		myRoom.connect("toggleClickables", self, "_on_Room_ToggleClickables")
	else:
		push_warning("%s to find parent room" % self)

func _get_configuration_warning():
	#if treeTarget.is_empty():
	#	return "Must set a behavior target for this clickable!"
	#elif not get_node(treeTarget) is Trigger:
	#	return "Target must be an Interactable node!"
	return ""

func _on_Room_ToggleClickables(on: bool):
	active = on

func _on_Area2D_input_event(_viewport, event: InputEvent, _shape_idx):
	if not active:
		return
	
	if clickEvent and event is InputEventMouseButton and event.pressed:
		var _r
		if GameController.activeItem == null:
			if clickEvent:
				get_tree().set_input_as_handled()
				_r = clickEvent.fire(Trigger.new_click_event(self, event))
		else:
			if itemEvent:
				get_tree().set_input_as_handled()
				_r = itemEvent.fire(Trigger.new_item_event(self, "default", GameController.activeItem))

func _on_Area2D_mouse_entered():
	if not active:
		return
	
	if hoverEvent:
		var _r = hoverEvent.fire(Trigger.new_hover_event(true))

func _on_Area2D_mouse_exited():
	if not active:
		return
	
	if hoverEvent:
		var _r = hoverEvent.fire(Trigger.new_hover_event(false))
