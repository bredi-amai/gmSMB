//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

void main()
{
    float amplitude = 0.009;
    float frequency = 0.1;
	
	float wave = sin((gl_FragCoord.y + time) * frequency) * amplitude;
	
	vec4 distortion = v_vColour * texture2D( gm_BaseTexture, vec2( v_vTexcoord.x + wave, v_vTexcoord.y ));
	gl_FragColor = distortion;
	
	/*
    float amplitude = 0.003;
    float frequency = 10.0;
    float speed = 0.01;
	
    float horwave = sin( time * speed * ( v_vTexcoord.y + 1000.0 / frequency) ) * ( amplitude );
	
	vec4 distortion = v_vColour * texture2D( gm_BaseTexture, vec2( v_vTexcoord.x + horwave, v_vTexcoord.y ));
	
	gl_FragColor = distortion;
	
    //gl_FragColor = texture2D(gm_BaseTexture, distortion);*/
}