Shader "Custom/TexturedExtrudeNormal" {
Properties{
	_MainTex("Texture", 2D) = "white" {}
_Amount("Extrusion Amount", Range(-0.1,0.1)) = 0
_Tint("Tint", Color) = (1, 1, 1, 1)
}
SubShader{
	Tags{ "RenderType" = "Opaque"
	"Queue"= "Geometry" }

	CGPROGRAM
#pragma surface surf Lambert vertex:vert
struct Input {
	float2 uv_MainTex;
	float4 _Tint : COLOR;
};
half _Amount;
void vert(inout appdata_full v) {
	v.vertex.xyz += v.normal * _Amount;
}
float4 _Tint;
void surf(Input IN, inout SurfaceOutput o) {
	o.Albedo = _Tint;
}
ENDCG
}
Fallback "Diffuse"
  }