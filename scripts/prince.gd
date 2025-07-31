extends Sprite2D

const walk_speed := 0.5
const position_limit = 1.3

var start_pos: Vector2
var is_wątering_can_full := false # looks like the begining of some great shitcode

func _init() -> void:
	start_pos = position

func _process(delta: float) -> void:
	if position.distance_to(%Well.position) < 50 and Input.is_action_just_released("use"):
		is_wątering_can_full = true
		print("watering can filled")
	
	if position.distance_to(%Rose.position) < 50 and Input.is_action_just_released("use") and is_wątering_can_full:
		is_wątering_can_full = false
		print("rose watered")
  
	if Input.is_action_pressed("left"):
		rotation -= walk_speed * delta
		flip_h = true
	if Input.is_action_pressed("right"):
		rotation += walk_speed * delta
		flip_h = false
	rotation = clamp(
		rotation + %Planet.rotation, -position_limit, position_limit
	) - %Planet.rotation
	position = start_pos.rotated(rotation)
