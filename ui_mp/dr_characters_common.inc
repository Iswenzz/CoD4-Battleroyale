		
// character
		itemDef 
		{
			rect			90 -64 140 130 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER
			style			WINDOW_STYLE_SHADER
			exp				material( tableLookup(CHARACTER_TABLE, 0, dvarInt("drui_character")+1, 3) )
			border			3
			bordercolor		.4 .4 .4 .8
			forecolor		1 1 1 1
			visible			1
			decoration
		}



