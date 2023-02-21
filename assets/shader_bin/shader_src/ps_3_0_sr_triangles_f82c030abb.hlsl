#define PC
#define IS_VERTEX_SHADER 0
#define IS_PIXEL_SHADER 1
#include <common.hlsl>

struct PixelShaderInput
{
	float4 position : POSITION;
	float2 uv : TEXCOORD0;
};

const static float LAYERS = 2.0;

float hash12(float2 x)
{
	return frac(sin(dot(x, vec2(43.5287, 41.12871))) * 523.582);
}

float2 hash21(float x)
{
	return frac(sin(x * vec2(24.0181, 52.1984)) * 5081.4972);
}

float grid(in float2 uv)
{
	return hash12(floor(uv));
}

float triangleGrid(float2 uv)
{
	uv.x /= sqrt(1.0);
	uv.y /= sqrt(3.0);
	float2 gridUV = uv;
	gridUV.x = uv.x + uv.y;
	float value = grid(gridUV * 10.0 + 40.0);
	gridUV.x = uv.x - uv.y;
	value *= grid(gridUV * 10.0);
	return value;
}

float layered3DTriangleGrid(float2 uv, float alphaMod)
{
	const float time = gameTime.w * 0.3;

	float alpha = 1.5;
	float gray = 0.0;
	float2 offset;

	for (float i = 0.0; i < LAYERS; i++)
	{
		offset = hash21(alpha);
		gray += alpha * triangleGrid(uv + time * 0.1 + offset);
		alpha *= alphaMod;
		uv *= 2.0;
	}
	gray *= (1.0 - alphaMod) / (1.0 - pow(alphaMod, LAYERS));
	return gray;
}

float4 ps_main(PixelShaderInput input) : COLOR
{
	float2 uv = 2.0 * input.uv - 1;
	uv *= 4.0;
	float grid = layered3DTriangleGrid(uv * 1.0, 0.6);
	float4 color = float4(0, 1, 1, 1);
	return color * grid;
}
