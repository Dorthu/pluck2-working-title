extends DialogTree
tool

const LOOKUP = {
	TEST_ONE = "it worked",
	EXAMPLE =  ["example text here", "pat_sad"],
	TUT_DAD_BECKONS = ["Hey, you're finally up!  Give me a hand with this, will ya?", "dad_neutral"],
	new = "boo",
}

func _get_lookup() -> Dictionary:
	return LOOKUP
