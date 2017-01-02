Shader "Custom/CGdev_example1" {

	Properties{
		_Tint("Color", Color) = (1,1,1,1)
	}
		SubShader{
		Pass {
		CGPROGRAM
	#pragma vertex C2E1v_green
	#pragma fragment C2E2f_passthrough



		float4 _Tint;

		struct C2E1v_Output {

		float4 position : POSITION;

		float4 color    : COLOR;

	};

	C2E1v_Output C2E1v_green(float2 position : POSITION)

	{

		C2E1v_Output OUT;

		OUT.position = float4(position, 0, 1);

		OUT.color = float4(0, 1, 0, 1); 

		return OUT;

	}

	struct C2E2f_Output {

		float4 color : COLOR;

	};

	C2E2f_Output C2E2f_passthrough(float4 color : COLOR)

	{

		C2E2f_Output OUT;

		OUT.color = color;

		return OUT;

	}

	ENDCG
	}
	}
}