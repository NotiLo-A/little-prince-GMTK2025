shader_type canvas_item;

instance uniform float alpha;
uniform sampler2D uv_noise;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv_distortion_uv = vec2(UV.x + cos(TIME / 5.0), UV.y + sin(TIME / 5.0));
	float uv_distortion = texture(uv_noise, uv_distortion_uv).r;
	float x = UV.x + uv_distortion / 25.0 - 0.03;
	float y = UV.y + uv_distortion / 25.0 - 0.03;
	vec4 base_color = texture(TEXTURE, vec2(x, y));
	base_color.rgb = vec3(255, 255, 255);
	base_color.a *= alpha;
	COLOR = base_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
