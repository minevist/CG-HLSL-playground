Shader "Custom/MultiFade" {
	Properties{
		_Tint("Tint", Color) = (1, 1, 1, 1)	
		_HeightY("Height", Range(0,10)) = 5.0

	}
		SubShader{
		Tags{ "RenderType" = "Transparent"
		"Queue" = "Transparent+10" }
		LOD 200
		
		//ZWrite Off

		CGPROGRAM
#pragma surface surf Standard  alpha:fade 
	struct Input {
		float4 _Tint : COLOR;
		float3 worldPos;
	};
	
	float _HeightY;
	float4 _Tint;

	void surf(Input IN, inout SurfaceOutputStandard o) {		
		if (IN.worldPos.y < _HeightY) {
			o.Albedo = _Tint.rgb;
			o.Alpha = 1;		
		}
		else {
			o.Albedo = _Tint.rgb;
			o.Alpha = _Tint.a;
		}		
	}
	ENDCG
	}
		Fallback "Standard"
}