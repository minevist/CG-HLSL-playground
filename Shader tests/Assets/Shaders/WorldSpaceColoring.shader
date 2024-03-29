﻿Shader "Custom/WorldSpaceColoring" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_ConstructColor("CutoutColor", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
			_ConstructY ("ColoringHeight", Range (0, 10) ) = 0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows
		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
			float3 worldPos;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		float _ConstructY;
		fixed4 _ConstructColor;

		void surf(Input IN, inout SurfaceOutputStandard o) {
			if (IN.worldPos.y < _ConstructY)
			{
				fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
				o.Albedo = c.rgb;
				o.Alpha = c.a;
			}
			else
			{
				o.Albedo = _ConstructColor.rgb;
				o.Alpha = _ConstructColor.a;
			}
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
		}
		
		ENDCG
	}
	FallBack "Diffuse"
}
