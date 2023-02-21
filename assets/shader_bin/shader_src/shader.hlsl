#if defined(IS_PIXEL_SHADER) && IS_PIXEL_SHADER
#define PIXEL_REGISTER(index) : register(index)
#else
#define PIXEL_REGISTER(index)
#endif

#if defined(IS_VERTEX_SHADER) && IS_VERTEX_SHADER
#define VERTEX_REGISTER(index) : register(index)
#else
#define VERTEX_REGISTER(index)
#endif

#define SAMPLER_REGISTER(index) : register(index)

#ifndef PS3
#define PS3_SAMPLER_REGISTER(index)
#else
#define PS3_SAMPLER_REGISTER(index) : register(index)
#endif

#ifdef CG
#define UNROLL
#else
#define UNROLL	[unroll]
#endif

#define		LIGHT_NONE	0
#define		LIGHT_SUN	1
#define		LIGHT_SPOT	2
#define		LIGHT_OMNI	3

#define		VERTDECL_DEFAULT		0
#define		VERTDECL_SIMPLE			1

#define		FLOATZ_CLEAR_THRESHOLD	1.5e6
#define		FLOATZ_CLEAR_DEPTH		2.0e6

#define		SIZECONST_WIDTH			0
#define		SIZECONST_HEIGHT		1
#define		SIZECONST_INV_WIDTH		2
#define		SIZECONST_INV_HEIGHT	3

#define		SPOTLIGHT_DOT_SCALE		0
#define		SPOTLIGHT_DOT_BIAS		1
#define		SPOTLIGHT_EXPONENT		2
#define		SPOTLIGHT_SHADOW_FADE	3

#define     M_PI                    3.14159265358979323846

#define     vec2    float2
#define     vec3    float3
#define     vec4    float4
#define     mat2    float2x2
#define     mat3    float3x3
#define     mix     lerp
#define     mod     fmod
#define     fract   frac

float4x4	worldMatrix VERTEX_REGISTER(c4); // from object space to world space
float4x4    inverseWorldMatrix VERTEX_REGISTER(c28); // camera pos in world space (output.cameraPos = inverseWorldMatrix[3];) // mostly for models
float4x4    transposeWorldMatrix; // VERTEX_REGISTER(c28);
float4x4    inverseTransposeWorldMatrix;

float4x4	projectionMatrix VERTEX_REGISTER(c0); // was c8
float4x4    inverseProjectionMatrix; // VERTEX_REGISTER(c8);
float4x4    transposeProjectionMatrix;
float4x4    inverseTransposeProjectionMatrix;

float4x4	worldViewProjectionMatrix VERTEX_REGISTER(c0);
float4x4    inverseWorldViewProjectionMatrix;
float4x4    transposeWorldViewProjectionMatrix;
float4x4    inverseTransposeWorldViewProjectionMatrix;

float4x4    viewMatrix VERTEX_REGISTER(c8); // had no register ([2].y cam up/down || up = 0.09, forward = 1, down = 0.09)
float4x4	inverseViewMatrix VERTEX_REGISTER(c28); // EYEPOS = _m30, _m31, _m32, (_m33)  || inverseViewMatrix[3] // camera pos for world objects
float4x4    transposeViewMatrix;
float4x4    inverseTransposeViewMatrix;

float4x4	viewProjectionMatrix VERTEX_REGISTER(c0);
float4x4	inverseViewProjectionMatrix VERTEX_REGISTER(c4);
float4x4    transposeViewProjectionMatrix;
float4x4    inverseTransposeViewProjectionMatrix;

float4x4	worldViewMatrix VERTEX_REGISTER(c4);
float4x4	inverseWorldViewMatrix VERTEX_REGISTER(c28);
float4x4    transposeWorldViewMatrix;
float4x4	inverseTransposeWorldViewMatrix VERTEX_REGISTER(c8); // used to transform the vertex normal from object space to world space

float4x4	shadowLookupMatrix VERTEX_REGISTER(c24);
float4x4    inverseShadowLookupMatrix;
float4x4    transposeShadowLookupMatrix;
float4x4    inverseTransposeShadowLookupMatrix;

