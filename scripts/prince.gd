extends Sprite2D

const walk_speed := 0.5
const position_limit = 1.3

var start_pos: Vector2
var target_rotation := -0.3
var is_wątering_can_full := false # looks like the begining of some great shitcode

func _init() -> void:
	start_pos = position

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mouse_pos: Vector2 = %Planet.get_local_mouse_position()
		target_rotation = -mouse_pos.angle_to(Vector2.UP)
		print(rad_to_deg(target_rotation))
	update_position(delta)
	if Input.is_action_just_released("use"):
		if position.distance_to(%Well.position) < 50 and !is_wątering_can_full:
			is_wątering_can_full = true
			print("watering can filled")
		if position.distance_to(%Rose.position) < 50 and is_wątering_can_full:
			is_wątering_can_full = false
			print("rose watered")

func update_position(delta: float) -> void:
	if rotation > target_rotation:
		rotation -= walk_speed * delta
		rotation = target_rotation if rotation < target_rotation else rotation
		flip_h = true
	elif rotation < target_rotation:
		rotation += walk_speed * delta
		rotation = target_rotation if rotation > target_rotation else rotation
		flip_h = false
  
	rotation = clamp(
		rotation + %Planet.rotation, -position_limit, position_limit
	) - %Planet.rotation
	# wierd ass correction because of the long scarf at the side of the sprite
	position = start_pos.rotated(rotation + (.05 if flip_h else -.05))
