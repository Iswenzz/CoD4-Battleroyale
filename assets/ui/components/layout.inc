#define ENABLE_SEPARATOR		1	// Enables separator bars
#define ENABLE_TITLE_BG			1	// Enables menu title background graphics

#ifndef BUTTON_SIZE_X
#define BUTTON_SIZE_X 			150
#endif

#ifndef BUTTON_DVAR_TEXTALIGN
#define BUTTON_DVAR_TEXTALIGN		ITEM_ALIGN_MIDDLE_LEFT
#endif

#ifndef LAYOUT_SIDEITEM_SIZE_X
#define LAYOUT_SIDEITEM_SIZE_X		64
#endif

#ifndef LAYOUT_SIDEITEM_SPACING
#define LAYOUT_SIDEITEM_SPACING		16
#endif

#ifndef LAYOUT_NAME
#define LAYOUT_NAME 			""
#endif

#ifndef LAYOUT_SIZE_X
#define LAYOUT_SIZE_X 			150
#endif

#ifndef LAYOUT_SIZE_Y
#define LAYOUT_SIZE_Y 			22
#endif

#ifndef LAYOUT_X_START
#define LAYOUT_X_START			58
#endif

#ifndef LAYOUT_X_SPACING
#define LAYOUT_X_SPACING		250
#endif

#ifndef LAYOUT_Y_START
#define LAYOUT_Y_START			82
#endif

#ifndef LAYOUT_Y_SPACING
#define LAYOUT_Y_SPACING		24
#endif

#ifndef LAYOUT_Y_COUNT
#define LAYOUT_Y_COUNT			20
#endif

#ifndef LAYOUT_TEXT_OFFSET_X
#define LAYOUT_TEXT_OFFSET_X	22
#endif

#ifndef SECTION_TEXT_OFFSET_X
#define SECTION_TEXT_OFFSET_X	0
#endif

#ifndef ACCEPT_ALIGN_X
#define ACCEPT_ALIGN_X			6
#endif

#ifndef ACCEPT_ALIGN_Y
#define ACCEPT_ALIGN_Y			2
#endif

#ifndef NEW_X_OFFSET
#define NEW_X_OFFSET			0
#endif

#ifndef NEW_Y_OFFSET
#define NEW_Y_OFFSET			0
#endif

#ifndef TITLE_Y_OFFSET
#define TITLE_Y_OFFSET			0
#endif

#ifndef TITLE_X_OFFSET
#define TITLE_X_OFFSET			0
#endif

#ifndef BUTTON_FOCUS_SOUND
#define BUTTON_FOCUS_SOUND		"mouse_over"
#endif

#ifndef LAYOUT_TEXTSIZE
#define LAYOUT_TEXTSIZE			0.3
#endif

#ifndef LAYOUT_TEXTFONT
#define LAYOUT_TEXTFONT			UI_FONT_NORMAL
#endif

#ifndef LAYOUT_HEADERCOLOR
#define LAYOUT_HEADERCOLOR		1 1 1 1
#endif

#ifndef LAYOUT_TEXTCOLOR
#define LAYOUT_TEXTCOLOR		1 1 1 1
#endif

#ifndef LAYOUT_TEXTCOLOR_CAPT
#define LAYOUT_TEXTCOLOR_CAPT	LAYOUT_TEXTCOLOR
#endif

#ifndef LAYOUT_TEXTSTYLE
#define LAYOUT_TEXTSTYLE			0
#endif

#ifndef LAYOUT_TEXTALIGN
#define	LAYOUT_TEXTALIGN			ITEM_ALIGN_MIDDLE_LEFT
#endif

#ifndef SECTION_X_OFFSET
#define SECTION_X_OFFSET			0
#endif

#ifndef LAYOUT_TEXTCOLOR_DISABLED
#define LAYOUT_TEXTCOLOR_DISABLED	0.5 0.5 0.5 0.5
#endif

#ifndef LAYOUT_SEPARATOR_WIDTH
#define LAYOUT_SEPARATOR_WIDTH		130
#endif

#ifndef LAYOUT_SEPARATOR_OFFSET_X
#define LAYOUT_SEPARATOR_OFFSET_X	0
#endif

#ifndef LAYOUT_SEPARATOR_OFFSET_Y
#define LAYOUT_SEPARATOR_OFFSET_Y	0
#endif

#ifndef BUTTON_DVAR_WIDTH_OFFSET
#define	BUTTON_DVAR_WIDTH_OFFSET 	120
#endif

#ifndef BUTTON_DVAR_OFFSET_X
#define	BUTTON_DVAR_OFFSET_X		(LAYOUT_SIZE_X + 20)
#endif

#ifndef LAYOUT_SEPARATOR_BACKGROUND
#define	LAYOUT_SEPARATOR_BACKGROUND	"gradient_fadein"
#endif

#ifndef HIGHLIGHT_SHADER_ART
#define HIGHLIGHT_SHADER_ART		"button_highlight_end"
#endif

#ifndef ALTERNATE_HINT_SHADER
#define ALTERNATE_HINT_SHADER		"alternate_hint"
#endif

#ifndef ALTERNATE_HINT_COLOR
#define ALTERNATE_HINT_COLOR		1 1 1 1 // 0.55 0.95 0.55 0.9 // 0 1 0 0.35 // 0.75 .75 0.8 1
#endif

#ifndef HIGHLIGHT_COLOR
#define HIGHLIGHT_COLOR				0 1 1 0.8
#endif

#ifndef HIGHLIGHT_BORDER_COLOR
#define HIGHLIGHT_BORDER_COLOR		0 1 1 0.4
#endif

#ifndef LAYOUT_HORIZONTAL_ALIGN
#define LAYOUT_HORIZONTAL_ALIGN 	HORIZONTAL_ALIGN_DEFAULT
#endif

#ifndef LAYOUT_VERTICAL_ALIGN
#define LAYOUT_VERTICAL_ALIGN 		VERTICAL_ALIGN_DEFAULT
#endif