float4x4 	worldOutdoorLookupMatrix VERTEX_REGISTER(c24);
float4x4    inverseWorldOutdoorLookupMatrix;
float4x4    transposeWorldOutdoorLookupMatrix;
float4x4    inverseTransposeWorldOutdoorLookupMatrix;

#define     eyePos inverseViewMatrix[3]

float4      pixelCostDecode;
float4      pixelCostFracs;
float4      debugBumpmap;

float4      dofEquationViewModelAndFarBlur;
float4      dofEquationScene;
float4      dofLerpScale;
float4      dofLerpBias;
float4      dofRowDelta;

float4		lightPosition;
float4		lightDiffuse;
float4		lightSpecular;
float4		lightSpotDir;
float4		lightSpotFactors;
float4		lightFalloffPlacement;

float4		spotShadowmapPixelAdjust;

float4		glowSetup;
#define		GLOW_SETUP_CUTOFF				0
#define		GLOW_SETUP_CUTOFF_RESCALE		1
#define		GLOW_SETUP_DESATURATION			3

float4		glowApply;
#define		GLOW_APPLY_SKY_BLEED_INTENSITY	0
#define		GLOW_APPLY_BLOOM_INTENSITY		3

// Ingame Shader Manipulation with:

// glowApply        :: Manditory -> r_glowUseTweaks 1 (!without! r_glowTweakEnable)
// glowApply.w      :: r_glowTweakBloomIntensity0 = 0.0 - 20.0

// glowSetup        :: Manditory -> r_glowUseTweaks 1 (!without! r_glowTweakEnable)
// glowSetup.w      :: r_glowTweakBloomDesaturation = 0.0 - 1.0
// glowSetup.x      :: r_glowTweakBloomCutoff = 0.0 - 1.0;

// sunSpecular.x    :: r_specularColorScale = 0.0 - 100.0; (influenced by r_lightTweakSunLight ... default sunlight set in radiant, even when dvar > 1.0 counts as 1)

float4 		baseLightingCoords          VERTEX_REGISTER(c8);
float4 		codeMeshArg[2]              VERTEX_REGISTER(c8);

float4 		featherParms                VERTEX_REGISTER(c12);
float4		falloffParms                VERTEX_REGISTER(c13); // NO PIXEL
float4		falloffBeginColor           VERTEX_REGISTER(c14); // NO PIXEL
float4		falloffEndColor             VERTEX_REGISTER(c15); // NO PIXEL
float4		eyeOffsetParms              VERTEX_REGISTER(c16); // NO PIXEL

float4		detailScale                 VERTEX_REGISTER(c12);
float4		detailScale1;
float4		detailScale2;
float4		detailScale3;
float4		detailScale4;

float4      distortionScale             VERTEX_REGISTER(c12);
float4		nearPlaneOrg                VERTEX_REGISTER(c13);
float4		nearPlaneDx                 VERTEX_REGISTER(c14);
float4		nearPlaneDy                 VERTEX_REGISTER(c15);

float4		renderTargetSize            VERTEX_REGISTER(c16);
float4		particleCloudMatrix         VERTEX_REGISTER(c16);
float4		clipSpaceLookupScale        VERTEX_REGISTER(c17);
float4		clipSpaceLookupOffset       VERTEX_REGISTER(c18);

float4		depthFromClip               VERTEX_REGISTER(c20);
float4		fogConsts                   VERTEX_REGISTER(c21);
float4		fogColor                    VERTEX_REGISTER(c22) PIXEL_REGISTER(c0);
float4		gameTime                    VERTEX_REGISTER(c22);
// gameTime.w increases linearly forever, and appears to be measured in seconds.
// gameTime.x is a sin wave, amplitude approx 1, period 1.
// gameTime.y is similar, maybe a cos wave?
// gameTime.z goes from 0 to 1 linearly then pops back to 0 once per second

#define     texelSizeX   (1.0 / renderTargetSize.x)
#define     texelSizeY   (1.0 / renderTargetSize.y)

