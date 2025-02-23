attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPosition;
varying vec4 v_vWorldPosition;

void main()
{
	vec4 object_space_pos = vec4( in_Position.xyz, 1.0);
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	
	v_vColour = in_Colour;
	v_vTexcoord = in_TextureCoord;
	
	v_vWorldPosition = object_space_pos;
	v_vPosition = gl_Position;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPosition;
varying vec4 v_vWorldPosition;

uniform float u_fTime;
uniform vec4 u_vWaterBlend;
uniform sampler2D u_pWaterTexture;
uniform sampler2D u_pDistortionMap;
uniform sampler2D u_pAppSurf;

const float fWaterSpeed = 0.05;
const float fDistortAmount = 0.12;
const float fDistortXScale = 1.0;
const float fDistortYScale = 0.2;
const float fDistortSpeed = 0.25;
const float fFloorOpacity = 0.77;

const int iCausticIntensityDark = 2;
const float fCausticIntensityLight = 4.0;
const float fRefractionIntensity = 0.33;

const float fTextureSize = 500.0;
const float fNoiseSize = 75.0;

void main()
{
float fWaterAmount = ( ( v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) ).r );
if ( fWaterAmount <= ( 5.0 / 255.0 ) )
discard;

vec4 vWorldPos = v_vWorldPosition;// - vec4( u_vWorldOffset.xy, 0.0, 0.0 );

float fX;
float fY;
float fAmount;


vec2 vDistortCoord = vec2( ( vWorldPos.x / ( fNoiseSize ) ) + ( fDistortSpeed * u_fTime ), ( vWorldPos.y / ( fNoiseSize ) ) + ( fDistortSpeed * u_fTime ) );
vec2 vDistortCoord2 = vec2( ( vWorldPos.x / ( fNoiseSize * 1.33 ) ) - ( fDistortSpeed * u_fTime * 0.66 ), ( vWorldPos.y / ( fNoiseSize * 1.4 ) ) );// - ( fDistortSpeed * u_fTime * 0.66 ) );
vec4 vDistortColour = ( ( texture2D( u_pDistortionMap, vDistortCoord ) + texture2D( u_pDistortionMap, vDistortCoord2 ) ) / 1.5 ) * fWaterAmount;

vec2 vDistortCoord3 = vec2( ( vWorldPos.x / ( fNoiseSize ) ) - ( fDistortSpeed * u_fTime ), ( vWorldPos.y / ( fNoiseSize ) ) + ( fDistortSpeed * u_fTime ) );
vec2 vDistortCoord4 = vec2( ( vWorldPos.x / ( fNoiseSize * 1.1 ) ) - ( fDistortSpeed * u_fTime * 0.75 ), ( vWorldPos.y / ( fNoiseSize * 1.2 ) ) - ( fDistortSpeed * u_fTime * 0.88 ) );
vec4 vDistortColour2 = ( ( texture2D( u_pDistortionMap, vDistortCoord3 ) + texture2D( u_pDistortionMap, vDistortCoord4 ) ) / 1.5 ) * fWaterAmount;


float fRefractAmount = ( fDistortAmount * ( min( 1.0, fWaterAmount * 4.0 ) ) );
float fDistortX = ( vDistortColour.r - 0.5 ) * fRefractAmount * fDistortXScale;
float fDistortY = ( vDistortColour.g - 0.5 ) * fRefractAmount * fDistortYScale;

float fDistortX2 = ( vDistortColour2.r - 0.5 ) * fRefractAmount * fDistortXScale;
float fDistortY2 = ( vDistortColour2.g - 0.5 ) * fRefractAmount * fDistortYScale;


fX = ( vWorldPos.x / ( fTextureSize ) ) + ( fWaterSpeed * u_fTime );
fY = ( vWorldPos.y / ( fTextureSize ) );// + ( fWaterSpeed * u_fTime * 0.1 );
vec2 vWaterTex = vec2( fX, fY );

fX = ( ( vWorldPos.x / ( fTextureSize * 0.9 ) ) - ( fWaterSpeed * u_fTime * 0.9 ) );
fY = ( ( vWorldPos.y / ( fTextureSize * 0.9 ) ) + ( fWaterSpeed * u_fTime * 0.33 ) );
vec2 vWaterTex2 = vec2( fX, fY );

fX = ( ( vWorldPos.x / ( fTextureSize * 0.8 ) ) - ( fWaterSpeed * u_fTime * 0.9 ) );
fY = ( ( vWorldPos.y / ( fTextureSize * 0.8 ) ) - ( fWaterSpeed * u_fTime * 0.44 ) );
vec2 vWaterTex3 = vec2( fX, fY );

fX = vWaterTex.x + ( fDistortX );
fY = vWaterTex.y + ( fDistortY );
vec4 vWaterColour = texture2D( u_pWaterTexture, vec2( fX, fY ) );

fX = ( vWaterTex2.x + fDistortX );
fY = ( vWaterTex2.y + ( fDistortY * 0.66 ) );
vec4 vWaterColour2 = texture2D( u_pWaterTexture, vec2( fX, fY ) );

vWaterColour = mix( vWaterColour, vWaterColour2, 0.5 );

fX = ( vWaterTex3.x - fDistortX2 * 0.9 );
fY = ( vWaterTex3.y + fDistortY2 * 0.2 );
vec4 vWaterColour3 = texture2D( u_pWaterTexture, vec2( fX, fY ) );


vec2 vScreenPos = mix( ( ( ( v_vPosition.xy / v_vPosition.w )  ) * 0.5 ) + 0.5, vec2( 0.5 ), ( fRefractionIntensity * fWaterAmount ) / 1024.0 );

fX = vScreenPos.x + ( fDistortX2 * fRefractionIntensity * fWaterAmount );
fY = 1.0 - vScreenPos.y + ( fDistortY2 * fRefractionIntensity * fWaterAmount );

vec4 vFloorColour = texture2D( u_pAppSurf, vec2( fX, fY ) );

vec4 vColour =  mix( vFloorColour, mix( vFloorColour, vec4( vec3( 0.0 ), 1.0 ), ( 1.0 - fFloorOpacity ) ), 1.0 );
vColour = mix( mix( ( vWaterColour3 ), vWaterColour, 0.1 ), vColour, fFloorOpacity ) * mix( vec4( 1.0 ), vec4( vec3( 0.4 ), 1.0 ), fWaterAmount );

vec4 vWaterDark = vWaterColour;
vec4 vDarkColour = mix( vWaterColour, vWaterColour3, 0.5 );
for ( int i = 0; i < iCausticIntensityDark; i++ )
{
vWaterDark *= vDarkColour;
}

vColour += ( ( vWaterDark * vWaterColour ) ) * fCausticIntensityLight;// * fWaterAmount * fWaterAmount;
vColour *= u_vWaterBlend;

if ( ( false ) && ( vDistortColour.r >= 0.7 ) && ( vDistortColour.r <= 1.0 ) )
{
vec4 vFoamColour = vec4( vec3( vDistortColour.r ), 1.0 );
vColour += vFoamColour * 0.33;
}

//vColour.a = fWaterAmount * 3.0;
vColour.a = 1.0;

if (fWaterAmount <= ( 20.0 / 255.0 ) )
{
vColour.a = fWaterAmount * 20.0;
}

gl_FragColor = mix( vFloorColour, vColour, fWaterAmount );
if ( gl_FragColor.a <= ( 1.0 / 255.0 ) )
discard;
}

