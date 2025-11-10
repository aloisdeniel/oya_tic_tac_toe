#version 460 core

precision mediump float;

#include <flutter/runtime_effect.glsl>

uniform vec2 iResolution;
uniform float iTime;
uniform sampler2D uTexture;

uniform vec2 uScanLineJitter; // displacement, threshold
uniform vec2 uVerticalJump;   // amount, time
uniform float uHorizontalShake;
uniform vec2 uColorDrift;     // amount, time

out vec4 fragColor;

float nrand(float x, float y)
{
    return fract(sin(dot(vec2(x, y), vec2(12.9898, 78.233))) * 43758.5453);
}

void main()
{
    vec2 fragCoord = FlutterFragCoord().xy;
    vec2 uv = fragCoord/iResolution.xy;

    float u = uv.x;
    float v = uv.y;

    float jitter = nrand(v, iTime) * 2 - 1;
    jitter *= step(uScanLineJitter.y, abs(jitter)) * uScanLineJitter.x;

    float jump = mix(v, fract(v + uVerticalJump.y), uVerticalJump.x);

    float shake = (nrand(iTime, 2) - 0.5) * uHorizontalShake;

    float drift = sin(jump + uColorDrift.y) * uColorDrift.x;

    vec4 src1 = texture(uTexture, fract(vec2(u + jitter + shake, jump)));
    vec4 src2 = texture(uTexture, fract(vec2(u + jitter + shake + drift, jump)));

    float a = (src1.a + src2.a) * 0.5;

    fragColor = vec4(src1.r, src2.g, src1.b, a);
}
