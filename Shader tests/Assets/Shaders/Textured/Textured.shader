// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Textured"{


Properties {
_MainTex ("Texture", 2D) = "white" {} 


}

SubShader {

Pass {
CGPROGRAM 
#pragma vertex vrtx 
#pragma fragment frgm

#include "UnityCG.cginc"

sampler2D _MainTex; 

struct Interpolators {
float4 position : SV_POSITION;
float2 uv : TEXCOORD0;
};

struct VertexData {
float4 position : POSITION; float2 uv: TEXCOORD0;
} ;

Interpolators vrtx (VertexData v) {
Interpolators i;
i.position = UnityObjectToClipPos (v.position);
i.uv = v.uv;
return i;
}

float4 frgm (Interpolators i) : SV_TARGET {
return  tex2D (_MainTex, i.uv) ;


}
ENDCG

}




}

}