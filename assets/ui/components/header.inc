#ifndef HEADER_OWNER_OFFSET_X
#define HEADER_OWNER_OFFSET_X 	0
#endif

#ifndef HEADER_OWNER_OFFSET_Y
#define HEADER_OWNER_OFFSET_Y 	-25
#endif

#ifndef HEADER_OWNER_SIZE_X
#define HEADER_OWNER_SIZE_X 	90
#endif

#ifndef HEADER_OWNER_SIZE_Y
#define HEADER_OWNER_SIZE_Y 	25
#endif

#ifndef HEADER_SIZE_X
#define HEADER_SIZE_X			90
#endif

#ifndef HEADER_SIZE_Y
#define HEADER_SIZE_Y			25
#endif

#ifndef HEADER_SIDEITEM_SIZE_X
#define HEADER_SIDEITEM_SIZE_X	64
#endif

#ifndef HEADER_SIDEITEM_SPACING
#define HEADER_SIDEITEM_SPACING	16
#endif

#ifndef HEADER_GROUP
#define HEADER_GROUP 			""
#endif

#ifndef HEADER_X_START
#define HEADER_X_START			0
#endif

#ifndef HEADER_X_SPACING
#define HEADER_X_SPACING		91
#endif

#ifndef HEADER_X_COUNT
#define HEADER_X_COUNT			10
#endif

#ifndef HEADER_Y_START
#define HEADER_Y_START			0
#endif

#ifndef HEADER_Y_SPACING
#define HEADER_Y_SPACING		5
#endif

#ifndef HEADER_Y_COUNT
#define HEADER_Y_COUNT			20
#endif

#ifndef HEADER_TEXT_OFFSET_X
#define HEADER_TEXT_OFFSET_X	0
#endif

#ifndef HEADER_FOCUS_SOUND
#define HEADER_FOCUS_SOUND		"mouse_over"
#endif

#ifndef HEADER_TEXTSIZE
#define HEADER_TEXTSIZE			0.3
#endif

#ifndef HEADER_TEXTFONT
#define HEADER_TEXTFONT			UI_FONT_NORMAL
#endif

#ifdef HEADERCOLOR
#define HEADERCOLOR				1 1 1 1
#endif

#ifndef HEADER_TEXTCOLOR
#define HEADER_TEXTCOLOR		1 1 1 1
#endif

#ifndef HEADER_TEXTCOLOR_CAPT
#define HEADER_TEXTCOLOR_CAPT	HEADER_TEXTCOLOR
#endif

#ifndef HEADER_TEXTSTYLE
#define HEADER_TEXTSTYLE		0
#endif

#ifndef HEADER_TEXTALIGN
#define	HEADER_TEXTALIGN		ITEM_ALIGN_MIDDLE_CENTER
#endif

#ifndef HEADER_TEXTCOLOR_DISABLED
#define HEADER_TEXTCOLOR_DISABLED		0.5 0.5 0.5 0.5
#endif

#ifndef HEADER_SEPERATOR_WIDTH
#define HEADER_SEPERATOR_WIDTH			130
#endif

#ifndef HEADER_SEPERATOR_OFFSET_X
#define HEADER_SEPERATOR_OFFSET_X		0
#endif

#ifndef HEADER_SEPERATOR_OFFSET_Y
#define HEADER_SEPERATOR_OFFSET_Y		0
#endif

#ifndef HEADER_SEPERATOR_BACKGROUND
#define	HEADER_SEPERATOR_BACKGROUND		"gradient_fadein"
#endif

#ifndef HIGHLIGHT_SHADER_ART
#define HIGHLIGHT_SHADER_ART			"header_highlight_end"
#endif

#ifndef HEADER_ALTERNATE_HINT_SHADER
#define HEADER_ALTERNATE_HINT_SHADER	"alternate_hint"
#endif

#ifndef HEADER_ALTERNATE_HINT_COLOR
#define HEADER_ALTERNATE_HINT_COLOR		0.55 0.95 0.55 1 // 0 1 0 0.35 // 0.75 .75 0.8 1
#endif

