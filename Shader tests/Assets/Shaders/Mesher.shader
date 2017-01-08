Shader "Custom/Mesher" {
	SubShader{
		Pass{
		Cull Off

		CGPROGRAM

#pragma vertex vert
#pragma fragment frag
//#pragma geometry myGeo


		struct vertexInput {
		float4 vertex : POSITION;
	};
	struct vertexOutput {
		float4 pos: SV_POSITION;
	};

	vertexOutput vert(vertexInput input) {
		vertexOutput output;
		output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
		return output;
	}

	

	float4 frag(vertexOutput input) : COLOR
	{		
	return float4 (1.0, 1, 0.0, 1.0);
	}
		ENDCG
	}
	}
}