#ifndef HIGHLIGHT_BORDER
#define HIGHLIGHT_BORDER			WINDOW_BORDER_RAISED
#endif

#ifndef HIGHLIGHT_SHADER
#define HIGHLIGHT_SHADER			"white"
#endif

#ifndef ACCEPT_LAYOUT_SIZE
#define ACCEPT_LAYOUT_SIZE			0.33
#endif

#ifndef ACCEPT_LAYOUT_OFFSET_X
#define ACCEPT_LAYOUT_OFFSET_X		(0-4)
#endif

#ifndef	ACCEPT_LAYOUT_FONT
#define ACCEPT_LAYOUT_FONT 			UI_FONT_NORMAL
#endif

#ifndef ACCEPT_LAYOUT_OFFSET_Y
#define ACCEPT_LAYOUT_OFFSET_Y		0
#endif

#ifndef ACCEPT_LAYOUT_OFFSET_Y
#define ACCEPT_LAYOUT_OFFSET_Y		0
#endif

#define ACCEPT_BACKGROUND_COLOR 	0 0 0 1
#define ACCEPT_LAYOUT_TEXTSTYLE		ITEM_TEXTSTYLE_NORMAL

#ifndef ACCEPT_LAYOUT_COLOR
#define ACCEPT_LAYOUT_COLOR			1 1 1 1
#endif

#ifndef BACKGROUND_COLOR
#define BACKGROUND_COLOR			0 0 0 0.3
#endif

#if !defined(LAYOUT_SEPATATOR_1) || !defined(LAYOUT_SEPARATOR_SPACING)
#define LAYOUT_SEPARATOR_TOTAL_SPACING(itemIndex)	0
#elif !defined(LAYOUT_SEPATATOR_2)
#define LAYOUT_SEPARATOR_TOTAL_SPACING(itemIndex)	((itemIndex <= LAYOUT_SEPATATOR_1) ? 0 : LAYOUT_SEPARATOR_SPACING)
#elif !defined(LAYOUT_SEPATATOR_3)
#define LAYOUT_SEPARATOR_TOTAL_SPACING(itemIndex)	((itemIndex <= LAYOUT_SEPATATOR_1) ? 0 : ((itemIndex <= LAYOUT_SEPATATOR_2) ? LAYOUT_SEPARATOR_SPACING : LAYOUT_SEPARATOR_SPACING * 2))
#else
#define LAYOUT_SEPARATOR_TOTAL_SPACING(itemIndex)	((itemIndex <= LAYOUT_SEPATATOR_1) ? 0 : ((itemIndex <= LAYOUT_SEPATATOR_2) ? LAYOUT_SEPARATOR_SPACING : ((itemIndex <= LAYOUT_SEPATATOR_3) ? LAYOUT_SEPARATOR_SPACING * 2 : LAYOUT_SEPARATOR_SPACING * 3)))
#endif

#define LAYOUT_ROW(itemIndex)		((itemIndex - 1) % LAYOUT_Y_COUNT)
#define LAYOUT_COL(itemIndex)		((itemIndex - 1 - ((itemIndex - 1) % LAYOUT_Y_COUNT)) / LAYOUT_Y_COUNT)

#define LAYOUT_X(itemIndex) 		(LAYOUT_X_START + LAYOUT_X_SPACING * LAYOUT_COL(itemIndex))
#define LAYOUT_Y(itemIndex) 		(LAYOUT_Y_START + LAYOUT_Y_SPACING * LAYOUT_ROW(itemIndex) + LAYOUT_SEPARATOR_TOTAL_SPACING(itemIndex))
#define LAYOUT_ORIGIN(itemIndex)	LAYOUT_X(itemIndex) LAYOUT_Y(itemIndex)
#define LAYOUT_RECT(itemIndex)		LAYOUT_ORIGIN(itemIndex) LAYOUT_SIZE_X LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN

#define FOOTNOTE_RECT(x, y)			x y 240 60 LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN

#define HIGHLIGHT(itemIndex, vis) \
	HIGHLIGHT_CUSTOM(itemIndex, HIGHLIGHT_COLOR, HIGHLIGHT_BORDER_COLOR, vis)

#define UI_EDGE(porigin, palign, poffset_x, poffset_y, pcolor) UI_EDGE_RAW(porigin, palign, 5, 20, poffset_x, poffset_y, pcolor)

#define UI_EDGE_REVERSE(porigin, palign, poffset_x, poffset_y, pcolor) UI_EDGE_RAW(porigin, palign, -5, 20, poffset_x, poffset_y, pcolor)

#define UI_EDGE_RAW(porigin, palign, pw, ph, poffset_x, poffset_y, pcolor) \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			porigin pw ph palign \
			origin			poffset_x poffset_y \
			background		HIGHLIGHT_SHADER_ART \
			forecolor		pcolor \
			visible			1; \
			decoration \
		} \

#define BACKGROUND(itemIndex, visArg) BACKGROUND_RAW(itemIndex, "gradient_fadein", BACKGROUND_COLOR, visArg)

#define BACKGROUND_RAW(itemIndex, bgimage, foreColorArg, visArg) \
		itemDef \
		{ \
			style			WINDOW_STYLE_FILLED \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			forecolor		1 1 1 0 \
			backColor       0 0 0 0.1 \
			visible			visArg \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_FILLED \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			forecolor		1 1 1 0 \
			backColor       0 0 0 0.1 \
			visible			visArg \
			decoration \
		} \

#define CREATESERVER_BACKGROUND_VIS(itemIndex, visArg) CREATESERVER_BACKGROUND_RAW_VIS(itemIndex, "gradient_fadein", BACKGROUND_COLOR, visArg)

#define CREATESERVER_BACKGROUND_RAW_VIS(itemIndex, bgimage, foreColorArg, visArg) \
		itemDef \
		{ \
			style			WINDOW_STYLE_FILLED \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			forecolor		1 1 1 0 \
			backColor       0 0 0 0.1 \
			visible			visArg; \
			decoration \
		} \

