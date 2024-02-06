//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 blur_vector;
uniform vec2 texel_size;

void main()
{
	highp vec4 blurred_col;
	vec2 offset_factor = texel_size * blur_vector;
	
	blurred_col += texture2D(gm_BaseTexture, v_vTexcoord - 7.4240691 * offset_factor) * 0.0562937;
	blurred_col += texture2D(gm_BaseTexture, v_vTexcoord - 5.4441177 * offset_factor) * 0.0951791;
	blurred_col += texture2D(gm_BaseTexture, v_vTexcoord - 3.4643500 * offset_factor) * 0.1369112;
	blurred_col += texture2D(gm_BaseTexture, v_vTexcoord - 1.4847002 * offset_factor) * 0.1675553;
	
	blurred_col += texture2D(gm_BaseTexture, v_vTexcoord) * 0.0881212;

	blurred_col += texture2D(gm_BaseTexture, v_vTexcoord + 1.4847002 * offset_factor) * 0.1675553;
	blurred_col += texture2D(gm_BaseTexture, v_vTexcoord + 3.4643500 * offset_factor) * 0.1369112;
	blurred_col += texture2D(gm_BaseTexture, v_vTexcoord + 5.4441177 * offset_factor) * 0.0951791;
	blurred_col += texture2D(gm_BaseTexture, v_vTexcoord + 7.4240691 * offset_factor) * 0.0562937;
	
    gl_FragColor = v_vColour * blurred_col;
}
