﻿Shader "Custom/BasicShader" {

	Properties{
		_Tint("Color", Color) = (1,1,1,1)
	}
		SubShader{
		Pass {
		CGPROGRAM
	#pragma vertex vert
	#pragma fragment frag

	#include "UnityCG.cginc"

		float4 _Tint;

	float4 vert (float4 pozicija: POSITION) : SV_POSITION {
	return mul (UNITY_MATRIX_MVP, pozicija);
	}

	float4 frag (float4 vertOut: SV_POSITION) : SV_TARGET {
		
		return _Tint;
	}

	ENDCG
	}
	}
}