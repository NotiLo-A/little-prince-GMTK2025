extends Sprite2D

const day_length := 60 # seconds

func _process(delta: float) -> void:
	rotation -= deg_to_rad(360 / day_length * delta)
