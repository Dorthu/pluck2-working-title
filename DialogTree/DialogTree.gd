extends Node
tool
class_name DialogTree, "res://DialogTree/dialog_tree.svg"

func _process(_delta):
	if not Engine.editor_hint:
		return
	
	if len(_get_lookup().keys()) == get_child_count():
		return
	
	_fix_children()

func _fix_children():
	print("Fixing children..")
	# makes the child nodes of this node match the keys in our lookups script
	var children = get_children()
	var expected = _get_lookup().duplicate()
	
	for c in children:
		#if c.get_name() in expected:
		#	expected.erase(c.get_name())
		#else:
			print("Remvoing unexpected child " + c.get_name())
			remove_child(c)
	
	for k in expected.keys():
		print("Adding missing child %s" % k)
		var entry = DialogEntry.new()
		entry.set_name(k)
		var value = expected[k]
		var text = ""
		var profile = "pat_neutral"
		if typeof(value) == TYPE_ARRAY:
			text = value[0]
			profile = value[1]
		else:
			text = value
		entry.text = text
		entry.profile = profile
		add_child(entry)
		entry.set_owner(get_tree().edited_scene_root)

func get_text_for_key(key: String):
	return _get_lookup().get(key)

func _get_lookup() -> Dictionary:
	# subclasses should override this to provide their own lookup table
	return {}
