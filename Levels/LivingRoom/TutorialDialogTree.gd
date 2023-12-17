extends DialogTree
tool 


const LOOKUP = {
	TUTORIAL_TEST = "This is in the tutorial layer only",
	STAY_ON_TRACK = "Dad needs me to get something from the garden, I can't go this way yet",
}

func _get_lookup() -> Dictionary:
	return LOOKUP
