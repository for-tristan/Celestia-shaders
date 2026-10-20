
#version 330 compatibility

uniform sampler2D colortex0;

in vec2 texcoord;

/* RENDERTARGETS: 0 */
layout(location = 0) out vec4 color;

void main() {
    // Read the original Minecraft pixel.
    color = texture(colortex0, texcoord);

    // Calculate the pixel's perceived brightness.
    float luminance = dot(
        color.rgb,
        vec3(0.2126, 0.7152, 0.0722)
    );

    // Slightly increase color saturation.
    color.rgb = mix(
        vec3(luminance),
        color.rgb,
        1.12
    );

    // Add a small amount of contrast.
    color.rgb = (color.rgb - 0.5) * 1.06 + 0.5;

    // Keep the output in the valid color range.
    color.rgb = clamp(color.rgb, 0.0, 1.0);
}
