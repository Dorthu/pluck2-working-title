extends DialogTree
tool

const LOOKUP = {
	TEST_ONE = "it worked",
	EXAMPLE =  "example text here",
}

func _get_lookup() -> Dictionary:
	return LOOKUP
