Shader "Custom/ExtrudeNormals"{
	Properties{
		_Amount ("Amount", Range (-1,1)) = 0
		_Tint ("Tint", Color ) = (1,1,1,1)
	}
		SubShader{
		Tags {"Queue" = "Geometry"
		}

			CGPROGRAM
#pragma surface surf Lambert vertex:vert

		struct Input { float4 _Tint : COLOR; };

			float _Amount;
			float4 _Tint;

		void vert(inout appdata_full v) {
			v.vertex.xyz += v.normal * _Amount;
		}


		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = _Tint;
		}
			ENDCG
	}
	}