#define HIGHLIGHT_CUSTOM(itemIndex, foreColorArg, borderColorArg, visArg) \
        itemDef /* button */ \
        { \
            style            	WINDOW_STYLE_FILLED \
            textstyle        	ITEM_TEXTSTYLE_NORMAL \
            rect            	LAYOUT_ORIGIN(itemIndex) BUTTON_SIZE_X LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
            forecolor        	1 1 1 1 \
            backColor       	0 0 0 0.1 \
            background         	black \
            visible            	when(localVarInt(ui_highlight) == itemIndex && localVarString(ui_buttongroup) == LAYOUT_NAME); \
            decoration \
        } \
		itemDef /* top outline */ \
        { \
            style            	WINDOW_STYLE_SHADER \
            textstyle        	ITEM_TEXTSTYLE_NORMAL \
            rect            	LAYOUT_ORIGIN(itemIndex) BUTTON_SIZE_X (LAYOUT_SIZE_Y-LAYOUT_SIZE_Y+1) LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			origin 				0 0 \
            forecolor        	0 0 0 0 \
            backColor       	0 0 0 1 \
            visible          	1 \
            background        	black \
            decoration \
            onFocus \
            { \
                setLocalVarInt ui_highlight2 itemIndex; \
                setLocalVarString ui_buttongroup LAYOUT_NAME; \
                onFocusArg \
            } \
            leaveFocus \
            { \
                setLocalVarInt ui_highlight2 0; \
                leaveFocusArg \
            } \
        } \
		itemDef /* bottom outline*/ \
        { \
            style            	WINDOW_STYLE_SHADER \
            textstyle        	ITEM_TEXTSTYLE_NORMAL \
            rect            	LAYOUT_ORIGIN(itemIndex) BUTTON_SIZE_X (LAYOUT_SIZE_Y - LAYOUT_SIZE_Y + 1) LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			origin 				0 (LAYOUT_SIZE_Y - 1) \
            forecolor        	0 0 0 0 \
            backColor       	0 0 0 1 \
            visible          	1 \
            background        	black \
            decoration \
            onFocus \
            { \
                setLocalVarInt ui_highlight2 itemIndex; \
                setLocalVarString ui_buttongroup LAYOUT_NAME; \
                onFocusArg \
            } \
            leaveFocus \
            { \
                setLocalVarInt ui_highlight2 0; \
                leaveFocusArg \
            } \
        } \
		itemDef /* left outline */ \
        { \
            style            	WINDOW_STYLE_SHADER \
            textstyle        	ITEM_TEXTSTYLE_NORMAL \
            rect            	LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X - BUTTON_SIZE_X + 1) (LAYOUT_SIZE_Y - 2) LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			origin 				0 1 \
            forecolor        	0 0 0 0 \
            backColor       	0 0 0 1 \
            visible          	1 \
            background        	black \
            decoration \
            onFocus \
            { \
                setLocalVarInt ui_highlight2 itemIndex; \
                setLocalVarString ui_buttongroup LAYOUT_NAME; \
                onFocusArg \
            } \
            leaveFocus \
            { \
                setLocalVarInt ui_highlight2 0; \
                leaveFocusArg \
            } \
        } \
		itemDef /* right outline */ \
        { \
            style            	WINDOW_STYLE_SHADER \
            textstyle        	ITEM_TEXTSTYLE_NORMAL \
            rect            	LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X - BUTTON_SIZE_X + 1) (LAYOUT_SIZE_Y - 2) LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			origin 				(BUTTON_SIZE_X - 1) 1 \
            forecolor        	0 0 0 0 \
            backColor       	0 0 0 1 \
            visible          	1 \
            background        	black \
            decoration \
            onFocus \
            { \
                setLocalVarInt ui_highlight2 itemIndex; \
                setLocalVarString ui_buttongroup LAYOUT_NAME; \
                onFocusArg \
            } \
            leaveFocus \
            { \
                setLocalVarInt ui_highlight2 0; \
                leaveFocusArg \
            } \
        } \
        ACCEPT_HINT(itemIndex, visArg)

#define CREATESERVER_HIGHLIGHT_VIS(itemIndex, vis) \
	CREATESERVER_HIGHLIGHT_CUSTOM_VIS(itemIndex, HIGHLIGHT_COLOR, HIGHLIGHT_BORDER_COLOR, vis)

#define CREATESERVER_HIGHLIGHT_CUSTOM_VIS(itemIndex, foreColorArg, borderColorArg, visArg) \
        itemDef \
        { \
            style            	WINDOW_STYLE_FILLED \
            textstyle        	ITEM_TEXTSTYLE_NORMAL \
            rect            	LAYOUT_ORIGIN(itemIndex) BUTTON_SIZE_X LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
            forecolor        	1 1 1 1 \
            backColor       	0 0 0 0.1 \
            background         	black \
            visible            	when(localVarInt(ui_highlight) == itemIndex && localVarString(ui_buttongroup) == LAYOUT_NAME); \
            decoration \
        } \
        ACCEPT_HINT(itemIndex, visArg)

// Used for custom highlights for itemDefs that are special and can not use itemIndex or complie with the strict alignment of this macro set
#define HIGHLIGHT_CUSTOM_2(px, py, pw, ph, visArg) \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			(px+(ph/4)) py (-(pw-(ph/4))) ph LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			background		HIGHLIGHT_SHADER \
			forecolor		BACKGROUND_COLOR \
			visible			1 \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			px py (-(ph/4)) ph LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			background		HIGHLIGHT_SHADER_ART \
			forecolor		BACKGROUND_COLOR \
			visible			1 \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			(px+(ph/4)) py (-(pw-(ph/4))) ph LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			background		HIGHLIGHT_SHADER \
			forecolor		HIGHLIGHT_COLOR \
			visible			visArg \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			px py (-(ph/4)) ph LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			background		HIGHLIGHT_SHADER_ART \
			forecolor		HIGHLIGHT_COLOR \
			visible			visArg \
			decoration \
		} \

