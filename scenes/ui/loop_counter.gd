extends Control

@export var label: Label

func _process(delta: float) -> void:
	label.text = "Loop: " + str(GameStaticData.loop)
