#version 330

#moj_import <minecraft:fog.glsl>


in float vertexDistance;
in vec4 vertexColor;
in vec3 Pos;
in vec3 PlayerPos;

out vec4 fragColor;

void main() {

    vec4 color = vertexColor;
    color.rbg *= 1.33; //Vibrant clouds
    color = clamp(mix(color, FogColor, 0.5), 0, 0.9);

    color.a *= 1.0f - linear_fog_value(vertexDistance, 0, FogCloudsEnd);

    float fadeDirection = -10;
    float fadeIntensity = abs(PlayerPos.y/40);

    float topFadeHeight = 1 - ((10-Pos.y) / 10);
    float bottomFadeHeight = 1 - (Pos.y / 20);
    float fadeHeight = mix(topFadeHeight, bottomFadeHeight, clamp(fadeDirection, 0.2, 1));
    float fadeFinal = mix(1.0, fadeHeight, clamp(fadeIntensity, 0, 1));

    vec3 topColor = mix(vec3(1.3), FogColor.rgb, 0.25); 
    vec3 bottomColor = mix(vec3(0.85,0.9,1.3), FogColor.rgb, 0.25); 

    color.rgb *= mix(bottomColor, topColor, fadeFinal);
    color.a *= mix(1, 0.75, fadeFinal);

    fragColor = color;
}
