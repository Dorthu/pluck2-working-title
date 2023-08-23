# a dialog entry is pairing of text and dialog box style
extends Node
tool
class_name DialogEntry, "res://DialogTree/event_handler.svg"

var textKey: String
export(String, "Normal") var boxStyle: String = "Normal"
var choices: Array

func _get_property_list():
	var properties = []
	properties.append({
		name = "textKey",
		type = TYPE_STRING,
		hint = PROPERTY_HINT_ENUM,
		hint_string = PoolStringArray(choices).join(",")
	})
	return properties

func _ready():
	if Engine.editor_hint and not choices:
		print("Calling init!")
		set_text_key_choices(
			get_parent().get_text_key_choices()
		)

func set_text_key_choices(choices: Array):
	# sets and propogates all text choices for this node; this is intended to be
	# called by the parent node (originating at a DialogTree) to set the available
	# text keys that can be chosen
	self.choices = choices
	property_list_changed_notify()
	
	for c in get_children():
		c.set_text_key_choices(choices)

func get_text_key_choices():
	return choices

"""
Thinking out loud here.. but
what if instead of associating a text box trigger to a DialogEntry, we associated it with the text key
directly?
Maybe Room has a DialogTree reference?  All triggers in the room know about it through GameController.currentLevel anyway (but not in the editor off)
Still need a way for changes in the dialog list to propagate to the choices in all triggers though
..textbox trigger becomes a tool with some editor-specfic behavior to define the text key dropdown
"""
