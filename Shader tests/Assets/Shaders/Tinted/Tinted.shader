// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Tinted" { 
Properties {
_Tint ("Tint", Color) = (1,1,1,1)
}

SubShader {
Pass {
CGPROGRAM 
#pragma vertex vrtx
#pragma fragment frgm
#include "UnityCG.cginc"

float4 _Tint;

struct Interpolators 
{float4 position : SV_POSITION;
 };

 struct VertexData {
 float4 position : POSITION ; 
 } ;

Interpolators vrtx (VertexData v) {
Interpolators i ;
i.position = UnityObjectToClipPos (v.position );

return i;
}
float4 frgm (Interpolators i) : SV_TARGET {
return  _Tint ;
}
ENDCG
}
}
}