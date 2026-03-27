varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uTime;
uniform float uSpeed;
uniform float uFrequency;
uniform float uAmplitude;

void main()
{
	vec2 uv = v_vTexcoord;
	
	// Calculate the horizontal wobble
	float horizontalWobble = sin(uTime * uSpeed + (uv.y * uFrequency)) * uAmplitude;
	
	// Apply displacement
	uv.x += horizontalWobble;
	
	// Sample the texture
	vec4 baseColor = v_vColour * texture2D(gm_BaseTexture, uv);
	
	gl_FragColor = baseColor;
}