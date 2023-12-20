extends Light2D

var follow: bool = true

func _ready():
		# walk up the scene tree to find the Room we're in; if we're not in one that's fine too
	var myRoom = get_parent()
	while myRoom != null && not myRoom is LevelRoom:
		myRoom = myRoom.get_parent()
	
	if myRoom:
		myRoom.connect("toggleClickables", self, "_on_Room_ToggleClickables")
	else:
		push_warning("PlayerLight didn't find a parent room!")

func _process(_delta):
	if follow:
		self.position = get_global_mouse_position()

func _on_Room_ToggleClickables(on: bool):
	follow = on
