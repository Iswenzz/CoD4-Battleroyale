#define rank (stat(2350)+1)
#define prestige (stat(2326))
#define vipshow (stat(2360))
#define SPRAY_TABLE "mp/sprayTable.csv"
#define KNIFE_TABLE "mp/knifeTable.csv"
#define KNIFE_SKIN_TABLE "mp/knifeSkinTable.csv"
#define CHARACTER_TABLE "mp/characterTable.csv"
#define ITEM_TABLE "mp/itemTable.csv"
#define ABILITY_TABLE "mp/abilityTable.csv"
#define THEME_TABLE "mp/themeTable.csv"

#ifndef DR_BUTTON_FORECOLOR
	#define DR_BUTTON_FORECOLOR 0 0 0 0
	#define DR_BUTTON_BACKCOLOR 0 0 0 0
	#define DR_BUTTON_BACKCOLOR_FOCUSED 0 0 0 0
	#define DR_BUTTON_BORDERCOLOR 0 0 0 0
	#define DR_BUTTON_BORDERCOLOR_SR 0 0 0 0
#endif

#ifndef DR_BUTTON_ALIGN
    #define DR_BUTTON_ALIGN HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER 
#endif

#define DR_BUTTON_TEXT_RIGHT( id, x, y, w, h, itemName, itemAction, visArg ) \
		DR_BUTTON_EXT_TEXT_RIGHT( id, x, y, w, h, itemName, itemAction, ;, ;, visArg )

