extends DialogTree
tool 


const LOOKUP = {
	TUTORIAL_TEST = "This is in the tutorial layer only",
	QUEST_LOCK_1 = "I should talk to Dad - he's by the front door",
	QUEST_LOCK_2 = "Dad needs me to go outside and get a veggie from the garden",
	DAD_QUEST_1 = "I need you to go out to the graden and harvest a veggie for me.",
	DAD_QUEST_2 = "Here, use this knife",
	DAD_QUEST_3 = "Hurry back now!",
}

func _get_lookup() -> Dictionary:
	return LOOKUP
