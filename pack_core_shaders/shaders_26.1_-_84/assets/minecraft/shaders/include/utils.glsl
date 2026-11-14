#version 150

#define ARMOR_TRIMS true

vec2 texSize = textureSize(Sampler0,0);
vec4 preColor = texture(Sampler0, texCoord0);
// vec4 preOverlayColor = overlayColor;

#moj_import <globals.glsl>

// Helper Methods

vec3 color(int r, int g, int b) {
	return vec3(r,g,b)/255.;
}

vec4 color(int r, int g, int b, int a) {
	return vec4(r,g,b,a)/255.;
}

vec4 coordColor(int x, int y) {
	return texture(Sampler0, vec2(x/texSize.x, y/texSize.y));
}

vec2 getCoord() {
	return texCoord0*texSize;
}

bool coordIs(int x, int y) {
	return (texCoord0.x > x/texSize.x && texCoord0.y > y/texSize.y) && (texCoord0.x < (x+1)/texSize.x && texCoord0.y < (y+1)/texSize.y);
}

bool colorIs(int r, int g, int b) {
	return preColor.rgb == color(r,g,b);
}

bool coordColorIs(int x, int y, int r, int g, int b) {
	return coordColor(x,y).rgb == color(r,g,b);
}

bool coordColorIs(int x, int y, vec3 color) {
	return coordColor(x,y).rgb == color;
}

bool betweenCoords(int x1, int y1, int x2, int y2) {
	if (x1>x2) {
		int temp = x1;
		x1 = x2;
		x2 = temp;
	}
	if (y1>y2){
		int temp = y1;
		y1 = y2;
		y2 = temp;
	}

	return texCoord0.x > x1/texSize.x && texCoord0.x < x2/texSize.x && texCoord0.y > y1/texSize.y && texCoord0.y < y2/texSize.y;
}

bool isArmorTrim() {
	return texSize.x == 2048 && mod(texSize.y, 1024) == 0 && coordColor(64, 0).a != 1.0;
}

bool isSlimSkin() {
	return texSize == vec2(64,64) && (coordColorIs(46, 52, 0, 0, 0) || coordColorIs(46, 52, 255, 255, 255)) && coordColor(46, 52).a == 1;
}

bool usingWideSkin() {
	return false;
}

bool skinEffects() {
	return texSize == vec2(64, 64) && coordColorIs(63, 0, 0, 192, 255);
}

bool skinBlink() {
	return coordColorIs(62, 0, 255, 0, 0) && GameTime > 0.01 && (mod(GameTime * 1200, coordColor(62,0).a*255) < 0.2);
}

/*
bool damageColor() {
	return coordColor(61, 0).a != 0 && preOverlayColor.r > preOverlayColor.g;
}
*/

// Main
bool shouldBeEmissive() {
	return (
	(isArmorTrim() && ARMOR_TRIMS)	);
}