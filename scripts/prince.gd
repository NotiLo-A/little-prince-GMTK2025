class_name Prince
extends AnimatedSprite2D

@export var walk_speed := 1.5 # rads/s
@export var position_limit = 1.3 # +-rads

var carried_item: Node
var start_pos: Vector2
var target_reached := true
var target_rotation := 0.0
var target_object: Node2D
var was_target_assigned_this_frame := false

var speed_multiplier := 1.0

func _ready() -> void:
	GlobalNodes.prince = self
	start_pos = position

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use"):
		var mouse_pos: Vector2 = GlobalNodes.planet.get_local_mouse_position()
		call_prince_to_place(-mouse_pos.angle_to(Vector2.UP))
	move(delta)
	was_target_assigned_this_frame = false

func call_prince_to_interact(where: Node2D):
	target_reached = false
	target_rotation = -where.position.angle_to(Vector2.UP)
	target_object = where
	was_target_assigned_this_frame = true

func call_prince_to_place(where: float):
	if was_target_assigned_this_frame:
		return
	target_reached = false
	target_rotation = where
	was_target_assigned_this_frame = true

func move(delta: float) -> void:
	play("idle" if target_reached else "walk")
	var normalized_diff = wrapf(rotation - target_rotation, -PI, PI)
	var scaled_speed = walk_speed * speed_multiplier * delta

	if !target_reached:
		if normalized_diff > 0:
			rotation -= scaled_speed
			flip_h = true
		elif normalized_diff < 0:
			rotation += scaled_speed
			flip_h = false

		if abs(wrapf(rotation - target_rotation, -PI, PI)) < scaled_speed:
			target_reached = true
			if target_object != null:
				target_object.interact(carried_item)
				target_object = null
	rotation = clamp(
		rotation + GlobalNodes.planet.rotation, -position_limit, position_limit
	) - GlobalNodes.planet.rotation
	# wierd ass correction because of the long scarf at the side of the sprite
	position = start_pos.rotated(rotation + (.05 if flip_h else -.05))

func slow_down(mult: float):
	print("slow")
	print(walk_speed * 0.16 * speed_multiplier)
	speed_multiplier = mult

func reset_speed():
	speed_multiplier = 1.0