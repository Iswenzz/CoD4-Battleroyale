#define PC
#define IS_VERTEX_SHADER 1
#define IS_PIXEL_SHADER 0
#include <common.hlsl>

struct VertexShaderInput
{
	float4 position : POSITION;
	float4 uv : TEXCOORD0;
};

struct PixelShaderInput
{
	float4 position : POSITION;
	float2 uv : TEXCOORD0;
};

PixelShaderInput vs_main(VertexShaderInput input)
{
	PixelShaderInput output;
	output.position = mul(float4(input.position.xyz, 1.0f), worldViewProjectionMatrix);
	output.uv = computeTextureUV(input.uv);

	return output;
}
