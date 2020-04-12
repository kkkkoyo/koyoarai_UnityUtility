Shader "Custom/Transparent" {
	Properties{
		_alpha("Alpha", Range(0, 1)) = 1
	}
	SubShader {
		Tags { "Queue" = "Transparent" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Standard alpha:fade 
		#pragma target 3.0

		struct Input {
			float2 uv_MainTex;
		};

		float _alpha;
		void surf (Input IN, inout SurfaceOutputStandard o) {
			o.Albedo = fixed4(1, 1, 1, 1);
			o.Alpha = _alpha;
		}
		ENDCG
	}
	FallBack "Diffuse"
}