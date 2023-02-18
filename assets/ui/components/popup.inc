#ifndef LAYOUT_BORDER_X
#define LAYOUT_BORDER_X	4
#endif

#ifndef LAYOUT_BORDER_Y
#define LAYOUT_BORDER_Y	4
#endif

#ifndef LAYOUT_TITLE_WIDTH
#define LAYOUT_TITLE_WIDTH	0
#endif

#ifndef POPUP_TITLE_HEIGHT
#define POPUP_TITLE_HEIGHT	0
#endif

#ifndef LAYOUT_TEXTSTYLE
#define LAYOUT_TEXTSTYLE ITEM_TEXTSTYLE_NORMAL
#endif

#ifndef LAYOUT_TEXTCOLOR
#define LAYOUT_TEXTCOLOR 1 1 1 1
#endif

#ifndef LAYOUT_HORIZONTAL_ALIGN
#define LAYOUT_HORIZONTAL_ALIGN HORIZONTAL_ALIGN_DEFAULT
#endif

#ifndef LAYOUT_VERTICAL_ALIGN
#define LAYOUT_VERTICAL_ALIGN VERTICAL_ALIGN_DEFAULT
#endif

#ifndef LAYOUT_TITLE_TEXTSIZE
#define LAYOUT_TITLE_TEXTSIZE	TEXTSIZE_DEFAULT
#endif

#ifndef LAYOUT_SUBTITLE_WIDTH
#define LAYOUT_SUBTITLE_WIDTH	0
#endif

#ifndef LAYOUT_SUBTITLE_HEIGHT
#define LAYOUT_SUBTITLE_HEIGHT 	0
#endif

#ifndef LAYOUT_SUBTITLE_TEXTSIZE
#define LAYOUT_SUBTITLE_TEXTSIZE	TEXTSIZE_SMALL
#endif

#ifndef CENTER_POPUP_ON_CLOSE
#define CENTER_POPUP_ON_CLOSE play "mouse_click";
#endif

#ifndef LAYOUT_BORDER_WIDTH
#define LAYOUT_BORDER_WIDTH	2
#endif

#ifndef LAYOUT_BORDER_COLOR
#define LAYOUT_BORDER_COLOR	0 0 0 0.5
#endif

#ifndef LAYOUT_BACKCOLOR
#define LAYOUT_BACKCOLOR	0.02 0.02 0.02 0.95
#endif

#ifndef LAYOUT_BACKCOLOR_NOALPHA
#define LAYOUT_BACKCOLOR_NOALPHA	0.1412 0.1412 0.1812
#endif

#undef	BUTTON_FOCUS_SOUND
#define BUTTON_FOCUS_SOUND 		"mouse_submenu_over"

#ifndef LAYOUT_OFFSET_X
#define LAYOUT_OFFSET_X	0
#endif

#ifndef LAYOUT_OFFSET_Y
#define LAYOUT_OFFSET_Y	0
#endif

#ifndef LAYOUT_SIZE_X
#define LAYOUT_SIZE_X			200
#endif

#ifndef LAYOUT_SIZE_Y
#define LAYOUT_SIZE_Y			80
#endif

#ifndef LAYOUT_Y_SPACING
#define LAYOUT_Y_SPACING 		0
#endif

#define POPUP_WIDTH					((LAYOUT_BORDER_X * 2) + ((LAYOUT_TITLE_WIDTH > LAYOUT_SIZE_X) ? LAYOUT_TITLE_WIDTH : LAYOUT_SIZE_X))
#define POPUP_HEIGHT(itemCount)		(POPUP_TITLE_HEIGHT + LAYOUT_SUBTITLE_HEIGHT + (LAYOUT_Y_SPACING * (itemCount) + LAYOUT_BORDER_Y * 2))

#undef LAYOUT_X_START
#define LAYOUT_X_START			((POPUP_WIDTH - LAYOUT_SIZE_X) / 2 - 2)

#undef LAYOUT_Y_START
#define LAYOUT_Y_START			(POPUP_TITLE_HEIGHT + LAYOUT_SUBTITLE_HEIGHT + LAYOUT_BORDER_Y)

#undef LAYOUT_SEPARATOR_TOTAL_SPACING
#define LAYOUT_SEPARATOR_TOTAL_SPACING(itemIndex)	0

