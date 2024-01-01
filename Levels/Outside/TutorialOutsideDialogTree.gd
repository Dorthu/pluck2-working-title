extends DialogTree
tool

var LOOKUP = {
	VINE_IN_THE_WAY = "I can't get to it past that wiggly vine",
	NEED_KNIFE = "I can't get it free with my bare hands, I need to use the knife.",
	GET_FRUIT = "I cut a fruit down",
	TEST_NEW_PROFILE = ["This looks odd", "pat_sad"],
	SEE_GARDEN = ["Oh no, that wild vine is at it again!", "pat_sad"],
	VINE_DESC = ["This vine's always been trouble", "pat_sad"],
	VINE_KNIFE = "Yeah, I'll cut the damned thing down",
}

func _get_lookup() -> Dictionary:
	return LOOKUP
