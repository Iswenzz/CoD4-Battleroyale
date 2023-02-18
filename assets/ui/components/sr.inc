#define SR_ALIGN_TOP_SUBLEFT 		HORIZONTAL_ALIGN_SUBLEFT 	VERTICAL_ALIGN_SUBTOP
#define SR_ALIGN_TOP_LEFT 			HORIZONTAL_ALIGN_LEFT 		VERTICAL_ALIGN_SUBTOP
#define SR_ALIGN_TOP_CENTER 		HORIZONTAL_ALIGN_CENTER 	VERTICAL_ALIGN_SUBTOP
#define SR_ALIGN_TOP_RIGHT 			HORIZONTAL_ALIGN_RIGHT 		VERTICAL_ALIGN_SUBTOP
#define SR_ALIGN_MIDDLE_SUBLEFT 	HORIZONTAL_ALIGN_SUBLEFT 	VERTICAL_ALIGN_CENTER
#define SR_ALIGN_MIDDLE_LEFT 		HORIZONTAL_ALIGN_LEFT 		VERTICAL_ALIGN_CENTER
#define SR_ALIGN_MIDDLE_CENTER 		HORIZONTAL_ALIGN_CENTER 	VERTICAL_ALIGN_CENTER
#define SR_ALIGN_MIDDLE_RIGHT 		HORIZONTAL_ALIGN_RIGHT 		VERTICAL_ALIGN_CENTER
#define SR_ALIGN_BOTTOM_SUBLEFT 	HORIZONTAL_ALIGN_SUBLEFT 	VERTICAL_ALIGN_BOTTOM
#define SR_ALIGN_BOTTOM_LEFT 		HORIZONTAL_ALIGN_LEFT 		VERTICAL_ALIGN_BOTTOM
#define SR_ALIGN_BOTTOM_CENTER 		HORIZONTAL_ALIGN_CENTER 	VERTICAL_ALIGN_BOTTOM
#define SR_ALIGN_BOTTOM_RIGHT 		HORIZONTAL_ALIGN_RIGHT 		VERTICAL_ALIGN_BOTTOM

#ifndef SR_WINDOW_X
#define SR_WINDOW_X 		0
#endif

#ifndef SR_WINDOW_Y
#define SR_WINDOW_Y 		35
#endif

#ifndef SR_WINDOW_W
#define SR_WINDOW_W 		640
#endif

#ifndef SR_WINDOW_H
#define SR_WINDOW_H 		410
#endif

#define SR_WINDOW_ORIGIN 	SR_WINDOW_X SR_WINDOW_Y
#define SR_WINDOW_SIZE 		SR_WINDOW_W SR_WINDOW_H

#define SR_WINDOW_RECT 		SR_WINDOW_ORIGIN SR_WINDOW_SIZE SR_ALIGN_TOP_SUBLEFT

#ifndef SR_WINDOW_HEADER_H
#define SR_WINDOW_HEADER_H 	25
#endif

#ifndef SR_HEADER_TEXTALIGN
#define SR_HEADER_TEXTALIGN ITEM_ALIGN_MIDDLE_LEFT
#endif

#ifndef SR_BORDER_COLOR
#define SR_BORDER_COLOR 	0.5 0.1 1 1
#endif

#ifndef SR_KEY_SIZE_X
#define SR_KEY_SIZE_X 		230
#endif

#ifndef SR_KEY_OFFSET_X
#define SR_KEY_OFFSET_X		6
#endif

#ifndef SR_TEXTALIGN_KEY
#define SR_TEXTALIGN_KEY	ITEM_ALIGN_MIDDLE_LEFT
#endif

#ifndef SR_VALUE_SIZE_X
#define SR_VALUE_SIZE_X		50
#endif

#ifndef SR_VALUE_OFFSET_X
#define SR_VALUE_OFFSET_X	0
#endif

#ifndef SR_TEXTALIGN_VALUE
#define SR_TEXTALIGN_VALUE	ITEM_ALIGN_MIDDLE_CENTER
#endif

