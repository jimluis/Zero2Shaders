Shader "Unlit/Zero2Shaders/SolidColor"
{
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            
            //declare our vertex and fragment programs
            //To do that we are going to use a preprocessor directive called a pragma
            // the pragma's name is going to be vertex
            // After doing that, we are going to declare a function name, that the preprocessor will look for
            // to use as a vertex program, and we are going to call it vert
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"
            //data contaning all of the mesh attributes
            struct appdata
            {
                //this tells the CD program that the position variable, should be populated with the 
                // incoming position from the mesh
                //Object space position in the coordinate system of the object. It is not in clip space
                float4 position : POSITION; 
                
                
            };
            //vertex to fragment struct - return type from vert function
            struct v2f
            {
            //System value position - Identifies the piece of information that is going to be sent to the rasterizer 
            //to make triagles out of.
                float4 vertex : SV_POSITION; 
            };
            
            //This function is going to be a state shader stage that is pulling in all of the mesh attributes, like position, normals
            //text codes and so forth, and the way this function is going to get this struct of appdata passed into it.
            //copied and interpolated for every single fragment that covers the triagle tha this vertex is attched to
            v2f vert(appdata v)
            {
            // o means out
                v2f o;
                
                //this position should be in clip space, so it needs to be converted
                o.vertex = UnityObjectToClipPos(v.position);
                
                return o;
            }
            
            //the frag function always return a color - what color this fragment should be
            // al calors in shades go form 0-1
            fixed4 frag(v2f i) : SV_Target
            {
                return float4(1.0, 1.0, 0.0, 1.0);
            }
            
            ENDCG
        }
    }
}
