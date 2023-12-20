extends DialogTree
tool

const LOOKUP = {
	TEST_ONE = "it worked",
	EXAMPLE =  "example text here",
	TUT_DAD_BECKONS = "Hey, you're finally up!  Give me a hand with this, will ya?"
}

func _get_lookup() -> Dictionary:
	return LOOKUP
