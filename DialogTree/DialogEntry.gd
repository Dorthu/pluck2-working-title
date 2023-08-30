# a dialog entry is pairing of text and dialog box style
extends Node
tool
class_name DialogEntry, "res://DialogTree/event_handler.svg"

export(String, "Normal", "Special") var boxStyle: String = "Normal"
