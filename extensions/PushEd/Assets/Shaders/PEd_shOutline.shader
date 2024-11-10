attribute vec4 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 vTexCoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
    vTexCoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~#define BORDER 3

varying vec2 vTexCoord;

uniform vec2 uTexel;

void main()
{
    vec2 texCoord = vTexCoord + vec2(0.5) * uTexel;
    float origin = texture2D(gm_BaseTexture, texCoord).a;
    float sample = 0.0;
    sample += texture2D(gm_BaseTexture, texCoord + vec2(-BORDER, 0.0) * uTexel).a - origin;
    sample += texture2D(gm_BaseTexture, texCoord + vec2(0.0, -BORDER) * uTexel).a - origin;
    sample += texture2D(gm_BaseTexture, texCoord + vec2(+BORDER, 0.0) * uTexel).a - origin;
    sample += texture2D(gm_BaseTexture, texCoord + vec2(0.0, +BORDER) * uTexel).a - origin;
    gl_FragColor = vec4(0.0, 0.5, 1.0, sample);
}
