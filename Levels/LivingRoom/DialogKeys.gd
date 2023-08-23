class_name DialogTreeEntries

var dialogKeys = {
	TEST_ONE = "it worked",
	TEST_TWO = "it worked again!",
	TEST_THREE = "a new one!",
	TEST_FOUR = "still working",
}

func get_dialog_keys():
	return dialogKeys.keys()

func get_text_for_key(key: String):
	return dialogKeys[key]
