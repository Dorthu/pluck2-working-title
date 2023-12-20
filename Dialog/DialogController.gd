extends MarginContainer

class_name DialogController

var clickable: Clickable
var dialog = preload("res://Dialog/DialogBox.tscn")
var cur_entry = null setget , getEntry
var cur_box = null
var cur_text = []
var cur_text_index = 0

func show_entry(entry: DialogEntry):
	cur_entry = entry
	cur_entry.debug()
	cur_box = dialog.instance()
	
	# use the box to split the text into lines
	var text = entry.text
	var profile = find_profile(entry.profile)
	print("Text key:")
	print(entry.get_name())
	print("Text:")
	print(text)
	cur_text = cur_box.break_string(text)
	cur_text_index = 0
	
	cur_box.init(cur_text[0], profile)
	$DialogContainer.add_child(cur_box)

func _on_ClickCheck_button_down():
	if cur_box.finished():
		next()
	else:
		cur_box.show_all()

func getEntry() -> DialogEntry:
	return cur_entry

func find_profile(name: String) -> Resource:
	if ResourceLoader.exists("res://Dialog/Profiles/"+name+".png"):
		print("Profile for "+name+" found")
		return ResourceLoader.load("res://Dialog/Profiles/"+name+".png")
	print("No profile for "+name)
	return ResourceLoader.load("res://Dialog/Profiles/error.png")

func next():
	cur_text_index += 1
	if cur_text_index >= len(cur_text):
		dismiss()
		return
	
	$DialogContainer.remove_child(cur_box)
	cur_box = dialog.instance()
	cur_box.init(cur_text[cur_text_index])
	$DialogContainer.add_child(cur_box)

func dismiss():
	DialogSystem.dialog_finished()
	get_parent().remove_child(self)