#undef LAYOUT_NAME
#define LAYOUT_NAME			"popmenu"

#define LAYOUT_SIDEIMAGE_X 0
#define LAYOUT_SIDEIMAGE_Y 0

#define LAYOUT_SIDETITLE_X 0
#define LAYOUT_SIDETITLE_Y 0

#define LAYOUT_SIDETEXT_X 0
#define LAYOUT_SIDETEXT_Y 0

#define POPMENU_SETUP(nameArg, itemCount, xArg, yArg, onEscArg) \
		POPMENU_SETUP_ONOPEN(nameArg, itemCount, xArg, yArg, onEscArg, focusfirst)

#define POPMENU_SETUP_ONOPEN(nameArg, itemCount, xArg, yArg, onEscArg, onOpenArg) \
		POPMENU_SETUP_ONOPEN_EX(nameArg, itemCount, xArg, yArg, onEscArg, onOpenArg, ;)

#define POPMENU_SETUP_ONOPEN_EX(nameArg, itemCount, xArg, yArg, onEscArg, onOpenArg, extraArgs) \
		name			nameArg \
   		fullscreen		0 \
		rect			(xArg + 1) (yArg + 1) POPUP_WIDTH POPUP_HEIGHT(itemCount) LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		backcolor		LAYOUT_BACKCOLOR \
		border			1 \
		bordersize		LAYOUT_BORDER_WIDTH \
		bordercolor		LAYOUT_BORDER_COLOR \
		focusColor		COLOR_FOCUSED \
   		style			WINDOW_STYLE_FILLED \
		popup \
		extraArgs \
		onOpen \
		{ \
			onOpenArg; \
		} \
		onESC \
		{ \
			play "mouse_click"; \
			close self; \
			onEscArg; \
		}

#define POPMENU_TITLE(textArg) \
		POPMENU_TITLE_VIS(textArg, 1)

#define POPMENU_TITLE_VIS(textArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			((POPUP_WIDTH - LAYOUT_TITLE_WIDTH) / 2) (LAYOUT_BORDER_Y/2) LAYOUT_TITLE_WIDTH POPUP_TITLE_HEIGHT LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			exp				text(textArg); \
			textfont		UI_FONT_NORMAL \
			textscale		LAYOUT_TITLE_TEXTSIZE \
			textAlign		ITEM_ALIGN_TOP_CENTER \
			textstyle		LAYOUT_TEXTSTYLE \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			decoration \
		}

#define POPMENU_SUBTITLE(textArg) \
		POPMENU_SUBTITLE_VIS(textArg, 1)

#define POPMENU_SUBTITLE_VIS(textArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			LAYOUT_BORDER_X (LAYOUT_BORDER_Y + POPUP_TITLE_HEIGHT) (POPUP_WIDTH - (LAYOUT_BORDER_Y*2)) LAYOUT_SUBTITLE_HEIGHT LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			exp				text(textArg); \
			textfont		UI_FONT_NORMAL \
			textscale		LAYOUT_SUBTITLE_TEXTSIZE \
			textAlign		ITEM_ALIGN_TOP_LEFT \
			textstyle		LAYOUT_TEXTSTYLE \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			decoration \
			autowrapped \
		}

#ifdef PC
	#define PREPROC_CANCEL_OVERLAY(shadow_visArg,itemCount) \
		itemDef { \
			type			ITEM_TYPE_BUTTON \
			rect			-600 -800 2000 2000 0 0 \
			text			"" \
			textfont		UI_FONT_NORMAL \
			visible			1 \
			onfocus{ setdvar ui_LAYOUT_close_icon "1" } \
			leavefocus{ setdvar ui_LAYOUT_close_icon "0" } \
			action{ close self; } \
		}\
		itemDef { \
			type			ITEM_TYPE_BUTTON \
			rect			-4 -4 POPUP_WIDTH POPUP_HEIGHT(itemCount) 0 0 \
			text			"" \
			textfont		UI_FONT_NORMAL \
			visible			1 \
			action{ ; } \
		}\
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			-600 -800 2000 2000 0 0 \
			forecolor		0 0 0 0.275 \
			exp				material("white"); \
			visible			when(shadow_visArg); \
			decoration \
		}
