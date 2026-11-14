#version 330

#moj_import <minecraft:dynamictransforms.glsl>

out vec4 fragColor;

void main() {
    fragColor = ColorModulator * vec4(1.0, 1.0, 1.0, 2);
}