#if defined(CONSOLE) && !defined(SPLITSCREEN)
#define ACCEPT_HINT(itemIndex, vis) \
		itemDef \
		{ \
			rect			LAYOUT_RECT(itemIndex) \
			origin			ACCEPT_LAYOUT_OFFSET_X ACCEPT_LAYOUT_OFFSET_Y \
			text			"@PLATFORM_UI_SELECTBUTTON" \
			textfont		ACCEPT_LAYOUT_FONT \
			textscale		ACCEPT_LAYOUT_SIZE \
			textstyle		ACCEPT_LAYOUT_TEXTSTYLE \
			textAlign		LAYOUT_TEXTALIGN \
			textAlignX		0\
			textAlignY		-1\
			forecolor		1 1 1 1 \
			visible			when(localVarInt(ui_highlight) == itemIndex && localVarString(ui_buttongroup) == LAYOUT_NAME && vis); \
			decoration \
		}
#else // #if defined(CONSOLE) && !defined(SPLITSCREEN)
#define ACCEPT_HINT(itemIndex, vis)
#endif // #else // #if defined(CONSOLE) && !defined(SPLITSCREEN)

#define MENU_TITLE_SS(titleArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			origin			ORIGIN_TITLE \
			forecolor		COLOR_TITLE \
			exp				text(titleArg) \
			textalignx		-14 \
			textfont		UI_FONT_NORMAL \
			textscale		TEXTSIZE_DEFAULT \
			textstyle		LAYOUT_TEXTSTYLE \
			textalign		ITEM_ALIGN_TOP_LEFT \
			visible			1 \
			decoration \
		}

#define MENU_TITLE(titleArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			origin			ORIGIN_TITLE \
			forecolor		COLOR_TITLE \
			exp				text(titleArg) \
			textfont		UI_FONT_NORMAL \
			textscale		TEXTSIZE_TITLE \
			textstyle		LAYOUT_TEXTSTYLE \
			textalign		ITEM_ALIGN_TOP_LEFT \
			textaligny		TITLE_Y_OFFSET \
			textalignx		TITLE_X_OFFSET \
			visible			1 \
			decoration \
		}

#define MENU_TITLE_VIS(titleArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			origin			ORIGIN_TITLE \
			forecolor		COLOR_TITLE \
			text			titleArg \
			textfont		UI_FONT_NORMAL \
			textscale		TEXTSIZE_TITLE \
			textstyle		LAYOUT_TEXTSTYLE \
			textalign		ITEM_ALIGN_TOP_LEFT \
			visible			when(visArg) \
			decoration \
		}

#define SECTION_TITLE(itemIndex, titleArg) \
	SECTION_TITLE_VIS(itemIndex, titleArg, 1)

#define SECTION_TITLE_VIS(itemIndex, titleArg, visArg) \
	itemDef \
	{ \
		style			WINDOW_STYLE_SHADER \
		rect			(SECTION_X_OFFSET+0) 7 240 0.5 LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		origin			LAYOUT_ORIGIN(itemIndex) \
		background		"line_horizontal" \
		forecolor		1 1 1 0.85 \
		visible			visArg \
		decoration \
	}	 \
	itemDef \
	{ \
		style			WINDOW_STYLE_SHADER \
		rect			(SECTION_X_OFFSET+20) 8 200 10 LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		origin			LAYOUT_ORIGIN(itemIndex) \
		background		"line_horizontal" \
		forecolor		0.4 0.6 1 0.8 \
		visible			visArg \
		decoration \
	} \
	itemDef \
	{ \
		style			WINDOW_STYLE_SHADER \
		rect			(SECTION_X_OFFSET+0) 19 240 0.5 LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		origin			LAYOUT_ORIGIN(itemIndex) \
		background		"line_horizontal" \
		forecolor		1 1 1 0.85 \
		visible			visArg \
		decoration \
	} \
	itemDef \
	{ \
		type			ITEM_TYPE_TEXT \
		rect			(SECTION_X_OFFSET+0) -1 240 24 LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		origin			LAYOUT_ORIGIN(itemIndex) \
		forecolor		1 1 1 0.8 \
		exp				text(titleArg);\
		textstyle 		ITEM_TEXTSTYLE_NORMAL \
		textfont		UI_FONT_NORMAL \
		textscale		TEXTSIZE_DEFAULT \
		textstyle		LAYOUT_TEXTSTYLE \
		textAlign		ITEM_ALIGN_MIDDLE_CENTER \
		textAlignX		SECTION_TEXT_OFFSET_X \
		visible 		visArg \
		decoration \
	}

#define SEPARATOR(afterItemIndex) \
		SEPARATOR_VIS(afterItemIndex, when(ENABLE_SEPARATOR))

#define SEPARATOR_VIS(afterItemIndex, visArg) \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			(LAYOUT_SEPARATOR_OFFSET_X) (LAYOUT_Y_SPACING + LAYOUT_SEPARATOR_SPACING / 2 + LAYOUT_SEPARATOR_OFFSET_Y - 3) LAYOUT_SEPARATOR_WIDTH 8 LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			origin			LAYOUT_ORIGIN(afterItemIndex) \
			background		LAYOUT_SEPARATOR_BACKGROUND \
			forecolor		BACKGROUND_COLOR \
			visible			visArg \
			decoration \
		}

#define BUTTON(itemIndex, textArg, actionArg) \
		BUTTON_VIS(itemIndex, textArg, actionArg, 1)

#define BUTTON_NOHI(itemIndex, textArg, actionArg) \
		BUTTON_VIS_NOHI(itemIndex, textArg, actionArg, 1)

#define BUTTON_VIS(itemIndex, textArg, actionArg, visArg) \
		BACKGROUND(itemIndex, visArg) \
		HIGHLIGHT(itemIndex, visArg) \
		BUTTON_VIS_NOHI(itemIndex, textArg, actionArg, visArg)

