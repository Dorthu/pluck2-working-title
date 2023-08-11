"""
This is the main controller for the entire game, which handles management of all systems and trasitions
between levels.  This controller is a globally-referencable singleton.
"""
extends Node
signal timeChanged
signal toggle_camera
signal snap_camera
signal collect_item

var currentLevel: Level = null
var root: main = null

func do_camera(active: bool):
	emit_signal("toggle_camera", active)

func snap_camera(pan: float):
	emit_signal("snap_camera", pan)

func collect_item(item: InventoryItem):
	emit_signal("collect_item", item)
