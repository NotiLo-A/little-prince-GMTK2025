extends Sprite2D

const walk_speed := 0.5 # rads/s
const position_limit = 1.3 # +-rads

var carried_item: Node
var start_pos: Vector2
var target_reached := true
var target_rotation := 0.0
var target_object: Node2D

func _ready() -> void:
	GlobalNodes.prince = self
	start_pos = position

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use"):
		var mouse_pos: Vector2 = GlobalNodes.planet.get_local_mouse_position()
		call_prince_to_place(-mouse_pos.angle_to(Vector2.UP))
	move(delta)


func move(delta: float) -> void:
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
			print(target_object)
			if target_object != null:
				target_object.interact(carried_item)
				target_object = null
	rotation = clamp(
		rotation + GlobalNodes.planet.rotation, -position_limit, position_limit
	) - GlobalNodes.planet.rotation
	# wierd ass correction because of the long scarf at the side of the sprite
	position = start_pos.rotated(rotation + (.05 if flip_h else -.05))

func call_prince_to_interact(where: Node2D):
	call_prince_to_place(where.position.angle())
	target_object = where

func call_prince_to_place(where: float):
	target_reached = false
	target_rotation = where
