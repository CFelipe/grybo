#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoord;

out vec2 texCoord;
out float fogIntensity;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform float fogZ;
uniform float fogBand;

void main() {
  gl_Position = projection * view * model * vec4(aPos, 1.0);
  texCoord = vec2(aTexCoord.x, aTexCoord.y);
  fogIntensity = 1 - smoothstep(fogZ, fogZ + fogBand, gl_Position.z);
}