float4		outdoorFeatherParms;
float4		materialColor               PIXEL_REGISTER(c1);
float4		shadowmapSwitchPartition    PIXEL_REGISTER(c2);
float4		shadowmapPolygonOffset      PIXEL_REGISTER(c2);
float4		particleCloudColor          PIXEL_REGISTER(c3);
float4		shadowmapScale              PIXEL_REGISTER(c4);
float4		zNear                       PIXEL_REGISTER(c4);
float4 		lightingLookupScale         PIXEL_REGISTER(c5);
float4      waterColor                  PIXEL_REGISTER(c6);
float4		waterMapParms;
float4		shadowParms;
float4		specularStrength;

float4 		colorMatrixR;
float4 		colorMatrixG;
float4 		colorMatrixB;

float4 		colorTintBase;
float4 		colorTintDelta;
float4 		colorBias;

float4		colorTint;
float4		colorTint1;
float4		colorTint2;
float4		colorTint3;
float4		colorTint4;

float4		sunPosition   PIXEL_REGISTER(c17);  // r_lighttweaksunposition || sunPosition is light direction
float4		sunDiffuse    PIXEL_REGISTER(c18);  // r_lighttweaksunlight
float4		sunSpecular   PIXEL_REGISTER(c19);  // r_specularcolorscale

#define		ENV_INTENSITY_MIN		0
#define		ENV_INTENSITY_MAX		1
#define		ENV_EXPONENT			2
#define		SUN_INTENSITY_SCALE		3

float4		envMapParms;
float4		envMapParms1;
float4		envMapParms2;
float4		envMapParms3;
float4		envMapParms4;


float4		filterTap[8] : register(c9); // VERTEX_REGISTER(c10) PIXEL_REGISTER(c20); //: register(c10);


#define MENU_HIGHLIGHT_RADIUS       filterTap[6][0]
#define MENU_HIGHLIGHT_BRIGHTNESS   filterTap[6][1]
#define MENU_OUTLINE_RADIUS         filterTap[6][2]
#define MENU_OUTLINE_BRIGHTNESS     filterTap[6][3]

#define MENU_MOUSEX                 filterTap[7][0]
#define MENU_MOUSEY                 filterTap[7][1]
#define MENU_DBG                    filterTap[7][2]
#define MENU_TIME                   filterTap[7][3]

sampler		colorMapSampler;  // SAMPLER_REGISTER(s0);
sampler		colorMapSampler1; // SAMPLER_REGISTER(s4);
sampler		colorMapSampler2; // SAMPLER_REGISTER(s5);
sampler		colorMapSampler4;

sampler		lightmapSamplerPrimary      SAMPLER_REGISTER(s2);
sampler		lightmapSamplerSecondary    SAMPLER_REGISTER(s3);

sampler		dynamicShadowSampler;
sampler		shadowCookieSampler;
sampler		shadowmapSamplerSun;
sampler		shadowmapSamplerSpot;
sampler		normalMapSampler; // SAMPLER_REGISTER(s4);
sampler		normalMapSampler1;
sampler		normalMapSampler2;
sampler		normalMapSampler3;
sampler		normalMapSampler4;
sampler		specularMapSampler;
sampler		specularMapSampler1;
sampler		specularMapSampler2;
sampler		specularMapSampler3;
sampler		specularMapSampler4;
sampler		specularitySampler;
sampler		cinematicYSampler;
sampler		cinematicCrSampler;
sampler		cinematicCbSampler;
sampler		cinematicASampler;
sampler		attenuationSampler;

sampler     feedbackSampler;
sampler     colorMapPostSunSampler;
sampler 	modelLightingSampler; // SAMPLER_REGISTER(s4);

sampler		floatZSampler;
sampler		rawFloatZSampler;
sampler		processedFloatZSampler;

sampler 	outdoorMapSampler;
sampler 	lookupMapSampler;

sampler 	blurSampler;

sampler		detailMapSampler;
sampler		detailMapSampler1;
sampler		detailMapSampler2;
sampler		detailMapSampler3;
sampler		detailMapSampler4;

samplerCUBE	skyMapSampler;
samplerCUBE	cubeMapSampler;
samplerCUBE	reflectionProbeSampler SAMPLER_REGISTER(s1);
