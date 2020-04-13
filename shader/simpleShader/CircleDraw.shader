Shader "Custom/CircleDraw" {

	Properties
	{
		_CenterColor("CenterColor", Color) = (1,1,1,1)
		_OutSideColor("OutSideColor", Color) = (1,1,1,1)
	}

	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard 
		#pragma target 3.0

		fixed4 _CenterColor;
		fixed4 _OutSideColor;

		struct Input {
			float3 worldPos;
		};

		void surf(Input IN, inout SurfaceOutputStandard o) {
			float dist = distance(fixed3(0,0,0), IN.worldPos);
			float val = abs(sin(dist*3.0 - _Time * 100));
			if (val > 0.9) {
				o.Albedo = _OutSideColor;
			}
			 else {
			  o.Albedo = _CenterColor;
			}
		}
		ENDCG
	}
		FallBack "Diffuse"
}