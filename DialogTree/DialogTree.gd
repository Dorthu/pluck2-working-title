extends Node
tool
class_name DialogTree, "res://DialogTree/dialog_tree.svg"

export (Script) var choices setget choices_set

func choices_set(value: Script):
	print("Choices set!")
	choices = value
	var raw_choices = get_text_key_choices()
	print("Raw choices are this:")
	print(raw_choices)
	for c in get_children():
		if c is DialogEntry:
			c.set_text_key_choices(raw_choices)

func get_text_key_choices():
	return choices.new().get_dialog_keys()

func get_text_for_key(key: String):
	return choices.new().get_text_for_key(key)
