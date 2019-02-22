		itemDef
		{
			style			WINDOW_STYLE_SHADER
			rect			FULLSCREEN_WIDE
			background		"deathrun"
			visible			1
			decoration
		}

		itemDef
		{
		style			WINDOW_STYLE_FILLED
	    rect			-120 410 1000 80 
		border			1
		bordercolor		.2 .2 .2 .55
		forecolor		1 1 1 1
		backcolor		0 0 0 0.6
		visible			1
		}

	    itemDef
		{
		style			WINDOW_STYLE_FILLED
	    rect			-120 -10 1000 80 
		border			1
		bordercolor		.2 .2 .2 .55
		forecolor		1 1 1 1
		backcolor		0 0 0 0.6
		visible			1
		}
		
		// Animated Fog
		itemDef 
		{
			style			WINDOW_STYLE_SHADER
			rect			-107 0 2408 480
			exp				rect X( (-607) + (cos(milliseconds()/10000) * 400) )
            background		"animbg_blur_fogscroll"
			forecolor		0 0 0 0.6
			visible			1
			decoration
		}