#else
	#define PREPROC_CANCEL_OVERLAY(shadow_visArg,itemCount) \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			-600 -800 2000 2000 0 0 \
			forecolor		0 0 0 0.275 \
			exp				material("white"); \
			visible			when(shadow_visArg); \
			decoration \
		}
#endif

#define IMPROVED_POPUP_SETUP(nameArg, itemCount, xArg, yArg, onEscArg, shadow_visArg) \
		IMPROVED_POPUP_SETUP_ONOPEN(nameArg, itemCount, xArg, yArg, onEscArg, focusfirst, shadow_visArg)

// h = (x) => 480 - (24 * x + 8 + 56)
#define IMPROVED_POPUP_SETUP_ONOPEN(nameArg, itemCount, xArg, yArg, onEscArg, onOpenArg, shadow_visArg) \
		IMPROVED_POPUP_SETUP_RAW(nameArg, itemCount, xArg, yArg, onEscArg, onOpenArg, ;, shadow_visArg)

#define IMPROVED_POPUP_SETUP_RAW(nameArg, itemCount, xArg, yArg, onEscArg, onOpenArg, extraArgs, shadow_visArg) \
		name			nameArg \
    	visible			0 \
   		fullscreen		0 \
		rect			(xArg+0) (yArg+56) POPUP_WIDTH POPUP_HEIGHT(itemCount) LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		border			1 \
		bordersize		LAYOUT_BORDER_WIDTH \
		bordercolor		0 0 0 0 \
		focusColor		COLOR_FOCUSED \
   		style			WINDOW_STYLE_FILLED \
		popup \
		extraArgs \
		onOpen \
		{ \
			onOpenArg; \
		} \
		onESC \
		{ \
			play "mouse_click"; \
			close self; \
			onEscArg; \
		}\
		PREPROC_CANCEL_OVERLAY(shadow_visArg, itemCount) \
		PREPROC_SHADER_DRAW(-4 -4 POPUP_WIDTH POPUP_HEIGHT(itemCount), 0 0, "white", LAYOUT_BACKCOLOR, 1, LAYOUT_BORDER_WIDTH, LAYOUT_BORDER_COLOR)

#define CENTER_POPUP_SETUP(nameArg, itemCount, onEscArg, shadow_visArg) \
		CENTER_POPUP_SETUP_ONOPEN(nameArg, itemCount, onEscArg, focusfirst, shadow_visArg)

#define CENTER_POPUP_SETUP_ONOPEN(nameArg, itemCount, onEscArg, onOpenArg, shadow_visArg) \
		CENTER_POPUP_SETUP_RAW(nameArg, itemCount, onEscArg, onOpenArg, ;, shadow_visArg)

#ifndef NO_BG_CLOSE
	#define CENTER_POPUP_SETUP_RAW(nameArg, itemCount, onEscArg, onOpenArg, extraArgs, shadow_visArg) \
			name			nameArg \
	   		fullscreen		0 \
			rect			(0-(POPUP_WIDTH/2)) (0-(POPUP_HEIGHT(itemCount)/2)) POPUP_WIDTH POPUP_HEIGHT(itemCount) HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
			border			1 \
			backcolor		0 0 0 0 \
			bordersize		LAYOUT_BORDER_WIDTH \
			bordercolor		LAYOUT_BORDER_COLOR \
			focusColor		COLOR_FOCUSED \
	   		style			WINDOW_STYLE_FILLED \
			popup \
			extraArgs \
			onOpen \
			{ \
				setLocalVarBool	ui_centerPopup 1; \
				onOpenArg; \
			} \
			onClose \
			{ \
				CENTER_POPUP_ON_CLOSE \
				setLocalVarBool	ui_centerPopup 0; \
			} \
			onESC \
			{ \
				setLocalVarBool	ui_centerPopup 0; \
				close self; \
				onEscArg; \
			} \
			PREPROC_CANCEL_OVERLAY(shadow_visArg, itemCount) \
			itemDef \
			{ \
				style			WINDOW_STYLE_SHADER \
				rect			0 0 (POPUP_WIDTH-(LAYOUT_BORDER_WIDTH*2)) (POPUP_HEIGHT(itemCount)-(LAYOUT_BORDER_WIDTH*2)) HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
				background		"white" \
				forecolor		LAYOUT_BACKCOLOR \
				visible			1 \
				decoration \
			}
