shader_type canvas_item;

uniform float blur_amount : hint_range(0, 10) = 2.0;

void fragment() {
    vec4 sum = vec4(0.0);
    sum += texture(TEXTURE, UV + vec2(-blur_amount * 0.001, 0.0));
    sum += texture(TEXTURE, UV + vec2(blur_amount * 0.001, 0.0));
    sum += texture(TEXTURE, UV + vec2(0.0, -blur_amount * 0.001));
    sum += texture(TEXTURE, UV + vec2(0.0, blur_amount * 0.001));
    COLOR = sum / 4.0;
}