Shader "Custom/Custom_lighting" {
	Properties{
	_MainTex("Texture", 2D) = "white" {}
	}
		SubShader{
	Tags { "RenderType" = "Opaque" }
	CGPROGRAM
#pragma surface surf SimpleLambert

		struct Input {
			float2 uv_MainTex;
};

		sampler2D _MainTex;
		
		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}

		half4 LightingSimpleLambert(SurfaceOutput s, half3 lightdir, half atten) {
			half NdotL = dot(s.Normal, lightdir);
			half4 c;
			c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten * 2);
			return c;
		}

		ENDCG
	}
		Fallback "Diffuse"
}