#define BUTTON_VIS_ADV(itemIndex, textArg, actionArg, visArg, vis) \
		BACKGROUND(itemIndex, visArg) \
		HIGHLIGHT(itemIndex, vis) \
		BUTTON_VIS_NOHI(itemIndex, textArg, actionArg, visArg)

#define BUTTON_VIS_NOHI(itemIndex, textArg, actionArg, visArg) \
		BUTTON_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, ;, ;, visArg)

#define BUTTON_FOCUS(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg) \
		BUTTON_FOCUS_VIS(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, 1)

#define BUTTON_FOCUS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg) \
		BUTTON_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, 1)

#define BUTTON_FOCUS_VIS(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg) \
		BACKGROUND(itemIndex, visArg) \
		HIGHLIGHT(itemIndex, 1) \
		BUTTON_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg)

#define BUTTON_FOCUS_VIS_ADV(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, vis) \
		BACKGROUND(itemIndex, visArg) \
		HIGHLIGHT(itemIndex, vis) \
		BUTTON_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg)

#define BUTTON_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg) \
		BUTTON_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, ;)

#define BUTTON_EX(itemIndex, textArg, actionArg, extraArgs) \
		BACKGROUND(itemIndex, 1) \
		HIGHLIGHT(itemIndex, 1) \
		BUTTON_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, ;, ;, 1, extraArgs)

#define BUTTON_EX_ADV(itemIndex, textArg, actionArg, extraArgs, visArg) \
		BACKGROUND(itemIndex, 1) \
		HIGHLIGHT(itemIndex, 1) \
		BUTTON_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, ;, ;, visArg, extraArgs)

#define BUTTON_FOCUS_VIS_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs) \
		BACKGROUND(itemIndex, visArg) \
		HIGHLIGHT(itemIndex, 1) \
		BUTTON_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs)

#define BUTTON_FOCUS_VIS_EX_ADV(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs, vis) \
		BACKGROUND(itemIndex, visArg) \
		HIGHLIGHT(itemIndex, vis) \
		BUTTON_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs)

#define BUTTON_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			LAYOUT_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		LAYOUT_TEXTFONT \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		LAYOUT_TEXTSTYLE \
			textAlign		LAYOUT_TEXTALIGN \
			textAlignX		LAYOUT_TEXT_OFFSET_X \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			extraArgs \
			SCRIPTS_ALL(itemIndex, actionArg, onFocusArg, leaveFocusArg) \
		} \

#define DBUTTON_VIS_NOHI(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			rect			LAYOUT_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		LAYOUT_TEXTFONT \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		LAYOUT_TEXTSTYLE \
			textAlign		LAYOUT_TEXTALIGN \
			textAlignX		LAYOUT_TEXT_OFFSET_X \
			forecolor		LAYOUT_TEXTCOLOR_DISABLED \
			visible			visArg \
			decoration \
		} \

#define DBUTTON_VIS(itemIndex, textArg, visArg) \
		BACKGROUND(itemIndex, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			rect			LAYOUT_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		UI_FONT_NORMAL \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		LAYOUT_TEXTSTYLE \
			textAlign		LAYOUT_TEXTALIGN \
			textAlignX		LAYOUT_TEXT_OFFSET_X \
			forecolor		LAYOUT_TEXTCOLOR_DISABLED \
			visible			visArg \
			decoration \
		} \

#define BUTTON_DVARENUMLIST(itemIndex, textArg, dvarArg, dvarListArg, actionArg) \
		BUTTON_DVARLIST_VIS(itemIndex, textArg, dvarArg, ITEM_TYPE_DVARENUM, dvarEnumList dvarListArg, actionArg, 1)

#define BUTTON_DVARENUMLIST_VIS(itemIndex, textArg, dvarArg, dvarListArg, actionArg, visArg) \
		BUTTON_DVARLIST_VIS(itemIndex, textArg, dvarArg, ITEM_TYPE_DVARENUM, dvarEnumList dvarListArg, actionArg, visArg)

#define BUTTON_DVARSTRINGLIST(itemIndex, textArg, dvarArg, strListArg, actionArg) \
		BUTTON_DVARLIST_VIS(itemIndex, textArg, dvarArg, ITEM_TYPE_MULTI, dvarStrList strListArg, actionArg, 1)

#define BUTTON_DVARSTRINGLIST_VIS(itemIndex, textArg, dvarArg, strListArg, actionArg, visArg) \
		BUTTON_DVARLIST_VIS(itemIndex, textArg, dvarArg, ITEM_TYPE_MULTI, dvarStrList strListArg, actionArg, visArg)

#define BUTTON_DVARFLOATLIST(itemIndex, textArg, dvarArg, strListArg, actionArg) \
		BUTTON_DVARLIST_VIS(itemIndex, textArg, dvarArg, ITEM_TYPE_MULTI, dvarFloatList strListArg, actionArg, 1)

#define BUTTON_DVARFLOATLIST_VIS(itemIndex, textArg, dvarArg, strListArg, actionArg, visArg) \
		BUTTON_DVARLIST_VIS(itemIndex, textArg, dvarArg, ITEM_TYPE_MULTI, dvarFloatList strListArg, actionArg, visArg)

#define BUTTON_DVARFLOATLIST_FOCUS_VIS(itemIndex, textArg, dvarArg, strListArg, actionArg, onFocusArg, leaveFocusArg, visArg) \
		BUTTON_DVARLIST_FOCUS_VIS(itemIndex, textArg, dvarArg, ITEM_TYPE_MULTI, dvarFloatList strListArg, actionArg, onFocusArg, leaveFocusArg, visArg)

#define BUTTON_DVARLIST_VIS(itemIndex, textArg, dvarArg, listTypeArg, listArg, actionArg, visArg) \
		BUTTON_DVARLIST_FOCUS_VIS(itemIndex, textArg, dvarArg, listTypeArg, listArg, actionArg, ;, ;, visArg)

