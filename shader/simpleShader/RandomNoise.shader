Shader "Custom/RandomNoise" {
	Properties{
		_MainTex("Albedo (RGB)", 2D) = "white" {}
		_Value("Value", Range(0,100)) = 50
	}
		SubShader{
			Tags { "RenderType" = "Opaque" }
			LOD 200

			CGPROGRAM
			#pragma surface surf Standard fullforwardshadows
			#pragma target 3.0

			sampler2D _MainTex;
			float _Value;

			struct Input {
				float2 uv_MainTex;
			};

			float random(fixed2 p) {
				return frac(sin(dot(p, fixed2(12.9898,78.233))) * (43758.5453 + _Value));
			}

			void surf(Input IN, inout SurfaceOutputStandard o) {
				float c = random(IN.uv_MainTex);
				o.Albedo = fixed4(c,c,c,1);
			}
			ENDCG
	}
		FallBack "Diffuse"
}