#ifndef HEADER_HIGHLIGHT_COLOR
#define HEADER_HIGHLIGHT_COLOR			1 1 1 0.8 // 0.2 0.25 0.35 0.25
#endif

#ifndef COLOR_FOCUSED
#define COLOR_FOCUSED 					1 1 1 0.8
#endif

#ifndef HEADER_HIGHLIGHT_BORDER_COLOR
#define HEADER_HIGHLIGHT_BORDER_COLOR	1 1 1 0.02
#endif

#ifndef HEADER_HORIZONTAL_ALIGN
#define HEADER_HORIZONTAL_ALIGN			HORIZONTAL_ALIGN_SUBLEFT
#endif

#ifndef HEADER_COLOR_FOCUS
#define HEADER_COLOR_FOCUS				0.80 0.04 0.32 1
#endif

#ifndef HEADER_VERTICAL_ALIGN
#define HEADER_VERTICAL_ALIGN 			VERTICAL_ALIGN_SUBTOP
#endif

#if !defined(HEADER_SEPATATOR_1) || !defined(HEADER_SEPARATOR_SPACING)
#define HEADER_SEPARATOR_TOTAL_SPACING(itemIndex)	0
#elif !defined(HEADER_SEPATATOR_2)
#define HEADER_SEPARATOR_TOTAL_SPACING(itemIndex)	((itemIndex <= HEADER_SEPATATOR_1) ? 0 : HEADER_SEPARATOR_SPACING)
#elif !defined(HEADER_SEPATATOR_3)
#define HEADER_SEPARATOR_TOTAL_SPACING(itemIndex)	((itemIndex <= HEADER_SEPATATOR_1) ? 0 : ((itemIndex <= HEADER_SEPATATOR_2) ? HEADER_SEPARATOR_SPACING : HEADER_SEPARATOR_SPACING * 2))
#else
#define HEADER_SEPARATOR_TOTAL_SPACING(itemIndex)	((itemIndex <= HEADER_SEPATATOR_1) ? 0 : ((itemIndex <= HEADER_SEPATATOR_2) ? HEADER_SEPARATOR_SPACING : ((itemIndex <= HEADER_SEPATATOR_3) ? HEADER_SEPARATOR_SPACING * 2 : HEADER_SEPARATOR_SPACING * 3)))
#endif

#define HEADER_ROW(itemIndex)		((itemIndex - 2) % HEADER_X_COUNT)
#define HEADER_COL(itemIndex)		((itemIndex - 1 - ((itemIndex - 1) % HEADER_X_COUNT)) / HEADER_X_COUNT)

#define HEADER_X(itemIndex) 		(HEADER_X_START + HEADER_X_SPACING * HEADER_ROW(itemIndex))
#define HEADER_Y(itemIndex) 		(HEADER_Y_START + HEADER_Y_SPACING * HEADER_COL(itemIndex))

#define HEADER_ORIGIN(itemIndex)	HEADER_X(itemIndex) HEADER_Y(itemIndex)

#define HEADER_RECT(itemIndex)			HEADER_ORIGIN(itemIndex) HEADER_SIZE_X HEADER_SIZE_Y HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN
#define HEADER_RECT_OWNER(itemIndex)	HEADER_ORIGIN(itemIndex) (HEADER_OWNER_SIZE_X - HEADER_OWNER_OFFSET_X) (HEADER_OWNER_SIZE_Y - HEADER_OWNER_OFFSET_Y) HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN

#define HEADER_BACKGROUND(itemIndex, visArg) HEADER_BACKGROUND_RAW(itemIndex, "gradient_fadein", BACKGROUND_COLOR, visArg)

#define HEADER_BACKGROUND_RAW(itemIndex, bgimage, foreColorArg, visArg) \
		itemDef \
		{ \
			style			WINDOW_STYLE_FILLED \
			rect			HEADER_ORIGIN(itemIndex) (HEADER_SIZE_X) HEADER_SIZE_Y HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN \
			forecolor		1 1 1 0 \
			backColor       0 0 0 0 \
			visible			1 \
			decoration \
		} \
		itemDef \
		{ \
			style			WINDOW_STYLE_FILLED \
			rect			HEADER_ORIGIN(itemIndex) (HEADER_SIZE_X) HEADER_SIZE_Y HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN \
			forecolor		1 1 1 0 \
			backColor       0 0 0 0 \
			visible			1 \
			decoration \
		} \

