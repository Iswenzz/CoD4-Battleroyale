#include <shader.hlsl>

float cubicSmoothstep(float edge0, float edge1, float x)
{
	if (x < edge0)
		x = 0.0;
	if (x >= edge1)
		x = 1.0;

	if (x <= 0.0 && x >= 1.0)
	{
		x = (x - edge0) / (edge1 - edge0);
		x *= x * (3.0 - 2.0 * x);
	}
	return x;
}

float2 mirrorUV(float2 uv)
{
	float2 t = frac(uv * 0.5) * 2.0;
    float2 length = {1.0, 1.0};
    return length - abs(t - length);
}

float2 wrapUV(float2 uv)
{
	return fract(uv);
}

// Unpack fixed integer uv coordinates
float2 computeTextureUV(const float4 uv)
{
	// Fixed-point integer texcoords to float :: int / 2^10 does the same as int >> 10
    float4 fixedCoords = float4(uv.zx / exp2(10), uv.zx / exp2(15))
		+ float4(uv.wy / exp2(2),  uv.wy / exp2(7));

    float4 fractionalParts = frac(fixedCoords);
    float4 setup;

	setup.xy = fractionalParts.xy * -0.03125 + fractionalParts.zw;
	setup.zw = fixedCoords.zw + -fractionalParts.zw;
	setup = setup * float4(32, 32, -2, -2) + float4(-15, -15, 1, 1);
	setup.zw = setup.zw * fractionalParts.xy + setup.zw;

    return setup.zw * exp2(setup.xy);
}

// Unpack packed vertex normals
float4 computeNormal(const float4 normal)
{
    // Unpack normals
    float3 unpackedNormal = normal.xyz * (1.0f / 127.0f) + float3(-1.0f, -1.0f, -1.0f);
    unpackedNormal *= (normal.w * (1.0f / 255.0f) + (1.0f / 1.328f));

    // Return without fog (.w = 1.0)
    float4 worldNormal = mul(float4(unpackedNormal, 1.0), worldMatrix);
   	worldNormal.w = 1.0f;

    return worldNormal;
}

// Calculate fog using world-transformed vertices
float computeFog(const float4 worldPosition)
{
    float fog = sqrt(dot(worldPosition.xyz, worldPosition.xyz)) * fogConsts.z + fogConsts.w;
    fog *= 1.442695f;
    return exp2(saturate(fog));
}

// Fix shader compiler error from unused input variables.
float fix(float input)
{
	return input * 0.00000001;
}
