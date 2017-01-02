Shader "Custom/Surf Tinted"{
	Properties{
		
		_Tint("Tint", Color) = (1,1,1,1)
	}
		SubShader{
		Tags{ "Queue" = "Geometry"
	}

		CGPROGRAM
#pragma surface surf Lambert 

		struct Input { float4 _Tint : COLOR; };

		float4 _Tint;

	

	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = _Tint;
	}
	ENDCG
	}
}
