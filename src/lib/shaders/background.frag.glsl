#version 300 es
precision highp float;

#define SKY_500 vec3(14., 165., 233.) / vec3(255.)

uniform float u_time;
uniform vec2 u_resolution;
uniform float u_random_seed;

in vec2 v_uv;
out vec4 fragColor;

float random(vec2 st) {
    return fract(sin(dot(st.xy,
                vec2(12.9898, 78.233))) *
            43758.5453123);
}
// 2D Noise based on Morgan McGuire @morgan3d
// https://www.shadertoy.com/view/4dS3Wd
float noise(in vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    // Four corners in 2D of a tile
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    // Smooth Interpolation

    // Cubic Hermine Curve.  Same as SmoothStep()
    vec2 u = f * f * (3.0 - 2.0 * f);
    // u = smoothstep(0.,1.,f);

    // Mix 4 coorners percentages
    return mix(a, b, u.x) +
        (c - a) * u.y * (1.0 - u.x) +
        (d - b) * u.x * u.y;
}
vec2 uv_to_extended_uv(vec2 uv) {
    return uv * max(vec2(u_resolution.x / u_resolution.y, 1.), vec2(1., u_resolution.y / u_resolution.x)) - vec2(.5, 0.);
}

void main() {
    float t = u_random_seed + u_time;
    vec2 extended_uv = uv_to_extended_uv(v_uv);
    vec3 col = vec3(0.);

    // stars
    float star_noise = smoothstep(.95, 1., noise(extended_uv * 1000. + t * .1));
    col += star_noise;

    // nebula
    float nebula_noise = noise(extended_uv * 3. - vec2(t * .05, t * .1)) * .25;
    col += nebula_noise * SKY_500;

    // mask
    float dist_from_center = smoothstep(.1, .9, distance(extended_uv, uv_to_extended_uv(vec2(.5))));
    col *= vec3(dist_from_center);
    fragColor = vec4(col, 1.0);
}
