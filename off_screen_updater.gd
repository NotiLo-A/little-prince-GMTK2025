extends Node
class_name off_screen_updater

var previous_rotation_sign: float
var parent: Node2D

signal update_state

func _ready() -> void:
	parent = $".."
	previous_rotation_sign = 1

func _process(_delta: float) -> void:
	var rotation_sign := float(sign(parent.global_rotation_degrees))
	if (previous_rotation_sign == -1 and rotation_sign == 1):
		update_state.emit()

	previous_rotation_sign = rotation_sign
