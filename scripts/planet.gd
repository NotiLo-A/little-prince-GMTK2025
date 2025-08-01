extends Sprite2D

const day_length := 100 # seconds
const rotation_speed = 2 * PI / day_length # rad/s

func _process(delta: float) -> void:
	rotation -= rotation_speed * delta
