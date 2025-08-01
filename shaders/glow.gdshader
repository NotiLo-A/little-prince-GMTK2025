shader_type canvas_item;

instance uniform float alpha;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 base_color = texture(TEXTURE, UV);
	base_color.rgb = vec3(255, 255, 255);
	base_color.a *= alpha;
	COLOR = base_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
