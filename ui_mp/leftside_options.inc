/*
#ifndef PC_IN_GAME
	
#endif
*/

// PREPROC_SHADER_DRAW( -120 0 880 480, 0 0, "white", 0 0 0 0.75, 0, 1, 0 0 0 0 )

//PREPROC_SHADER_DRAW( 0 0 640 480, 0 0, "white", 0 0 0 0.75, 0, 1, 0 0 0 0 )
//PREPROC_SHADER_DRAW( ORIGIN_OPTIONS_FRAME 100 480, 0 0, "gradient_fadein", 0 0 0 0.1, 0, 1, 0 0 0 0 )
//PREPROC_SHADER_DRAW( ORIGIN_OPTIONS_FRAME 600 480, 100 0, "gradient_fadein", 0 0 0 0.5, 0, 1, 0 0 0 0 )

#undef BACK_OPEN
#define BACK_OPEN exec "wait";
CHOICE_MENU_TITLE( "@MENU_OPTIONS" )

#undef CHOICE_X_START
#define CHOICE_X_START		-324

#undef CHOICE_Y_START
#define CHOICE_Y_START		70

#undef CHOICE_HORIZONTAL_ALIGN
#define CHOICE_HORIZONTAL_ALIGN HORIZONTAL_ALIGN_CENTER

#undef CHOICE_VERTICAL_ALIGN
#define CHOICE_VERTICAL_ALIGN VERTICAL_ALIGN_TOP

//CHOICE_SECTION_TITLE( 1, "@MENU_SYSTEM" )
CHOICE_BUTTON_VIS( 2, "@MENU_GRAPHICS", LOCAL_CLOSE_ALL open options_graphics, when( ( !dvarint( sv_running ) || dvarInt( ui_allow_graphic_change ) ) && dvarInt( arcademode ) == 0 ); )
CHOICE_DBUTTON_VIS( 2, "@MENU_GRAPHICS", when( ( dvarint( sv_running ) && dvarInt(ui_allow_graphic_change)==0 ) || dvarBool( arcademode ) ); )
CHOICE_BUTTON_VIS( 3, "@MENU_TEXTURE_SETTINGS", LOCAL_CLOSE_ALL  open options_graphics_texture, when( ( !dvarint( sv_running ) || dvarInt( ui_allow_graphic_change ) ) && dvarInt( arcademode ) == 0 ); )
CHOICE_DBUTTON_VIS( 3, "@MENU_TEXTURE_SETTINGS", when( ( dvarint( sv_running ) && dvarInt(ui_allow_graphic_change)==0 ) || dvarBool( arcademode ) ); )
CHOICE_BUTTON( 4, "@MENU_SOUND", LOCAL_CLOSE_ALL open options_sound )
CHOICE_BUTTON_VIS( 5, "@MENU_VOICECHAT", LOCAL_CLOSE_ALL open options_voice, when( dvarint( ui_multiplayer ) ) )
CHOICE_DBUTTON_VIS( 5, "@MENU_VOICECHAT", when( !dvarint( ui_multiplayer ) ); )
CHOICE_BUTTON( 6, "@MENU_GAME_OPTIONS", LOCAL_CLOSE_ALL open options_game )

CHOICE_BUTTON_VIS( 7, "@MENU_CHEATS_LOWCASE", open menu_special_features; close self;, when( dvarBool( sv_running ) && !dvarBool(ui_multiplayer) && !dvarBool( arcademode ) && !dvarBool( arcademode_full ) ); )
CHOICE_BUTTON_VIS( 7, "@MENU_MULTIPLAYER_OPTIONS", LOCAL_CLOSE_ALL open options_multi, when( dvarint( ui_multiplayer ) ) )
CHOICE_DBUTTON_VIS( 7, "@MENU_CHEATS_LOWCASE", when( ( !dvarBool( sv_running ) || dvarBool( arcademode ) || dvarBool( arcademode_full ) ) && !dvarBool(ui_multiplayer) ); )

// ---


#undef TEXTSIZE_BUTTON_PC
#define TEXTSIZE_BUTTON_PC	0.33

#undef CHOICE_SIZE_Y
#define CHOICE_SIZE_Y 		20

#undef	CHOICE_SIZE_X
#define CHOICE_SIZE_X		180

#undef  SECTION_X_OFFSET
#define SECTION_X_OFFSET 	60
// ---