#define HEADER_HIGHLIGHT(itemIndex, vis) \
	HEADER_HIGHLIGHT_CUSTOM(itemIndex, HIGHLIGHT_COLOR, HIGHLIGHT_BORDER_COLOR, vis)

#define HEADER_HIGHLIGHT_CUSTOM(itemIndex, foreColorArg, borderColorArg, visArg) \
        itemDef /* button */ \
        { \
            style            	WINDOW_STYLE_FILLED \
            textstyle        	ITEM_TEXTSTYLE_NORMAL \
            rect            	HEADER_ORIGIN(itemIndex) HEADER_SIZE_X HEADER_SIZE_Y HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN \
            forecolor        	1 1 1 1 \
            backColor       	0 0 0 0 \
            background         	black \
            visible            	when(localVarInt(ui_highlight) == itemIndex && localVarString(ui_buttongroup) == LAYOUT_NAME); \
            decoration \
        } \
		itemDef /* top outline */ \
        { \
            style            	WINDOW_STYLE_SHADER \
            textstyle        	ITEM_TEXTSTYLE_NORMAL \
            rect            	HEADER_ORIGIN(itemIndex) HEADER_SIZE_X (HEADER_SIZE_Y-HEADER_SIZE_Y+1) HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN \
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
            rect            	HEADER_ORIGIN(itemIndex) HEADER_SIZE_X (HEADER_SIZE_Y - HEADER_SIZE_Y + 1) HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN \
			origin 				0 (HEADER_SIZE_Y - 1) \
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
            rect            	HEADER_ORIGIN(itemIndex) (HEADER_SIZE_X - HEADER_SIZE_X + 1) (HEADER_SIZE_Y - 2) HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN \
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
            rect            	HEADER_ORIGIN(itemIndex) (HEADER_SIZE_X - HEADER_SIZE_X + 1) (HEADER_SIZE_Y - 2) HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN \
			origin 				(HEADER_SIZE_X - 1) 1 \
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

#define HEADER_OWNER(itemIndex, textArg, owner, textAlignChoice, textAlignOffsetX, actionArg) \
		HEADER_OWNER_VIS(itemIndex, textArg, owner, textAlignChoice, textAlignOffsetX, actionArg, 1)

#define HEADER_OWNER_VIS(itemIndex, textArg, owner, textAlignChoice, textAlignOffsetX, actionArg, visArg) \
		HEADER_BACKGROUND(itemIndex, visArg) \
		HEADER_HIGHLIGHT(itemIndex, 1) \
		HEADER_VIS_NOHI_OWNER(itemIndex, textArg, owner, textAlignChoice, textAlignOffsetX, actionArg, visArg)

#define HEADER_VIS_NOHI_OWNER(itemIndex, textArg, owner, textAlignChoice, textAlignOffsetX, actionArg, visArg) \
		HEADER_FOCUS_VIS_NOHI_OWNER(itemIndex, textArg, owner, textAlignChoice, textAlignOffsetX, actionArg, ;, ;, visArg)

#define HEADER_FOCUS_VIS_NOHI_OWNER(itemIndex, textArg, owner, textAlignChoice, textAlignOffsetX, actionArg, onFocusArg, leaveFocusArg, visArg) \
		HEADER_FOCUS_VIS_NOHI_EX_OWNER(itemIndex, textArg, owner, textAlignChoice, textAlignOffsetX, actionArg, onFocusArg, leaveFocusArg, visArg, ;)

#define HEADER_FOCUS_VIS_NOHI_EX_OWNER(itemIndex, textArg, owner, textAlignChoice, textAlignOffsetX, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON  \
			rect			HEADER_RECT(itemIndex) \
			origin 			0 0 \
			text			textArg \
			ownerdraw		owner \
			textfont		HEADER_TEXTFONT \
			textscale		HEADER_TEXTSIZE \
			textstyle		HEADER_TEXTSTYLE \
			textAlign		textAlignChoice \
			textAlignX		textAlignOffsetX \
			textalignY 		19.5 \
			forecolor		HEADER_TEXTCOLOR \
			visible			visArg \
			extraArgs \
			HEADER_SCRIPTS_ALL(itemIndex, actionArg, onFocusArg, leaveFocusArg) \
		} \

