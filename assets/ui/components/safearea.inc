#ifdef CONSOLE

itemDef
{
	style			WINDOW_STYLE_FILLED
	rect			-100 -100 100 600 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
	backcolor		COLOR_SAFEAREA
	visible			1
	dvarTest		"ui_safearea"
	showDVar		{ "1" }
	decoration
}

itemDef
{
	style			WINDOW_STYLE_FILLED
	rect			0 -100 100 600 HORIZONTAL_ALIGN_RIGHT VERTICAL_ALIGN_TOP
	backcolor		COLOR_SAFEAREA
	visible			1
	dvarTest		"ui_safearea"
	showDVar		{ "1" }
	decoration
}

itemDef
{
	style			WINDOW_STYLE_FILLED
	rect			0 -100 900 100 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_TOP
	backcolor		COLOR_SAFEAREA
	visible			1
	dvarTest		"ui_safearea"
	showDVar		{ "1" }
	decoration
}

itemDef
{
	style			WINDOW_STYLE_FILLED
	rect			0 0 900 100 HORIZONTAL_ALIGN_LEFT VERTICAL_ALIGN_BOTTOM
	backcolor		COLOR_SAFEAREA
	visible			1
	dvarTest		"ui_safearea"
	showDVar		{ "1" }
	decoration
}

#endif
