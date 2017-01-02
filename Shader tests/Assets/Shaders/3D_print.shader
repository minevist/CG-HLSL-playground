﻿Shader "Custom/3D_print" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_Color2 ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows	

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
			float3 worldPos;
		};		

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;
		fixed4 _Color2;

		float _HeightY;

		int building;
		void surf (Input IN, inout SurfaceOutputStandard o) {
			if (IN.worldPos.y < _HeightY)
			{				
				fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
				o.Albedo = _Color.rgb;
				o.Alpha = _Color.a;
			}
			else
			{
				o.Albedo = _Color2.rgb;
				o.Alpha = _Color2.a;
			}

		}
		ENDCG
	}
	FallBack "Diffuse"
}
