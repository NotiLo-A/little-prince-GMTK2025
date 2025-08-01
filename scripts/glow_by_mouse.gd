extends Sprite2D

var override_alpha: bool = false
var override_alpha_val: float = 0

var parent: Sprite2D

func _ready() -> void:
	parent = $".."
	texture = parent.texture

func _process(_delta: float) -> void:
	var alpha: float = override_alpha_val
	if !override_alpha:
		alpha = 2 / parent.get_local_mouse_position().length() ** 0.75
	set_instance_shader_parameter("alpha", clamp(alpha, 0, 0.2))