#define BUTTON_DVARLIST_FOCUS_VIS(itemIndex, textArg, dvarArg, listTypeArg, listArg, actionArg, onFocusArg, leaveFocusArg, visArg) \
		HIGHLIGHT(itemIndex, 1) \
		BACKGROUND(itemIndex, visArg) \
		BUTTON_CAPTION_VIS(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			listTypeArg \
			dvar			dvarArg \
			listArg \
			rect			LAYOUT_ORIGIN(itemIndex) (LAYOUT_SIZE_X+BUTTON_DVAR_WIDTH_OFFSET) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		BUTTON_DVAR_TEXTALIGN \
			textalignx		BUTTON_DVAR_OFFSET_X \
			textscale		LAYOUT_TEXTSIZE \
			textstyle 		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg ; \
			SCRIPTS_ALL(itemIndex, actionArg, onFocusArg, leaveFocusArg) \
		}

#define CREATESERVER_DVARFLOATLIST(itemIndex, textArg, dvarArg, strListArg, actionArg) \
		CREATESERVER_DVARLIST_VIS(itemIndex, textArg, dvarArg, ITEM_TYPE_MULTI, dvarFloatList strListArg, actionArg, 1)

 #define CREATESERVER_DVARLIST_VIS(itemIndex, textArg, dvarArg, listTypeArg, listArg, actionArg, visArg) \
		 CREATESERVER_DVARLIST_FOCUS_VIS(itemIndex, textArg, dvarArg, listTypeArg, listArg, actionArg, ;, ;, visArg)

#define CREATESERVER_DVARLIST_FOCUS_VIS(itemIndex, textArg, dvarArg, listTypeArg, listArg, actionArg, onFocusArg, leaveFocusArg, visArg) \
		CREATESERVER_BACKGROUND_VIS(itemIndex, visArg) \
		CREATESERVER_HIGHLIGHT_VIS(itemIndex, visArg) \
		BUTTON_CAPTION_VIS(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			listTypeArg \
			dvar			dvarArg \
			listArg \
			rect			LAYOUT_ORIGIN(itemIndex) (LAYOUT_SIZE_X+BUTTON_DVAR_WIDTH_OFFSET) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		BUTTON_DVAR_TEXTALIGN \
			textalignx		BUTTON_DVAR_OFFSET_X \
			textscale		LAYOUT_TEXTSIZE \
			textstyle 		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg ; \
			SCRIPTS_ALL(itemIndex, actionArg, onFocusArg, leaveFocusArg) \
		}

#define CREATESERVER_DVARYESNO(itemIndex, textArg, dvarArg, actionArg) \
		CREATESERVER_DVARYESNO_VIS(itemIndex, textArg, dvarArg, actionArg, 1)

#define CREATESERVER_DVARYESNO_VIS(itemIndex, textArg, dvarArg, actionArg, visArg) \
		CREATESERVER_BACKGROUND_VIS(itemIndex, visArg) \
		CREATESERVER_HIGHLIGHT_VIS(itemIndex, visArg) \
		BUTTON_CAPTION_VIS(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_YESNO \
			dvar			dvarArg \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			textalignx		(LAYOUT_SIZE_X+20)/*(-(LAYOUT_TEXT_OFFSET_X))*/ \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			SCRIPTS_ACTION(itemIndex, actionArg) \
		}

#define CREATESERVER_DVAREDIT_NUMERIC(itemIndex, textArg, dvarArg, max_chars, actionArg) \
		CREATESERVER_DVAREDIT_NUMERIC_VIS(itemIndex, textArg, dvarArg, max_chars, actionArg, 1)

#define CREATESERVER_DVAREDIT_NUMERIC_VIS(itemIndex, textArg, dvarArg, max_chars, actionArg, visArg) \
		CREATESERVER_BACKGROUND_VIS(itemIndex, visArg) \
		CREATESERVER_HIGHLIGHT_VIS(itemIndex, visArg) \
		BUTTON_CAPTION_VIS(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_NUMERICFIELD \
			text			" " \
			dvar			dvarArg \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			textalignx		(LAYOUT_SIZE_X+8) /*(-(LAYOUT_TEXT_OFFSET_X))*/ \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			maxChars		max_chars \
			SCRIPTS_ACTION(itemIndex, actionArg) \
		}

#define CREATESERVER_DVAREDIT_VIS(itemIndex, textArg, dvarArg, max_chars, max_paintchars, actionArg, visArg) \
		CREATESERVER_BACKGROUND_VIS(itemIndex, visArg) \
		CREATESERVER_HIGHLIGHT_VIS(itemIndex, visArg) \
		BUTTON_CAPTION_VIS(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_EDITFIELD \
			text			" " \
			dvar			dvarArg \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			textalignx		(LAYOUT_SIZE_X+8) /*(-(LAYOUT_TEXT_OFFSET_X))*/ \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			maxChars		max_chars \
			maxpaintchars	max_paintchars \
			SCRIPTS_ACTION(itemIndex, actionArg) \
		}

#define CREATESERVER_BUTTON_VIS(itemIndex, textArg, dvarArg, strListArg, actionArg, visArg) \
		CREATESERVER_BUTTON_VIS_1(itemIndex, textArg, dvarArg, ITEM_TYPE_MULTI, dvarFloatList strListArg, actionArg, visArg)

 #define CREATESERVER_BUTTON_VIS_1(itemIndex, textArg, dvarArg, listTypeArg, listArg, actionArg, visArg) \
		 CREATESERVER_BUTTON_VIS_2(itemIndex, textArg, dvarArg, listTypeArg, listArg, actionArg, ;, ;, visArg)

#define CREATESERVER_BUTTON_VIS_2(itemIndex, textArg, dvarArg, listTypeArg, listArg, actionArg, onFocusArg, leaveFocusArg, visArg) \
		CREATESERVER_BACKGROUND_VIS(itemIndex, visArg) \
		CREATESERVER_HIGHLIGHT_VIS(itemIndex, visArg) \
		BUTTON_CAPTION_VIS(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			listTypeArg \
			dvar			dvarArg \
			listArg \
			rect			LAYOUT_ORIGIN(itemIndex) (LAYOUT_SIZE_X+BUTTON_DVAR_WIDTH_OFFSET) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		BUTTON_DVAR_TEXTALIGN \
			textalignx		BUTTON_DVAR_OFFSET_X \
			textscale		LAYOUT_TEXTSIZE \
			textstyle 		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg ; \
			SCRIPTS_ALL(itemIndex, actionArg, onFocusArg, leaveFocusArg) \
		}

