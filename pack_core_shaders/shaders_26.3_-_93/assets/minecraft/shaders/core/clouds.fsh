#version 330
#extension GL_ARB_separate_shader_objects : require

// Ported for Minecraft 26.3 against the ACTUAL vanilla core/clouds.fsh.
// 26.3 compiles this shader several times with different defines for the
// different OIT passes (depth bounds, transmittance, accumulate, plus
// "flat" variants), so it now HAS to branch through oit.glsl's helper
// functions instead of always writing fragColor directly - the fixed
// pipeline compile is what threw the errors in test skies 1.
//
// Color/fade math (fog blend, top/bottom fade using Pos/PlayerPos) is
// UNCHANGED from the original pack - it's just wrapped in the branching
// vanilla now requires, and only runs where vanilla itself runs the
// equivalent color/alpha work.

#include <minecraft:fog.glsl>
#include <minecraft:oit.glsl>

layout(location = 0) in float vertexDistance;
layout(location = 1) in vec4 vertexColor;
layout(location = 2) in vec3 Pos;
layout(location = 3) in vec3 PlayerPos;

#ifndef OIT_ALPHA_ONLY
layout(location = 0) out vec4 fragColor;
#endif

vec4 calculateFinalColor(vec4 color) {
    #ifdef OIT_ACCUMULATE
    color = sampleColorForAccumulation(color);
    #endif
    return color;
}

void main() {
    vec4 color = vertexColor;

    color.rbg *= 1.33; //Vibrant clouds

    color = clamp(mix(color, FogColor, 0.5), 0, 0.9);

    #ifndef OIT_DEPTH_BOUNDS
    color.a *= 1.0f - linear_fog_value(vertexDistance, 0, FogCloudsEnd);
    #endif

    float fadeDirection = -10;
    float fadeIntensity = abs(PlayerPos.y / 40);

    float topFadeHeight = 1 - ((10 - Pos.y) / 10);
    float bottomFadeHeight = 1 - (Pos.y / 20);
    float fadeHeight = mix(topFadeHeight, bottomFadeHeight, clamp(fadeDirection, 0.2, 1));
    float fadeFinal = mix(1.0, fadeHeight, clamp(fadeIntensity, 0, 1));

    vec3 topColor = mix(vec3(1.3), FogColor.rgb, 0.25);
    vec3 bottomColor = mix(vec3(0.85, 0.9, 1.3), FogColor.rgb, 0.25);

    color.rgb *= mix(bottomColor, topColor, fadeFinal);

    // Sunset/sunrise edge glow. No sun-direction uniform is exposed to this
    // stage, and the clouds pipeline isn't flagged additive, so this is a
    // grazing-angle (fresnel-style) brightening inside the normal alpha
    // blend rather than a true separate additive pass - that would need a
    // second render pipeline, which isn't something a resource pack can add.
    // PlayerPos is camera-relative (see vsh), so its normalized Y already
    // tells us how close to the horizon this fragment is. FogColor is
    // already time-of-day tinted by vanilla, so we detect "sunset warmth"
    // by comparing its red vs blue channel instead of needing a new uniform.

    float grazing = 1.0 - abs(normalize(PlayerPos).y);
    float sunsetWarmth = clamp((FogColor.r - FogColor.b) * 2.0, 0.0, 1.0);
    float rim = pow(grazing, 4.0) * sunsetWarmth;

    color.rgb += FogColor.rgb * rim * 0.6;

    #ifndef OIT_DEPTH_BOUNDS
    color.a *= mix(1, 0.75, fadeFinal);
    color.a = clamp(color.a + rim * 0.15, 0.0, 1.0);
    #endif

    #ifdef OIT_ALPHA_ONLY
    executeAlphaOnlyPhase(gl_FragCoord.z, color.a);
    #else
    fragColor = calculateFinalColor(color);
    #endif
}
