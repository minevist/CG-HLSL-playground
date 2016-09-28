Shader "Custom/Legendary outline of Object" { 

Properties {

_Tint ("Tint", Color) = (1,1,1,1)

}

SubShader {
Pass {
CGPROGRAM 
#pragma vertex vrtxprgrm
#pragma fragment frgmprgm

#include "UnityCG.cginc"

float4 _Tint;


float4 vrtxprgrm (float4 position : POSITION ) : SV_POSITION {
return mul (UNITY_MATRIX_MVP, position );

}

float4 frgmprgm (
float4 inputfrgm : SV_POSITION

) : SV_TARGET {
return _Tint;

}
ENDCG

}
}
}