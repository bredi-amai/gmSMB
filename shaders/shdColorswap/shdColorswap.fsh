//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 Color0;
uniform vec4 Index0;
uniform vec4 Color1;
uniform vec4 Index1;
uniform vec4 Color2;
uniform vec4 Index2;
uniform vec4 Color3;
uniform vec4 Index3;
uniform vec4 Color4;
uniform vec4 Index4;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 tex = texture2D(gm_BaseTexture, v_vTexcoord);
	if (tex.a != 0.0)
	{
		if (tex.rgba == Index0)
		{gl_FragColor = Color0;}
		else if (tex.rgba == Index1)
		{gl_FragColor = Color1;}
		else if (tex.rgba == Index2)
		{gl_FragColor = Color2;}
		else if (tex.rgba == Index3)
		{gl_FragColor = Color3;}
		else if (tex.rgba == Index4)
		{gl_FragColor = Color4;}
	}
}

