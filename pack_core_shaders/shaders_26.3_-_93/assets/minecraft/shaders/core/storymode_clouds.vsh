#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:projection.glsl>

const int FLAG_MASK_DIR      = 7;
const int FLAG_INSIDE_FACE   = 1 << 4;
const int FLAG_USE_TOP_COLOR = 1 << 5;
const int FLAG_EXTRA_Z       = 1 << 6;
const int FLAG_EXTRA_X       = 1 << 7;

layout(std140) uniform CloudInfo {
    vec4 CloudColor;
    vec3 CloudOffset;
    vec3 CellSize;
};

uniform isamplerBuffer CloudFaces;

const float CloudFadeAlpha   = 0.0;
const float CloudHeight      = 1.5;   // vertical scaling
const float CloudYOffset     = 0.0;   // Y offset
const float BrightnessBottom = 1.0;
const float BrightnessTop    = 1.0;
const float BrightnessNorth  = 1.0;
const float BrightnessSouth  = 1.0;
const float BrightnessWest   = 1.0;
const float BrightnessEast   = 1.0;

// Exigencia de SPIR-V: Se añaden locaciones explícitas a las salidas
layout(location = 0) out float vertexDistance;
layout(location = 1) out vec4 vertexColor;

const vec3[] vertices = vec3[](
    vec3(1.0, 0.0, 0.0), vec3(1.0, 0.0, 1.0), vec3(0.0, 0.0, 1.0), vec3(0.0, 0.0, 0.0),   // Bottom
    vec3(0.0, 1.0, 0.0), vec3(0.0, 1.0, 1.0), vec3(1.0, 1.0, 1.0), vec3(1.0, 1.0, 0.0),   // Top
    vec3(0.0, 0.0, 0.0), vec3(0.0, 1.0, 0.0), vec3(1.0, 1.0, 0.0), vec3(1.0, 0.0, 0.0),   // North
    vec3(1.0, 0.0, 1.0), vec3(1.0, 1.0, 1.0), vec3(0.0, 1.0, 1.0), vec3(0.0, 0.0, 1.0),   // South
    vec3(0.0, 0.0, 1.0), vec3(0.0, 1.0, 1.0), vec3(0.0, 1.0, 0.0), vec3(0.0, 0.0, 0.0),   // West
    vec3(1.0, 0.0, 0.0), vec3(1.0, 1.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(1.0, 0.0, 1.0)    // East
);

float lerp(float d, float e, float f) {
    return e + d * (f - e);
}

void main() {
    // Exigencia de SPIR-V: Se cambia gl_VertexID por gl_VertexIndex
    int quadVertex = gl_VertexIndex % 4;
    int index = (gl_VertexIndex / 4) * 3;

    int cellX = texelFetch(CloudFaces, index).r;
    int cellZ = texelFetch(CloudFaces, index + 1).r;
    int dirAndFlags = texelFetch(CloudFaces, index + 2).r;
    int direction = dirAndFlags & FLAG_MASK_DIR;
    bool isInsideFace = (dirAndFlags & FLAG_INSIDE_FACE) != 0;
    bool useTopColor = (dirAndFlags & FLAG_USE_TOP_COLOR) != 0;

    cellX = (cellX << 1) | ((dirAndFlags & FLAG_EXTRA_X) >> 7);
    cellZ = (cellZ << 1) | ((dirAndFlags & FLAG_EXTRA_Z) >> 6);

    vec3 faceVertex = vertices[(direction * 4) + (isInsideFace ? 3 - quadVertex : quadVertex)];

    // World position with scaling & offset
    vec3 scaledVertex = faceVertex * CellSize;
    scaledVertex.y *= CloudHeight; // vertical scaling
    vec3 pos = scaledVertex + (vec3(float(cellX), 0.0, float(cellZ)) * CellSize) + CloudOffset + vec3(0.0, CloudYOffset, 0.0);

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

    // Fog distance
    vertexDistance = fog_spherical_distance(pos);

    float brightness = 1.0; // appearsShaded=false
    if (useTopColor || direction == 1) brightness = BrightnessTop;
    else if (direction == 0) brightness = BrightnessBottom;
    else if (direction == 2) brightness = BrightnessNorth;
    else if (direction == 3) brightness = BrightnessSouth;
    else if (direction == 4) brightness = BrightnessWest;
    else if (direction == 5) brightness = BrightnessEast;

    vec3 rgb = vec3(brightness);
    float baseA = CloudColor.a;
    float finalA = baseA;

    // (fadeEnabled = true)
    float vertexY = pos.y - CloudOffset.y;  // local vertex height
    float normalizedY = clamp(vertexY / CloudHeight, 0.0, 1.0);

    float dir = clamp(CloudOffset.y / CloudHeight, -1.0, 1.0); // relYToCenter
    float fadeBelow = lerp(normalizedY, 1.0, CloudFadeAlpha);
    float fadeAbove = lerp(1.0 - normalizedY, 1.0, CloudFadeAlpha);
    float mixFactor = (dir + 1.0) * 0.5;
    float fade = mix(fadeBelow, fadeAbove, mixFactor);

    finalA = baseA * (0.8 - fade);

    vertexColor = vec4(rgb, finalA) * CloudColor;
}