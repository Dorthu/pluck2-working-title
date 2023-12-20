extends DialogTree
tool

const LOOKUP = {
	VINE_IN_THE_WAY = "I can't get to it past that wiggly vine",
	NEED_KNIFE = "I can't get it free with my bare hands, I need to use the knife.",
	GET_FRUIT = "I cut a fruit down",
}

func _get_lookup() -> Dictionary:
	return LOOKUP
