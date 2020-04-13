Shader "Custom/UVScroll"
{
	Properties{
		_MainTex("Water Texture", 2D) = "white" {}
		_xSpeed("XSpeed", Range(0,1)) = 0.1
		_ySpeed("YSpeed", Range(0,1)) = 0.2
	}
		SubShader{
			Tags { "RenderType" = "Opaque" }
			LOD 200

			CGPROGRAM
			#pragma surface surf Standard fullforwardshadows
			#pragma target 3.0

			sampler2D _MainTex;

			struct Input {
				float2 uv_MainTex;
			};

			float _xSpeed;
			float _ySpeed;

			void surf(Input IN, inout SurfaceOutputStandard o) {
				fixed2 uv = IN.uv_MainTex;
				uv.x += _xSpeed * _Time;
				uv.y += _ySpeed * _Time;
				o.Albedo = tex2D(_MainTex, uv);
			}
			ENDCG
	}
		FallBack "Diffuse"
}