extends Node

var loop := 0
var loose_reason: String

func game_over(reason: String):
	loose_reason = reason
	get_tree().change_scene_to_file("res://scenes/ui/game_over_screen.tscn")