#else
	#define CENTER_POPUP_SETUP_RAW(nameArg, itemCount, onEscArg, onOpenArg, extraArgs, shadow_visArg) \
			name			nameArg \
	   		fullscreen		0 \
			rect			(0-(POPUP_WIDTH/2)) (0-(POPUP_HEIGHT(itemCount)/2)) POPUP_WIDTH POPUP_HEIGHT(itemCount) HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
			border			1 \
			backcolor		0 0 0 0 \
			bordersize		LAYOUT_BORDER_WIDTH \
			bordercolor		LAYOUT_BORDER_COLOR \
			focusColor		COLOR_FOCUSED \
	   		style			WINDOW_STYLE_FILLED \
			popup \
			extraArgs \
			onOpen \
			{ \
				setLocalVarBool	ui_centerPopup 1; \
				onOpenArg; \
			} \
			onClose \
			{ \
				CENTER_POPUP_ON_CLOSE \
				setLocalVarBool	ui_centerPopup 0; \
			} \
			onESC \
			{ \
				setLocalVarBool	ui_centerPopup 0; \
				close self; \
				onEscArg; \
			} \
			itemDef \
			{ \
				style			WINDOW_STYLE_SHADER \
				rect			0 0 (POPUP_WIDTH-(LAYOUT_BORDER_WIDTH*2)) (POPUP_HEIGHT(itemCount)-(LAYOUT_BORDER_WIDTH*2)) HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
				background		"white" \
				forecolor		LAYOUT_BACKCOLOR \
				visible			1 \
				decoration \
			}
#endif

#ifdef PUBLIC_BETA
#define CENTER_POPUP_SETUP_BETA(nameArg, itemCount, onEscArg, onOpenArg, extraArgs, shadow_visArg) \
		name			nameArg \
   		fullscreen		0 \
		rect			(0-(POPUP_WIDTH/2)) (0-(POPUP_HEIGHT(itemCount)/2)) POPUP_WIDTH POPUP_HEIGHT(itemCount) HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
		border			0 \
		backcolor		0 0 0 0 \
		focusColor		COLOR_FOCUSED \
   		style			WINDOW_STYLE_FILLED \
		popup \
		extraArgs \
		onOpen \
		{ \
			setLocalVarBool	ui_centerPopup 1; \
			onOpenArg; \
		} \
		onClose \
		{ \
			setLocalVarBool	ui_centerPopup 0; \
		} \
		onESC \
		{ \
			setLocalVarBool	ui_centerPopup 0; \
			play "mouse_click"; \
			close self; \
			onEscArg; \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			0 0 (POPUP_WIDTH-(LAYOUT_BORDER_WIDTH*2)) (POPUP_HEIGHT(itemCount)-(LAYOUT_BORDER_WIDTH*2)) HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
			background		"white" \
			forecolor		LAYOUT_BACKCOLOR \
			visible			1 \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			0 (POPUP_TITLE_HEIGHT/4) POPUP_WIDTH (POPUP_HEIGHT(itemCount)-(POPUP_TITLE_HEIGHT/4)) HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
			background		"white" \
			forecolor		LAYOUT_BACKCOLOR \
			visible			1 \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			0 0 (POPUP_WIDTH-(POPUP_TITLE_HEIGHT/4)) POPUP_TITLE_HEIGHT HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
			forecolor		0.1 0.1 0.1 1 \
			exp				material("white"); \
			visible			1 \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			0 0 (POPUP_WIDTH-(POPUP_TITLE_HEIGHT/4)) POPUP_TITLE_HEIGHT HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
			forecolor		0.9 0.95 1 0.4 \
			exp				material("gradient_fadein"); \
			visible			1 \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			((POPUP_WIDTH-0)-(POPUP_TITLE_HEIGHT/4)) 0 (POPUP_TITLE_HEIGHT/4) (POPUP_TITLE_HEIGHT) HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
			forecolor		0.1 0.1 0.1 1 \
			exp				material("button_highlight_end"); \
			visible			1 \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			((POPUP_WIDTH-0)-(POPUP_TITLE_HEIGHT/4)) 0 (POPUP_TITLE_HEIGHT/4) (POPUP_TITLE_HEIGHT) HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER \
			forecolor		0.9 0.95 1 0.4 \
			exp				material("button_highlight_end"); \
			visible			1 \
			decoration \
		}
#endif
