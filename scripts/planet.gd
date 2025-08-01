extends Sprite2D

const day_length := 180 # seconds
const rotation_speed := 0.5

func _process(delta: float) -> void:
	rotation -= deg_to_rad(360 / day_length * delta)
	 #if Input.is_action_pressed("ui_left"):
	 	#rotation += 1 * delta
	 #if Input.is_action_pressed("ui_right"):
	 	#rotation -= 1 * delta
