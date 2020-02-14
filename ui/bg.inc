#undef	FOG_SCROLL_TIME
#define FOG_SCROLL_TIME 60000 //30000

#undef	THINFOG_SCROLL_TIME
#define THINFOG_SCROLL_TIME 100000 //50000

		itemDef
		{
			style			WINDOW_STYLE_SHADER
			rect			FULLSCREEN_WIDE
			background		"bg_theme"
			visible			1
			decoration
		}

		// Frame background
		blurworld		1
		itemDef
		{
			style			WINDOW_STYLE_SHADER
			rect			-40 -40 1000 112 HORIZONTAL_ALIGN_FULLSCREEN VERTICAL_ALIGN_FULLSCREEN
			background		"black"
			border			1
			bordercolor		0 0 0 0.5
			bordersize		3
			forecolor		0 0 0 1
			visible			1
			decoration
		}
		itemDef
		{
			style			WINDOW_STYLE_SHADER
			rect			-40 408 1000 112 HORIZONTAL_ALIGN_FULLSCREEN VERTICAL_ALIGN_FULLSCREEN
			background		"black"
			forecolor		0 0 0 1
			border			1
			bordercolor		0 0 0 1
			bordersize		3
			visible			1
			decoration
		}


