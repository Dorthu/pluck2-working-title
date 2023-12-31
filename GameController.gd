"""
This is the main controller for the entire game, which handles management of all systems and trasitions
between levels.  This controller is a globally-referencable singleton.
"""
extends Node
signal toggle_camera
signal snap_camera
signal collect_item
signal change_active_item

var currentLevel: Level = null
var root: main = null
var gameStart: bool = true
var activeItem: InventoryItem = null

func do_camera(active: bool):
	emit_signal("toggle_camera", active)

func snap_camera(pan: float, height: float = 300, clampToRoom: bool = true):
	emit_signal("snap_camera", pan, height, clampToRoom)

func collect_item(item: InventoryItem):
	emit_signal("collect_item", item)

func is_game_strat() -> bool:
	return gameStart

func set_active_item(item: InventoryItem):
	activeItem = item
	emit_signal("change_active_item", item)

func _ready():
	gameStart = false
