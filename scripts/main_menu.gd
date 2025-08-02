extends Node2D

var moonrotate1 := true
var moonrotate2 := true
var difficulty := false

func _process(delta: float) -> void:
	if moonrotate1:
		$moon1.rotate(0.2 * delta)
		
	if moonrotate2:	
		$moon2.rotate(-0.5 * delta)


func _on_button_mouse_entered() -> void:
	if not difficulty:
		$Panel/StartButton.text = $Panel/StartButton.text + '?'


func _on_button_mouse_exited() -> void:
	if not difficulty:
		$Panel/StartButton.text = 'Start Game'


func _on_exit_button_pressed() -> void:
	if not difficulty:
		get_tree().quit()
	else:
		swich(3)

func _on_exit_button_mouse_entered() -> void:
	if not difficulty:
		moonrotate1 = false
		moonrotate2 = false
		$moon1.angular_velocity = 0
		$moon2.angular_velocity = 0
		$Panel/ExitButton.text = $Panel/ExitButton.text + ' ('

func _on_exit_button_mouse_exited() -> void:
	if not difficulty:
		$Panel/ExitButton.text = 'Exit'
		moonrotate1 = true
		moonrotate2 = true


func _on_start_button_pressed() -> void:
	if not difficulty:
		$AnimationPlayer.play('df')
		difficulty = true
	#get_tree().change_scene_to_file("res://scenes/game_main.tscn")
	else:
		swich(2)
		
		
func swich(diff: int):
	get_tree().change_scene_to_file("res://scenes/game_main.tscn")


func _on_start_button_2_pressed() -> void:
	swich(1)
