﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/RGB_Cube" {
	SubShader 
	{
	Pass 
	{
	CGPROGRAM 

#pragma vertex vert
#pragma fragment frag

	struct vertexOutput {
		float4 pos : SV_POSITION;
		float4 col : TEXCOORD0;
};

	vertexOutput vert(float4 vertexPos : POSITION)
	{
		vertexOutput output;

		output.pos = UnityObjectToClipPos(vertexPos);
		output.col = vertexPos + float4 (0.5, 0.5, 0.5, 0.0);
		return output;
	}

	float4 frag (vertexOutput input)  : COLOR
	{
	return input.col;
	}

		ENDCG

	}
	}
}