#define	STATUS_COLOR_VIS(itemIndex, textArg, colorArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			rect			LAYOUT_RECT(itemIndex) \
			exp				text(textArg); \
			textalign		ITEM_ALIGN_MIDDLE_RIGHT \
			textalignx		(0 - LAYOUT_TEXT_OFFSET_X) \
			textscale		LAYOUT_TEXTSIZE \
			style			WINDOW_STYLE_FILLED \
			forecolor		colorArg \
			visible			visArg ; \
			decoration \
		}

#define	NEWICON_VIS(itemIndex, imageArg, visArg) \
		itemDef \
		{ \
			style			WINDOW_STYLE_SHADER \
			rect			(LAYOUT_X(itemIndex) + LAYOUT_SIZE_X + NEW_X_OFFSET) (LAYOUT_Y(itemIndex)+2+NEW_Y_OFFSET) (LAYOUT_SIZE_Y*2) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			exp				material(imageArg) \
			visible			visArg ; \
			decoration \
		}

#define	LEFTITEM_VIS(itemIndex, textArg, colorArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			rect			(LAYOUT_X(itemIndex) - LAYOUT_SIDEITEM_SIZE_X - LAYOUT_SIDEITEM_SPACING) LAYOUT_Y(itemIndex) LAYOUT_SIDEITEM_SIZE_X LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			exp				text(textArg); \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			textfont		LAYOUT_TEXTFONT \
			textscale		LAYOUT_TEXTSIZE \
			textstyle 		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		colorArg \
			visible			visArg ; \
			decoration \
		}

#define	RIGHTITEM_VIS(itemIndex, textArg, colorArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			rect			(LAYOUT_X(itemIndex) + LAYOUT_SIDEITEM_SIZE_X + LAYOUT_SIDEITEM_SPACING) LAYOUT_Y(itemIndex) LAYOUT_SIDEITEM_SIZE_X LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			exp				text(textArg); \
			textalign		ITEM_ALIGN_MIDDLE_RIGHT \
			textscale		LAYOUT_TEXTSIZE \
			textstyle 		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		colorArg \
			visible			visArg ; \
			decoration \
		}

#define BUTTON_DVAREDIT_NUMERIC(itemIndex, textArg, dvarArg, max_chars, actionArg) \
		BUTTON_DVAREDIT_NUMERIC_VIS(itemIndex, textArg, dvarArg, max_chars, actionArg, 1)

#define BUTTON_DVAREDIT_NUMERIC_VIS(itemIndex, textArg, dvarArg, max_chars, actionArg, visArg) \
		BACKGROUND(itemIndex, 1) \
		HIGHLIGHT(itemIndex, 1) \
		BUTTON_CAPTION(itemIndex, textArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_NUMERICFIELD \
			text			" " \
			dvar			dvarArg \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			textalignx		(LAYOUT_SIZE_X+8) /*(-(LAYOUT_TEXT_OFFSET_X))*/ \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			maxChars		max_chars \
			SCRIPTS_ACTION(itemIndex, actionArg) \
		}

#define BUTTON_DVAREDIT(itemIndex, textArg, dvarArg, max_chars, max_paintchars, actionArg) \
		BUTTON_DVAREDIT_VIS(itemIndex, textArg, dvarArg, max_chars, max_paintchars, actionArg, 1)

#define BUTTON_DVAREDIT_VIS(itemIndex, textArg, dvarArg, max_chars, max_paintchars, actionArg, visArg) \
	BUTTON_DVAREDIT_VIS_EX(itemIndex, textArg, dvarArg, max_chars, max_paintchars, actionArg, visArg, ;)

#define BUTTON_DVAREDIT_VIS_EX(itemIndex, textArg, dvarArg, max_chars, max_paintchars, actionArg, visArg, extraArg) \
		BACKGROUND(itemIndex, 1) \
		HIGHLIGHT(itemIndex, 1) \
		BUTTON_CAPTION(itemIndex, textArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_EDITFIELD \
			text			" " \
			dvar			dvarArg \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			textalignx		(LAYOUT_SIZE_X+8) /*(-(LAYOUT_TEXT_OFFSET_X))*/ \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			maxChars		max_chars \
			maxpaintchars	max_paintchars \
			SCRIPTS_ACTION(itemIndex, actionArg) \
			extraArg \
		}

#define BUTTON_DVARSLIDER(itemIndex, textArg, dvarArg, defaultArg, minArg, maxArg, actionArg) \
		BUTTON_DVARSLIDER_VIS(itemIndex, textArg, dvarArg, defaultArg, minArg, maxArg, actionArg, 1)

#define BUTTON_DVARSLIDER_VIS(itemIndex, textArg, dvarArg, defaultArg, minArg, maxArg, actionArg, visArg) \
		BUTTON_DVARSLIDER_VIS_EX(itemIndex, textArg, dvarArg, defaultArg, minArg, maxArg, actionArg, ;, 1)

#define BUTTON_DVARSLIDER_VIS_EX(itemIndex, textArg, dvarArg, defaultArg, minArg, maxArg, actionArg, extraArg, visArg) \
		BACKGROUND(itemIndex, 1) \
		HIGHLIGHT(itemIndex, 1) \
		BUTTON_CAPTION(itemIndex, textArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_SLIDER \
			dvarfloat		dvarArg defaultArg minArg maxArg \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			textalignx		(LAYOUT_SIZE_X+20) /*(-(LAYOUT_TEXT_OFFSET_X))*/ \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			extraArg \
			SCRIPTS_ACTION(itemIndex, actionArg) \
		}

