extends Area2D

func _mouse_enter():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _mouse_exit():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