#define HEADER(itemIndex, textArg, actionArg) \
		HEADER_VIS(itemIndex, textArg, actionArg, 1)

#define HEADER_NOHI(itemIndex, textArg, actionArg) \
		HEADER_VIS_NOHI(itemIndex, textArg, actionArg, 1)

#define HEADER_VIS(itemIndex, textArg, actionArg, visArg) \
		HEADER_BACKGROUND(itemIndex, visArg) \
		HEADER_HIGHLIGHT(itemIndex, 1) \
		HEADER_VIS_NOHI(itemIndex, textArg, actionArg, visArg)

#define HEADER_VIS_ADV(itemIndex, textArg, actionArg, visArg, vis) \
		HEADER_BACKGROUND(itemIndex, visArg) \
		HEADER_HIGHLIGHT(itemIndex, vis) \
		HEADER_VIS_NOHI(itemIndex, textArg, actionArg, visArg)

#define HEADER_VIS_NOHI(itemIndex, textArg, actionArg, visArg) \
		HEADER_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, ;, ;, visArg)

#define HEADER_FOCUS(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg) \
		HEADER_FOCUS_VIS(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, 1)

#define HEADER_FOCUS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg) \
		HEADER_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, 1)

#define HEADER_FOCUS_VIS(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg) \
		HEADER_BACKGROUND(itemIndex, visArg) \
		HEADER_HIGHLIGHT(itemIndex, 1) \
		HEADER_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg)

#define HEADER_FOCUS_VIS_ADV(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, vis) \
		HEADER_BACKGROUND(itemIndex, visArg) \
		HEADER_HIGHLIGHT(itemIndex, vis) \
		HEADER_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg)

#define HEADER_FOCUS_VIS_NOHI(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg) \
		HEADER_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, ;)

#define HEADER_EX(itemIndex, textArg, actionArg, extraArgs) \
		HEADER_BACKGROUND(itemIndex, 1) \
		HEADER_HIGHLIGHT(itemIndex, 1) \
		HEADER_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, ;, ;, 1, extraArgs)

#define HEADER_EX_ADV(itemIndex, textArg, actionArg, extraArgs, visArg) \
		HEADER_BACKGROUND(itemIndex, 1) \
		HEADER_HIGHLIGHT(itemIndex, 1) \
		HEADER_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, ;, ;, visArg, extraArgs)

#define HEADER_FOCUS_VIS_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs) \
		HEADER_BACKGROUND(itemIndex, visArg) \
		HEADER_HIGHLIGHT(itemIndex, 1) \
		HEADER_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs)

#define HEADER_FOCUS_VIS_EX_ADV(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs, vis) \
		HEADER_BACKGROUND(itemIndex, visArg) \
		HEADER_HIGHLIGHT(itemIndex, vis) \
		HEADER_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs)

#define HEADER_FOCUS_VIS_NOHI_EX(itemIndex, textArg, actionArg, onFocusArg, leaveFocusArg, visArg, extraArgs) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			HEADER_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		HEADER_TEXTFONT \
			textscale		HEADER_TEXTSIZE \
			textstyle		HEADER_TEXTSTYLE \
			textAlign		HEADER_TEXTALIGN \
			textAlignX		0 \
			forecolor		HEADER_TEXTCOLOR \
			visible			visArg \
			extraArgs \
			HEADER_SCRIPTS_ALL(itemIndex, actionArg, onFocusArg, leaveFocusArg) \
		} \

#define DHEADER_VIS_NOHI(itemIndex, textArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			rect			HEADER_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		HEADER_TEXTFONT \
			textscale		HEADER_TEXTSIZE \
			textstyle		HEADER_TEXTSTYLE \
			textAlign		HEADER_TEXTALIGN \
			textAlignX		0 \
			forecolor		HEADER_TEXTCOLOR_DISABLED \
			visible			visArg \
			decoration \
		} \