#define DR_BUTTON_EXT_TEXT_RIGHT( id, x, y, w, h, itemName, itemAction, onItemEnter, onItemExit, visArg ) \
itemDef \
{ \
	visible			visArg \
	name			"button_default"id \
	rect			x y w h DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR_SR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		DR_BUTTON_BACKCOLOR \
} \
itemDef \
{ \
	visible			visArg \
	name			"button_over"id \
	rect			x y w h DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR_SR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		DR_BUTTON_BACKCOLOR_FOCUSED \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y w h DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( itemName ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_RIGHT \
	textscale	0.6 \
	textalignx	8 \
	textaligny	(h-1) \
	visible		visArg \
	mouseEnter \
	{ \
		play "mouse_over"; \
		show "button_over"id; \
		hide "button_default"id; \
		setdvar sr_button ""id \
		onItemEnter \
	} \
	mouseExit \
	{ \
		show "button_default"id; \
		hide "button_over"id; \
		setdvar sr_button "0" \
		onItemExit \
	} \
	action \
	{ \
		itemAction \
	} \
} 


#define DR_BUTTON_TEXT_LEFT( id, x, y, w, h, itemName, itemAction, visArg ) \
		DR_BUTTON_EXT_TEXT_LEFT( id, x, y, w, h, itemName, itemAction, ;, ;, visArg )

#define DR_BUTTON_EXT_TEXT_LEFT( id, x, y, w, h, itemName, itemAction, onItemEnter, onItemExit, visArg ) \
itemDef \
{ \
	visible			visArg \
	name			"button_default"id \
	rect			x y w h DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR_SR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		DR_BUTTON_BACKCOLOR \
} \
itemDef \
{ \
	visible			visArg \
	name			"button_over"id \
	rect			x y w h DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR_SR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		DR_BUTTON_BACKCOLOR_FOCUSED \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y w h DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( itemName ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.6 \
	textalignx	8 \
	textaligny	(h-1) \
	visible		visArg \
	mouseEnter \
	{ \
		play "mouse_over"; \
		show "button_over"id; \
		hide "button_default"id; \
		setdvar sr_button ""id \
		onItemEnter \
	} \
	mouseExit \
	{ \
		show "button_default"id; \
		hide "button_over"id; \
		setdvar sr_button "0" \
		onItemExit \
	} \
	action \
	{ \
		itemAction \
	} \
} 

#define DR_BUTTON( id, x, y, w, h, itemName, itemAction, visArg ) \
		DR_BUTTON_EXT( id, x, y, w, h, itemName, itemAction, ;, ;, visArg )

#define DR_BUTTON_EXT( id, x, y, w, h, itemName, itemAction, onItemEnter, onItemExit, visArg ) \
itemDef \
{ \
	visible			visArg \
	name			"button_default"id \
	rect			x y w h DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR_SR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		DR_BUTTON_BACKCOLOR \
} \
itemDef \
{ \
	visible			visArg \
	name			"button_over"id \
	rect			x y w h DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR_SR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		DR_BUTTON_BACKCOLOR_FOCUSED \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y w h DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( itemName ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.6 \
	textalignx	8 \
	textaligny	(h-1) \
	visible		visArg \
	mouseEnter \
	{ \
		play "mouse_over"; \
		show "button_over"id; \
		hide "button_default"id; \
		setdvar sr_button ""id \
		onItemEnter \
	} \
	mouseExit \
	{ \
		show "button_default"id; \
		hide "button_over"id; \
		setdvar sr_button "0" \
		onItemExit \
	} \
	action \
	{ \
		itemAction \
	} \
} 

#define SR_BUTTON( id, x, y, w, h, itemName, visArg ) \
itemDef \
{ \
	rect		x y w h DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( itemName ) \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.6 \
	textalignx	8 \
	textaligny	(h-1) \
	visible		visArg \
	decoration \
} 

#define DR_WEAPON( x, y, itemID ) \
itemDef \
{ \
	visible			when( rank < tableLookup(ITEM_TABLE, 0, itemID, 2) ) /*locked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \ 
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	visible			when( rank >= tableLookup(ITEM_TABLE, 0, itemID, 2) ) /*unlocked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y 133 28 DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( tableLookup(ITEM_TABLE, 0, itemID, 5) ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.32 \
	textalignx	70 \
	textaligny	22 \
	visible		when( rank >= tableLookup(ITEM_TABLE, 0, itemID, 2) ) /*unlocked*/ \
	mouseEnter \
	{ \
		play "mouse_over"; \
	} \
	action \
	{ \
		scriptMenuResponse itemID; \
		close self; \
		open "character_stuff"; \
	} \
} \ 
itemDef \
{ \
	visible		1 \
	rect		x y 220 35 DR_BUTTON_ALIGN \
	textscale	0.18 \
	textalignx	35 \
	textaligny	23 \
	forecolor	1 1 1 0.8 \
	exp			text( tableLookup(ITEM_TABLE, 0, itemID, 6) ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	decoration \
} \
itemDef \
{ \
	visible		when( rank < tableLookup(ITEM_TABLE, 0, itemID, 2) ) /*locked*/ \
	rect		(x+120) (y+9) 1 1 DR_BUTTON_ALIGN \
	textscale	0.22 \
	textaligny	11 \
	forecolor	1 1 1 0.8 \
	exp			text( "^2LOCKED ("+tableLookup(ITEM_TABLE, 0, itemID, 2)+")" ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_RIGHT \
	textscale	0.2 \
	decoration \
} 
// tablelookup( "mp/rankIconTable.csv", 0, stat(252), stat(2326)+1 )

#define DR_KNIFE( x, y, itemID ) \
itemDef \
{ \
	visible			when( rank < tableLookup(KNIFE_TABLE, 0, itemID, 2) ) /*locked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \ 
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	visible			when( rank >= tableLookup(KNIFE_TABLE, 0, itemID, 2) ) /*unlocked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y 133 28 DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( tableLookup(KNIFE_TABLE, 0, itemID, 5) ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.32 \
	textalignx	70 \
	textaligny	22 \
	visible		when( rank >= tableLookup(KNIFE_TABLE, 0, itemID, 2) ) /*unlocked*/ \
	mouseEnter \
	{ \
		play "mouse_over"; \
	} \
	action \
	{ \
		scriptMenuResponse itemID; \
		close self; \
		open "character_stuff"; \
	} \
} \ 
itemDef \
{ \
	visible		1 \
	rect		x y 220 35 DR_BUTTON_ALIGN \
	textscale	0.18 \
	textalignx	35 \
	textaligny	23 \
	forecolor	1 1 1 0.8 \
	exp			text( tableLookup(KNIFE_TABLE, 0, itemID, 6) ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	decoration \
} \
itemDef \
{ \
	visible		when( rank < tableLookup(KNIFE_TABLE, 0, itemID, 2) ) /*locked*/ \
	rect		(x+120) (y+9) 1 1 DR_BUTTON_ALIGN \
	textscale	0.22 \
	textaligny	11 \
	forecolor	1 1 1 0.8 \
	exp			text( "^2LOCKED ("+tableLookup(KNIFE_TABLE, 0, itemID, 2)+")" ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_RIGHT \
	textscale	0.2 \
	decoration \
} 

#define DR_KNIFE_SKIN( x, y, itemID ) \
itemDef \
{ \
	visible			when( prestige < tableLookup(KNIFE_SKIN_TABLE, 0, itemID, 2) && vipshow < 1 ) /*locked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \ 
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	visible			when( prestige >= tableLookup(KNIFE_SKIN_TABLE, 0, itemID, 2) && vipshow < 1 ) /*unlocked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y 133 28 DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( tableLookup(KNIFE_SKIN_TABLE, 0, itemID, 5) ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	textalignx	70 \
	textaligny	22 \
	visible		when( prestige >= tableLookup(KNIFE_SKIN_TABLE, 0, itemID, 2) && vipshow < 1 ) /*unlocked*/ \
	mouseEnter \
	{ \
		play "mouse_over"; \
	} \
	action \
	{ \
		scriptMenuResponse itemID; \
		close self; \
		open "character_stuff"; \
	} \
} \ 
itemDef \
{ \
	visible		1 \
	rect		x y 220 35 DR_BUTTON_ALIGN \
	textscale	0.18 \
	textalignx	35 \
	textaligny	23 \
	forecolor	1 1 1 0.8 \
	exp			text( tableLookup(KNIFE_SKIN_TABLE, 0, itemID, 6) ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	decoration \
} \
itemDef \
{ \
	visible		when( prestige < tableLookup(KNIFE_SKIN_TABLE, 0, itemID, 2) && vipshow < 1 ) /*locked*/ \
	rect		(x+120) (y+9) 1 1 DR_BUTTON_ALIGN \
	textscale	0.22 \
	textaligny	11 \
	forecolor	1 1 1 0.8 \
	exp			text( "^2LOCKED (PRESTIGE "+tableLookup(KNIFE_SKIN_TABLE, 0, itemID, 2)+")" ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_RIGHT \
	textscale	0.2 \
	decoration \
} 

#define DR_KNIFE_SKIN_VIP( x, y, itemID ) \
itemDef \
{ \
	visible			when( vipshow > 0 ) /*unlocked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y 133 28 DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( tableLookup(KNIFE_SKIN_TABLE, 0, itemID, 5) ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	textalignx	70 \
	textaligny	22 \
	visible		when( vipshow > 0 ) /*unlocked*/ \
	mouseEnter \
	{ \
		play "mouse_over"; \
	} \
	action \
	{ \
		scriptMenuResponse itemID; \
		close self; \
		open "character_stuff"; \
	} \
} \ 
itemDef \
{ \
	visible		1 \
	rect		x y 220 35 DR_BUTTON_ALIGN \
	textscale	0.18 \
	textalignx	35 \
	textaligny	23 \
	forecolor	1 1 1 0.8 \
	exp			text( tableLookup(KNIFE_SKIN_TABLE, 0, itemID, 6) ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	decoration \
} \

#define DR_ABILITY( y, itemID ) \
itemDef \
{ \
	visible			when( rank < tableLookup(ABILITY_TABLE, 0, itemID, 2) && itemID != 1 ) /*locked*/ \
	rect			90 y 220 35 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		DR_BUTTON_BACKCOLOR \
} \
itemDef \
{ \
	visible			when( stat(tableLookup(ABILITY_TABLE, 0, itemID, 2)) == 1 || itemID == 1 ) /*unlocked*/ \
	rect			90 y 220 35 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		DR_BUTTON_BACKCOLOR_FOCUSED \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		90 y 220 35 DR_BUTTON_ALIGN \
	forecolor	1 1 1 0.8 \
	exp			text( tableLookup(ABILITY_TABLE, 0, itemID, 5) ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.32 \
	textalignx	70 \
	textaligny	22 \
	visible		when( stat(tableLookup(ABILITY_TABLE, 0, itemID, 2)) == 1 || itemID == 1 ) /*unlocked*/ \
	mouseEnter \
	{ \
		play "mouse_over"; \
	} \
	action \
	{ \
		scriptMenuResponse itemID; \
		close self; \
		open "character_stuff"; \
	} \
} \ 
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		90 y 220 35 DR_BUTTON_ALIGN \
	forecolor	0.8 0.8 0.8 0.6 \
	exp			text( tableLookup(ABILITY_TABLE, 0, itemID, 5) ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.32 \
	textalignx	70 \
	textaligny	22 \
	visible		when( stat(tableLookup(ABILITY_TABLE, 0, itemID, 2)) != 1 && itemID != 1 ) /*locked*/ \
} \
itemDef \
{ \
	visible		1 \
	rect		90 y 220 35 DR_BUTTON_ALIGN \
	textscale	0.18 \
	textalignx	70 \
	textaligny	33 \
	forecolor	1 1 1 0.8 \
	exp			text( tableLookup(ABILITY_TABLE, 0, itemID, 6) ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	decoration \
} \
itemDef \
{ \
	visible		when( rank < tableLookup(ABILITY_TABLE, 0, itemID, 2) && itemID != 1 ) /*locked*/ \
	origin		308 y \
	textscale	0.22 \
	textaligny	11 \
	forecolor	1 1 1 0.8 \
	exp			text( "^1LOCKED" ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_RIGHT \
	textscale	0.2 \
	decoration \
} \
itemDef \
{ \
	visible		when( stat(tableLookup(ABILITY_TABLE, 0, itemID, 2)) == 1 || itemID == 1 ) /*unlocked*/ \
	origin		308 y \
	textscale	0.22 \
	textaligny	11 \
	forecolor	1 1 1 0.8 \
	exp			text( "^2UNLOCKED" ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_RIGHT \
	textscale	0.2 \
	decoration \
}

#define DR_THEME( x, y, itemID ) \
itemDef \
{ \
	visible			when( rank < tableLookup(THEME_TABLE, 0, itemID, 2) ) /*locked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \ 
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	visible			when( rank >= tableLookup(THEME_TABLE, 0, itemID, 2) ) /*unlocked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y 133 28 DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( tableLookup(THEME_TABLE, 0, itemID, 5) ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	textalignx	70 \
	textaligny	22 \
	visible		when( rank >= tableLookup(THEME_TABLE, 0, itemID, 2) ) /*unlocked*/ \
	mouseEnter \
	{ \
		play "mouse_over"; \
	} \
	action \
	{ \
		scriptMenuResponse itemID; \
		close self; \
		open "character_stuff"; \
	} \
} \ 
itemDef \
{ \
	visible		1 \
	rect		x y 220 35 DR_BUTTON_ALIGN \
	textscale	0.18 \
	textalignx	35 \
	textaligny	23 \
	forecolor	1 1 1 0.8 \
	exp			text( tableLookup(THEME_TABLE, 0, itemID, 6) ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	decoration \
} \
itemDef \
{ \
	visible		when( rank < tableLookup(THEME_TABLE, 0, itemID, 2) ) /*locked*/ \
	rect		(x+120) (y+9) 1 1 DR_BUTTON_ALIGN \
	textscale	0.22 \
	textaligny	11 \
	forecolor	1 1 1 0.8 \
	exp			text( "^2LOCKED ("+tableLookup(THEME_TABLE, 0, itemID, 2)+")" ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_RIGHT \
	textscale	0.2 \
	decoration \
} 

// 20 sprays - 96x90
// 25 sprays = 96x72
#define DR_SPRAY( x, y, w, h, row, column, itemID ) \
itemDef \
{ \
	visible		when( rank < tableLookup(SPRAY_TABLE, 0, itemID, 2) ) \
	rect		(x-20) y 0 0 DR_BUTTON_ALIGN \
	origin		(44*row) (43*column) \
	textalignx	48 \
	textaligny	45 \
	forecolor	1 1 1 0.8 \
	exp			text( "^2(" + tableLookup(SPRAY_TABLE, 0, itemID, 2)+")") \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_CENTER \
	textscale	0.2 \
	decoration \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y w h DR_BUTTON_ALIGN \
	origin		(44*row) (43*column) \
	forecolor	1 1 1 0.8 \
	type		ITEM_TYPE_BUTTON \
	exp			text( " " ) \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.32 \
	textalignx	70 \
	textaligny	22 \
	visible		1 /*unlocked*/ \
	mouseEnter \
	{ \
		play "mouse_over"; \
	} \
	action \
	{ \
		scriptMenuResponse itemID; \
		close self; \
		open "character_stuff"; \
	} \
} 


#define DR_CHARACTER( x, y, itemID ) \
itemDef \
{ \
	visible			when( rank < tableLookup(CHARACTER_TABLE, 0, itemID, 2) ) /*locked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	visible			when( rank >= tableLookup(CHARACTER_TABLE, 0, itemID, 2) ) /*unlocked*/ \
	rect			x y 133 28 DR_BUTTON_ALIGN \
	style			WINDOW_STYLE_FILLED \
	border			1 \
	bordercolor		DR_BUTTON_BORDERCOLOR \ 
	forecolor		DR_BUTTON_FORECOLOR \ 
	backcolor		0.4 0.4 0.4 0.2 \
} \
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y 133 28 DR_BUTTON_ALIGN \
	forecolor	1 1 1 1 \
	exp			text( tableLookup(CHARACTER_TABLE, 0, itemID, 6) ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.32 \
	textalignx	35 \
	textaligny	14 \
	visible		when( rank >= tableLookup(CHARACTER_TABLE, 0, itemID, 2) ) /*unlocked*/ \
	mouseEnter \
	{ \
		play "mouse_over"; \
	} \
	action \
	{ \
		scriptMenuResponse itemID; \
		close self; \
		open "character_stuff"; \
	} \
} \ 
itemDef \
{ \
	style		WINDOW_STYLE_FILLED \
	rect		x y 133 28 DR_BUTTON_ALIGN \
	forecolor	1 1 1 0.8 \
	exp			text( tableLookup(CHARACTER_TABLE, 0, itemID, 6) ) \
	type		ITEM_TYPE_BUTTON \
	textfont	UI_FONT_NORMAL \
	textstyle	ITEM_TEXTSTYLE_SHADOWED \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	textalignx	35 \
	textaligny	23 \
	visible		when( rank < tableLookup(CHARACTER_TABLE, 0, itemID, 2) ) /*locked*/ \
} \
itemDef \
{ \
	visible		1 \
	rect		x y 133 28 DR_BUTTON_ALIGN \
	textscale	0.18 \
	textalignx	35 \
	textaligny	23 \
	forecolor	1 1 1 0.8 \
	exp			text( tableLookup(CHARACTER_TABLE, 0, itemID, 7) ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_LEFT \
	textscale	0.2 \
	decoration \
} \
itemDef \
{ \
	visible		when( rank < tableLookup(CHARACTER_TABLE, 0, itemID, 2) ) /*locked*/ \
	rect		(x+120) (y+9) 1 1 DR_BUTTON_ALIGN \
	textscale	0.22 \
	textaligny	11 \
	forecolor	1 1 1 0.8 \
	exp			text( "^2LOCKED ("+tableLookup(CHARACTER_TABLE, 0, itemID, 2)+")" ) \
	textfont	UI_FONT_NORMAL \
	textalign	ITEM_ALIGN_RIGHT \
	textscale	0.2 \
	decoration \
} 


/*
#define STATTODVAR_SPRAY execNow "statGetInDvar 979 drui_spray"
#define STATTODVAR_CHARACTER execNow "statGetInDvar 980 drui_character"
#define STATTODVAR_WEAPON execNow "statGetInDvar 981 drui_weapon"

#define STATS_UPDATE \
	STATTODVAR_SPRAY; \
	STATTODVAR_CHARACTER; \
	STATTODVAR_WEAPON;*/