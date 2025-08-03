extends Control

@export var loose_reason_label: Label
@export var loops_label: Label

func _ready() -> void:
	loose_reason_label.text = GameStaticData.loose_reason
	loops_label.text = "You've lasted " + str(GameStaticData.loop) + " loops!"


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
