#version 330
#extension GL_ARB_separate_shader_objects : require

// Ported for Minecraft 26.3 against the ACTUAL vanilla core/clouds.vsh
// (pulled from the user's own client). Structural changes required by
// 26.3's SPIR-V/RenderPearl shader frontend, applied on top of the
// pack's original geometry + color logic:
//   - #moj_import -> #include
//   - explicit layout(location = N) on every in/out varying
//   - gl_VertexID -> gl_VertexIndex
//   - Pos/PlayerPos varyings (needed by our fragment shader's custom
//     top/bottom fade) added back at locations 2/3 - vanilla dropped
//     these in 26.3, we still need them for our effect.
// Geometry math, "triple thickness" cell scaling, and face color values
// are UNCHANGED from the original pack.

#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:projection.glsl>

const int FLAG_MASK_DIR = 7;
const int FLAG_INSIDE_FACE = 1 << 4;
const int FLAG_USE_TOP_COLOR = 1 << 5;
const int FLAG_EXTRA_Z = 1 << 6;
const int FLAG_EXTRA_X = 1 << 7;

layout(std140) uniform CloudInfo {
    vec4 CloudColor;
    vec3 CloudOffset;
    vec3 CellSize;
};

uniform isamplerBuffer CloudFaces;

layout(location = 0) out float vertexDistance;
layout(location = 1) out vec4 vertexColor;
layout(location = 2) out vec3 Pos;
layout(location = 3) out vec3 PlayerPos;

const vec3[] vertices = vec3[](
    // Bottom face
    vec3(1, 0, 0),
    vec3(1, 0, 1),
    vec3(0, 0, 1),
    vec3(0, 0, 0),
    // Top face
    vec3(0, 1, 0),
    vec3(0, 1, 1),
    vec3(1, 1, 1),
    vec3(1, 1, 0),
    // North face
    vec3(0, 0, 0),
    vec3(0, 1, 0),
    vec3(1, 1, 0),
    vec3(1, 0, 0),
    // South face
    vec3(1, 0, 1),
    vec3(1, 1, 1),
    vec3(0, 1, 1),
    vec3(0, 0, 1),
    // West face
    vec3(0, 0, 1),
    vec3(0, 1, 1),
    vec3(0, 1, 0),
    vec3(0, 0, 0),
    // East face
    vec3(1, 0, 0),
    vec3(1, 1, 0),
    vec3(1, 1, 1),
    vec3(1, 0, 1)
);

const vec4[] faceColors = vec4[](
    // Bottom face
    vec4(0.7, 0.7, 0.7, 0.8),
    // Top face
    vec4(1.0, 1.0, 1.0, 0.8),
    // North face
    vec4(0.8, 0.8, 0.8, 0.8),
    // South face
    vec4(0.8, 0.8, 0.8, 0.8),
    // West face
    vec4(0.9, 0.9, 0.9, 0.8),
    // East face
    vec4(0.9, 0.9, 0.9, 0.8)
);

void main() {
    int quadVertex = gl_VertexIndex % 4;
    int index = (gl_VertexIndex / 4) * 3;

    int cellX = texelFetch(CloudFaces, index).r;
    int cellZ = texelFetch(CloudFaces, index + 1).r;
    int dirAndFlags = texelFetch(CloudFaces, index + 2).r;
    int direction = dirAndFlags & FLAG_MASK_DIR;
    bool isInsideFace = (dirAndFlags & FLAG_INSIDE_FACE) == FLAG_INSIDE_FACE;
    bool useTopColor = (dirAndFlags & FLAG_USE_TOP_COLOR) == FLAG_USE_TOP_COLOR;
    cellX = (cellX << 1) | ((dirAndFlags & FLAG_EXTRA_X) >> 7);
    cellZ = (cellZ << 1) | ((dirAndFlags & FLAG_EXTRA_Z) >> 6);
    vec3 faceVertex = vertices[(direction * 4) + (isInsideFace ? 3 - quadVertex : quadVertex)];

    vec3 realCellSize = CellSize;
    realCellSize.y *= 1; //3 is triple thickness
    vec3 pos = (faceVertex * realCellSize) + (vec3(cellX, 0, cellZ) * realCellSize) + CloudOffset;
    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

    vertexDistance = fog_spherical_distance(pos);
    vertexColor = (useTopColor ? faceColors[1] : faceColors[direction]) * CloudColor;
    vertexColor = (vertexColor * 0.5) + (CloudColor * 0.5);

    PlayerPos = pos;
    Pos = vec3(faceVertex * realCellSize) + (vec3(cellX, 0, cellZ) * realCellSize);
}
