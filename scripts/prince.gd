extends Sprite2D

const walk_speed := 0.5 # rads/s
const position_limit = 1.3 # +-rads

var item_in_hands: Node
var start_pos: Vector2
var target_reached := true
var target_rotation := 0.0
#var is_wątering_can_full := false

func _ready() -> void:
	start_pos = position

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use"):
		var mouse_pos: Vector2 = %Planet.get_local_mouse_position()
		target_rotation = -mouse_pos.angle_to(Vector2.UP)
		target_reached = false
	update_position(delta)
	#if Input.is_action_just_released("use"):
		#if position.distance_to(%Well.position) < 50 and !is_wątering_can_full:
			#is_wątering_can_full = true
			#print("watering can filled")
		#if position.distance_to(%Rose.position) < 50 and is_wątering_can_full:
			#is_wątering_can_full = false
			#print("rose watered")

func update_position(delta: float) -> void:
	var normalized_diff = wrapf(rotation - target_rotation, -PI, PI)
	if !target_reached:
		if normalized_diff > 0:
			rotation -= walk_speed * delta
			flip_h = true
		elif normalized_diff < 0:
			rotation += walk_speed * delta
			flip_h = false
		if abs(wrapf(rotation - target_rotation, -PI, PI)) < walk_speed * delta:
			print("target_reached")
			target_reached = true
	rotation = clamp(
		rotation + %Planet.rotation, -position_limit, position_limit
	) - %Planet.rotation
	# wierd ass correction because of the long scarf at the side of the sprite
	position = start_pos.rotated(rotation + (.05 if flip_h else -.05))