#define DHEADER_VIS(itemIndex, textArg, visArg) \
		HEADER_BACKGROUND(itemIndex, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_TEXT \
			rect			HEADER_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		UI_FONT_NORMAL \
			textscale		HEADER_TEXTSIZE \
			textstyle		HEADER_TEXTSTYLE \
			textAlign		HEADER_TEXTALIGN \
			textAlignX		0 \
			forecolor		HEADER_TEXTCOLOR_DISABLED \
			visible			visArg \
			decoration \
		} \

#define HEADER_CAPTION(itemIndex, textArg) \
		HEADER_CAPTION_VIS(itemIndex, textArg, 1)

#define HEADER_CAPTION_COLOR(itemIndex, textArg, colorArg) \
		HEADER_CAPTION_COLOR_VIS(itemIndex, textArg, colorArg, 1)

#define HEADER_CAPTION_VIS(itemIndex, textArg, visArg) \
		HEADER_CAPTION_COLOR_VIS(itemIndex, textArg, HEADER_TEXTCOLOR_CAPT, visArg)

#define HEADER_CAPTION_COLOR_VIS(itemIndex, textArg, colorArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			HEADER_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		UI_FONT_NORMAL \
			textscale		HEADER_TEXTSIZE \
			textstyle		HEADER_TEXTSTYLE \
			textAlign		HEADER_TEXTALIGN \
			textAlignX		0 \
			forecolor		colorArg \
			visible			visArg \
			decoration \
		}

#define HEADER_SUBTEXT_COLOR_VIS(itemIndex, textArg, colorArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			HEADER_RECT(itemIndex) \
			exp				text(textArg); \
			textfont		UI_FONT_NORMAL \
			textscale		HEADER_TEXTSIZE \
			textstyle		HEADER_TEXTSTYLE \
			textAlign		ITEM_ALIGN_MIDDLE_LEFT \
			forecolor		colorArg \
			visible			visArg \
			decoration \
		}

#define HEADER_APPLY(textArg, actionArg) \
		HEADER_APPLY_VIS(textArg, actionArg, 1)

#define HEADER_APPLY_VIS(textArg, actionArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			430 422 100 16 HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN \
			text			textArg \
			textfont		UI_FONT_NORMAL \
			textscale		TEXTSIZE_DEFAULT \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			textAlign		ITEM_ALIGN_MIDDLE_CENTER \
			forecolor		HEADER_COLOR_FOCUS \
			visible			visArg ; \
			action \
			{ \
				play "mouse_click"; \
				actionArg; \
			} \
		}

#define HEADER_BACK(textArg, actionArg) \
		HEADER_BACK_VIS(textArg, actionArg, 1)

#define HEADER_BACK_VIS(textArg, actionArg, visArg) \
		itemDef \
		{ \
			type			ITEM_TYPE_BUTTON \
			rect			270 422 100 16 HEADER_HORIZONTAL_ALIGN HEADER_VERTICAL_ALIGN \
			text			textArg \
			textfont		UI_FONT_NORMAL \
			textscale		TEXTSIZE_DEFAULT \
			textstyle		ITEM_TEXTSTYLE_NORMAL \
			textAlign		ITEM_ALIGN_MIDDLE_CENTER \
			forecolor		HEADER_COLOR_FOCUS \
			visible			visArg ; \
			action \
			{ \
				play "mouse_click"; \
				actionArg; \
			} \
		}

#define HEADER_SCRIPTS_ACTION(itemIndex, actionArg) \
	HEADER_SCRIPTS_ALL(itemIndex, actionArg, ;, ;)

#define HEADER_SCRIPTS_ALL(itemIndex, actionArg, onFocusArg, leaveFocusArg) \
			onFocus \
			{ \
				play BUTTON_FOCUS_SOUND; \
				setLocalVarInt ui_header_highlight itemIndex; \
				setLocalVarString ui_buttongroup LAYOUT_NAME; \
				onFocusArg \
			} \
			leaveFocus \
			{ \
				setLocalVarInt ui_header_highlight 0; \
				leaveFocusArg \
			} \
			action \
			{ \
				play "mouse_click"; \
				actionArg; \
			}
