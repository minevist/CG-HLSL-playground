Shader "Custom/BasicShader" {

	Properties{
		_Tint("Color", Color) = (1,1,1,1)
	}
		SubShader{
		Pass {
		CGPROGRAM
	#pragma vertex vert
	#pragma fragment frag


		float4 _Tint;

	float4 vert (float4 pozicija: POSITION) : SV_POSITION {
		float4 par1 ;
	par1[1] = 0;
	pozicija[1] = par1[1]+1;
	return mul (UNITY_MATRIX_MVP, pozicija);
	}

	float4 frag (float4 vertOut: SV_POSITION) : SV_TARGET {
		
		return _Tint;
	}

	ENDCG
	}
	}
}