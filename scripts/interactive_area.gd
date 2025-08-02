extends Area2D

func _init() -> void:
	pass
	# assert_eq(get_tree().get_node_count_in_group("prince"), 1)

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("use"):
		GlobalNodes.prince.call_prince_to_interact($"..")

func _mouse_enter():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _mouse_exit():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
