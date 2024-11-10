attribute vec4 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 vTexCoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
    vTexCoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 vTexCoord;

void main()
{
    gl_FragColor = vec4(vec3(1.0), texture2D(gm_BaseTexture, vTexCoord).a);
}
