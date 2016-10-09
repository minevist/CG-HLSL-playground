Shader "Custom/Custom_lighting" {
	Properties{
	_Tint ("Color", Color) = (1,1,1,1)
	}
		SubShader{
	Tags { "RenderType" = "Opaque" }
	CGPROGRAM
#pragma surface surf SimpleLambert

		struct Input {
			float2 uv_MainTex;
};

	float4 _Tint;
		
		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = _Tint;
		}

		half4 LightingSimpleLambert(SurfaceOutput s, half3 lightdir, half atten) {
			half NdotL = dot(s.Normal, lightdir);
			half4 c;
			c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten  );
			return c;
		}

		ENDCG
	}
		Fallback "Diffuse"
}