extends Sprite2D

@export var textures: Array[Texture]
@export var sprite: Sprite2D
var index := 0

func interact(carried_item: Node) -> void:
	print("interacted with rose")

func _on_update_state() -> void:
	index += 1
	index = clamp(index, 0, textures.size() - 1);
	sprite.texture = textures[index]
