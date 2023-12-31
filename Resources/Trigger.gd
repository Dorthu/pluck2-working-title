extends Node
signal trigger_finished # declared for subclasses to use
class_name Trigger

# a class to contain all information needed by triggers to fire
class TriggerFireData:
	var target: Node2D
	var event
	var hoverActive: bool
	var item: InventoryItem
	var item_name: String
	
	func _init(targetData: Node2D, eventData, hoverActiveData: bool):
		self.target = targetData
		self.event = eventData
		self.hoverActive = hoverActiveData

# static functions for created trigger fire events
static func new_click_event(target: Node2D, event):
	return TriggerFireData.new(target, event, false)

static func new_hover_event(active: bool):
	return TriggerFireData.new(null, null, active)

static func new_seen_event(target: Node2D):
	return TriggerFireData.new(target, null, true)
	
static func new_unseen_event(target: Node2D):
	return TriggerFireData.new(target, null, false)

static func new_item_event(target: Node2D, name: String, item: InventoryItem) -> TriggerFireData:
	var ret = TriggerFireData.new(target, null, false)
	ret.item = item
	ret.item_name = name
	return ret

# this must be implemented by all trigger types
func fire(_data: TriggerFireData) -> bool:
	push_warning("do_trigger called on base Trigger class!")
	emit_signal("trigger_finished")
	return false