#define SR_WINDOW_CONTENT_RECT \
	SR_WINDOW_X \
	(SR_WINDOW_Y + SR_WINDOW_HEADER_H) \
	SR_WINDOW_W \
	(SR_WINDOW_H - SR_WINDOW_HEADER_H) \
	SR_ALIGN_TOP_SUBLEFT \

#define SR_WINDOW_HEADER(headerName) \
	itemdef \
	{ \
		name			headerName \
		rect			0 0 SR_WINDOW_W SR_WINDOW_HEADER_H SR_ALIGN_TOP_SUBLEFT \
		style			1 \
		backcolor		0 0 0 0.5 \
		visible			1 \
		decoration \
	}

#define SR_WINDOW_HEADER_BORDER(x, y, w, h) \
	itemdef \
	{ \
		name			"headerBorder" \
		rect			x y w h SR_ALIGN_TOP_SUBLEFT \
		style			1 \
		backcolor		SR_BORDER_COLOR\
		visible			1 \
		decoration \
	}

#define SR_WINDOW(menuName) \
	name menuName \
	rect SR_WINDOW_RECT \
	itemdef \
	{ \
		name			"window" \
		rect			0 0 SR_WINDOW_SIZE SR_ALIGN_TOP_SUBLEFT \
		style			1 \
		backcolor		0 0 0 0.3 \
		visible			1 \
		decoration \
	} \
	SR_WINDOW_HEADER("header") \
	SR_WINDOW_HEADER_BORDER(0, SR_WINDOW_HEADER_H, SR_WINDOW_W, 2)

#define SR_FRAME(x, y, w, h) \
	itemdef \
	{ \
		name			"frame" \
		rect			x y w h SR_ALIGN_TOP_SUBLEFT \
		style			1 \
		backcolor		0 0 0 0.4 \
		visible			1 \
		border			5 \
		bordersize		1 \
		bordercolor		0.5 0.1 1 1 \
		decoration \
	}

#define SR_FRAME_BORDER(x, y, w, h) \
	itemdef \
	{ \
		name			"headerBorder" \
		rect			x y w h SR_ALIGN_TOP_SUBLEFT \
		style			1 \
		backcolor		SR_BORDER_COLOR \
		visible			1 \
		decoration \
	}

#define SR_FRAME_SECONDARY(x, y, w, h) \
	itemdef \
	{ \
		name			"frame" \
		rect			x y w h SR_ALIGN_TOP_SUBLEFT \
		style			1 \
		backcolor		0 0 0 0.4 \
		visible			1 \
		border			6 \
		bordersize		1 \
		bordercolor		0.5 0.1 1 1 \
		decoration \
	}

#define SR_FRAME_HEADER(textArg, x, y, w, h, o) \
	itemdef \
	{ \
		name			"frameHeader" \
		rect			x y w h SR_ALIGN_TOP_SUBLEFT \
		style			1 \
		backcolor		0 0 0 0.5 \
		visible			1 \
		type			0 \
		exp				text(textArg) \
		textscale		0.35 \
		textstyle		0 \
		textalign		SR_HEADER_TEXTALIGN \
		textalignx		o \
		decoration \
	}

#define SR_WINDOW_CONTENT(menuName) \
	name menuName \
	rect SR_WINDOW_CONTENT_RECT

#define SR_TEXT(itemIndex, textArg) \
	itemdef \
	{ \
		name			"text" \
		style			1 \
		backcolor		0 0 0 0.4 \
		visible			1 \
		type			0 \
		rect			LAYOUT_RECT(itemIndex) \
		exp				text(textArg); \
		textfont		LAYOUT_TEXTFONT \
		textscale		LAYOUT_TEXTSIZE \
		textstyle		LAYOUT_TEXTSTYLE \
		textAlign		LAYOUT_TEXTALIGN \
		textAlignX		LAYOUT_TEXT_OFFSET_X \
		forecolor		LAYOUT_TEXTCOLOR \
		decoration \
	}