#define BUTTON_DVARYESNO(itemIndex, textArg, dvarArg, actionArg) \
		BUTTON_DVARYESNO_VIS(itemIndex, textArg, dvarArg, actionArg, 1)

#define BUTTON_DVARYESNO_VIS(itemIndex, textArg, dvarArg, actionArg, visArg) \
		BACKGROUND(itemIndex, visArg) \
		HIGHLIGHT(itemIndex, 1) \
		BUTTON_CAPTION_VIS(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_YESNO \
			dvar			dvarArg \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			textalignx		(LAYOUT_SIZE_X+20)/*(-(LAYOUT_TEXT_OFFSET_X))*/ \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			SCRIPTS_ACTION(itemIndex, actionArg) \
		}

#define BUTTON_BIND(itemIndex, textArg, cmdArg, actionArg) \
		BUTTON_BIND_VIS(itemIndex, textArg, cmdArg, actionArg, 1)

#define BUTTON_BIND_VIS(itemIndex, textArg, cmdArg, actionArg, visArg) \
		BACKGROUND(itemIndex, visArg) \
		HIGHLIGHT(itemIndex, visArg) \
		BUTTON_CAPTION_VIS(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BIND \
			dvar			cmdArg \
			rect			LAYOUT_ORIGIN(itemIndex) (BUTTON_SIZE_X) LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			textalignx		(LAYOUT_SIZE_X+20)/*(-(LAYOUT_TEXT_OFFSET_X))*/ \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			forecolor		LAYOUT_TEXTCOLOR \
			visible			visArg \
			SCRIPTS_ALL(itemIndex, actionArg, show keyBindStatus, hide keyBindStatus) \
		}

#define BUTTON_CAPTION(itemIndex, textArg) \
		BUTTON_CAPTION_VIS(itemIndex, textArg, 1)

#define BUTTON_CAPTION_COLOR(itemIndex, textArg, colorArg) \
		BUTTON_CAPTION_COLOR_VIS(itemIndex, textArg, colorArg, 1)

#define BUTTON_CAPTION_VIS(itemIndex, textArg, visArg) \
		BUTTON_CAPTION_COLOR_VIS(itemIndex, textArg, LAYOUT_TEXTCOLOR_CAPT, visArg)

#define BUTTON_CAPTION_COLOR_VIS(itemIndex, textArg, colorArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			LAYOUT_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		UI_FONT_NORMAL \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		LAYOUT_TEXTSTYLE \
			textAlign		LAYOUT_TEXTALIGN \
			textAlignX		LAYOUT_TEXT_OFFSET_X \
			forecolor		colorArg \
			visible			visArg \
			decoration \
		}

#define BUTTON_SUBTEXT_COLOR_VIS(itemIndex, textArg, colorArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			LAYOUT_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		UI_FONT_NORMAL \
			textscale		LAYOUT_TEXTSIZE \
			textstyle		LAYOUT_TEXTSTYLE \
			textAlign		ITEM_ALIGN_MIDDLE_LEFT \
			forecolor		colorArg \
			visible			visArg \
			decoration \
		}

#define SCRIPTS_ACTION(itemIndex, actionArg) \
	SCRIPTS_ALL(itemIndex, actionArg, ;, ;)

#define SCRIPTS_ALL(itemIndex, actionArg, onFocusArg, leaveFocusArg) \
			onFocus \
			{ \
				play BUTTON_FOCUS_SOUND; \
				setLocalVarInt ui_highlight itemIndex; \
				setLocalVarString ui_buttongroup LAYOUT_NAME; \
				onFocusArg \
			} \
			leaveFocus \
			{ \
				setLocalVarInt ui_highlight 0; \
				leaveFocusArg \
			} \
			action \
			{ \
				play "mouse_click"; \
				actionArg; \
			}

#define BUTTON_APPLY(textArg, actionArg) \
		BUTTON_APPLY_VIS(textArg, actionArg, 1)

#define BUTTON_APPLY_VIS(textArg, actionArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			430 450 100 16 LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			text			textArg \
			textfont		UI_FONT_NORMAL \
			textscale		TEXTSIZE_DEFAULT \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			textAlign		ITEM_ALIGN_MIDDLE_CENTER \
			forecolor		COLOR_FOCUSED \
			visible			visArg ; \
			action \
			{ \
				play "mouse_click"; \
				actionArg; \
			} \
		}

#define BUTTON_BACK(textArg, actionArg) \
		BUTTON_BACK_VIS(textArg, actionArg, 1)

#define BUTTON_BACK_VIS(textArg, actionArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			270 450 100 16 LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			text			textArg \
			textfont		UI_FONT_NORMAL \
			textscale		TEXTSIZE_DEFAULT \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			textAlign		ITEM_ALIGN_MIDDLE_CENTER \
			forecolor		COLOR_FOCUSED \
			visible			visArg ; \
			action \
			{ \
				play "mouse_click"; \
				actionArg; \
			} \
		}

#define FOOTNOTE(textArg, x, y) \
		FOOTNOTE_VIS(textArg, x, y, 1)

#define FOOTNOTE_VIS(textArg, x, y, visArg) \
		itemDef \
		{ \
			text 			textArg \
			rect 			FOOTNOTE_RECT(x, y) \
			autowrapped \
			textfont		UI_FONT_NORMAL \
			textscale 		TEXTSIZE_SMALL \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			textalign 		ITEM_ALIGN_TOP_LEFT \
			visible 		visArg \
			decoration \
		}

#define BUTTON_KEYBINDHELP \
		itemDef \
		{ \
			name			keyBindStatus \
			rect			-190 -8 350 20 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_BOTTOM \
			ownerdraw		UI_KEYBINDSTATUS \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			style			WINDOW_STYLE_FILLED \
			backcolor		0 0 0 0 \
			forecolor		.9 .9 .9 1 \
			border			0 \
			bordercolor		.5 .5 .5 .5 \
			textscale		TEXTSIZE_SMALL \
			textalign		ITEM_ALIGN_MIDDLE_LEFT \
			visible			0 \
			decoration \
		}
