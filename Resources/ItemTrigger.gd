extends Trigger
tool
class_name ItemTrigger, "res://Resources/item-trigger.svg"

"""
ItemTrigger is a dispatcher intended to be used as the "item" event handler for a
Clickable.  This uses the InventoryItem's name (as in the name of the node in the
scene tree where the item was created) as the name of the child trigger to fire.

For example, for this scene tree:
	
	Room
	|- InventoryItem: foo
	|- Clickable: bar
	|  |- ItemTrigger: item
	|  |  |- TextBoxTrigger: foo -> FooBar
	|- DialogTree:
	   |- DialogEntry: FooBar 

Using the "foo" item on "bar" would trigger the "FooBar" DialogEntry to be displayed.
"""

export var AllowDefault: bool = true
var DefaultDialogEntry: DialogEntry = null

func _ready():
	DefaultDialogEntry = DialogEntry.new()
	DefaultDialogEntry.text = "I can't use this here."

func fire(data: Trigger.TriggerFireData) -> bool:
	if data.item_name == null:
		push_warning("ItemTrigger fired without an item name in the event!")
		return false
	
	print("Item trigger fired for %s" % data.item_name)
	for c in get_children():
		if c.name == data.item_name:
			return c.fire(data)
	
	# if we made it here, we didn't have a child named for this item; do the default
	# if we're allowed.  Note that this is the game-wide default, defined right here.
	if AllowDefault:
		print("Item not found - default action")
		DialogSystem.show_dialog(DefaultDialogEntry)
	
	return true