#define SR_BUTTON_KV(itemIndex, keyArg, valueArg, actionArg) \
	SR_BUTTON_KV_VIS(itemIndex, keyArg, valueArg, actionArg, 1)

#define SR_BUTTON_KV_VIS(itemIndex, keyArg, valueArg, actionArg, visArg) \
	itemdef \
	{ \
		name			"textKey" \
		style			1 \
		backcolor		0 0 0 0.4 \
		visible			visArg \
		type			0 \
		rect			LAYOUT_X(itemIndex) LAYOUT_Y(itemIndex) SR_KEY_SIZE_X LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		exp				text(keyArg); \
		textfont		LAYOUT_TEXTFONT \
		textscale		LAYOUT_TEXTSIZE \
		textstyle		LAYOUT_TEXTSTYLE \
		textAlign		SR_TEXTALIGN_KEY \
		textAlignX		SR_KEY_OFFSET_X \
		forecolor		LAYOUT_TEXTCOLOR \
		decoration \
	} \
	itemdef \
	{ \
		name			"textValue" \
		style			1 \
		backcolor		0 0 0 0.4 \
		visible			visArg \
		type			ITEM_TYPE_BUTTON \
		rect			(LAYOUT_X(itemIndex) + SR_KEY_SIZE_X + 2) LAYOUT_Y(itemIndex) SR_VALUE_SIZE_X LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		exp				text(valueArg); \
		textfont		LAYOUT_TEXTFONT \
		textscale		LAYOUT_TEXTSIZE \
		textstyle		LAYOUT_TEXTSTYLE \
		textAlign		SR_TEXTALIGN_VALUE \
		textAlignX		SR_VALUE_OFFSET_X \
		forecolor		LAYOUT_TEXTCOLOR \
		action \
		{ \
			play "mouse_click"; \
			actionArg; \
		} \
	}

#define SR_TEXT_KV(itemIndex, keyArg, valueArg) \
	itemdef \
	{ \
		name			"textKey" \
		style			1 \
		backcolor		0 0 0 0.4 \
		visible			1 \
		type			0 \
		rect			LAYOUT_X(itemIndex) LAYOUT_Y(itemIndex) SR_KEY_SIZE_X LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		exp				text(keyArg); \
		textfont		LAYOUT_TEXTFONT \
		textscale		LAYOUT_TEXTSIZE \
		textstyle		LAYOUT_TEXTSTYLE \
		textAlign		SR_TEXTALIGN_KEY \
		textAlignX		SR_KEY_OFFSET_X \
		forecolor		LAYOUT_TEXTCOLOR \
		decoration \
	} \
	itemdef \
	{ \
		name			"textValue" \
		style			1 \
		backcolor		0 0 0 0.4 \
		visible			1 \
		type			0 \
		rect			(LAYOUT_X(itemIndex) + SR_KEY_SIZE_X + 2) LAYOUT_Y(itemIndex) SR_VALUE_SIZE_X LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
		exp				text(valueArg); \
		textfont		LAYOUT_TEXTFONT \
		textscale		LAYOUT_TEXTSIZE \
		textstyle		LAYOUT_TEXTSTYLE \
		textAlign		SR_TEXTALIGN_VALUE \
		textAlignX		SR_VALUE_OFFSET_X \
		forecolor		LAYOUT_TEXTCOLOR \
		decoration \
	}

#define SR_BUTTON_LEFT(itemIndex, textArg, actionArg, visArg) \
		BUTTON_VIS(itemIndex, textArg, actionArg, visArg) \
		itemDef \
		{ \
			style			WINDOW_STYLE_FILLED \
			rect			LAYOUT_ORIGIN(itemIndex) 2 LAYOUT_SIZE_Y LAYOUT_HORIZONTAL_ALIGN LAYOUT_VERTICAL_ALIGN \
			forecolor		1 1 1 0 \
			backColor       0.5 0.1 1 1 \
			visible			visArg \
			decoration \
		}
