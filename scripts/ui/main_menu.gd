extends Node

var rotate_moons := true

func _process(delta: float) -> void:
	if rotate_moons:
		$Planets/LeftPlanet/Sprite2D.rotate(0.2 * delta)
		$Planets/RightPlanet/Sprite2D.rotate(-0.5 * delta)


func _on_start_button_mouse_entered() -> void:
	$UI/UIRoot/Buttons/Start.text = "Start Game?"
	
func _on_start_button_mouse_exited() -> void:
	$UI/UIRoot/Buttons/Start.text = "Start Game"

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_main.tscn")


func _on_exit_button_mouse_entered() -> void:
	rotate_moons = false
	$Planets/LeftPlanet/Sprite2D.angular_velocity = 0
	$Planets/RightPlanet/Sprite2D.angular_velocity = 0
	$UI/UIRoot/Buttons/Exit.text = "Exit ("

func _on_exit_button_mouse_exited() -> void:
	rotate_moons = true
	$UI/UIRoot/Buttons/Exit.text = "Exit"

func _on_exit_button_pressed() -> void:
	get_tree().quit()
