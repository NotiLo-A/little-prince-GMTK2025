extends Sprite2D

var rotating := false
var initial_angle := 0.0
var initial_rotation := 0.0

var angular_velocity := 0.0
var last_mouse_angle := 0.0
var friction := 0.97


func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Преобразуем позицию мыши в локальные координаты спрайта
			var local_mouse_pos = to_local(get_global_mouse_position())
			if get_rect().has_point(local_mouse_pos):
				rotating = true
				initial_angle = (get_global_mouse_position() - global_position).angle()
				initial_rotation = rotation
				last_mouse_angle = initial_angle
		else:
			rotating = false

func _process(delta):
	if rotating:
		var current_mouse_angle = (get_global_mouse_position() - global_position).angle()
		var delta_angle = current_mouse_angle - last_mouse_angle

		rotation += delta_angle
		angular_velocity = delta_angle / delta
		last_mouse_angle = current_mouse_angle
	else:
		if abs(angular_velocity) > 0.001:
			rotation += angular_velocity * delta
			angular_velocity *= friction
		else:
			angular_velocity = 0.0
