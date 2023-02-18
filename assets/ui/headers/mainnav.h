#define MAINNAV_X_POS           0
#define MAINNAV_Y_POS           0
#define MAINNAV_WIDTH           640
#define MAINNAV_HEIGHT          25

#define MAINNAV_HORZ_ALIGN      HORIZONTAL_ALIGN_FULLSCREEN
#define MAINNAV_VERT_ALIGN      VERTICAL_ALIGN_SUBTOP

#define MAINNAV_COLOR          	0 0 0 0.3

#define MAINNAV_RECT            MAINNAV_X_POS MAINNAV_Y_POS MAINNAV_WIDTH MAINNAV_HEIGHT MAINNAV_HORZ_ALIGN MAINNAV_VERT_ALIGN

#define MAINNAV_SEPARATOR_X           MAINNAV_X_POS
#define MAINNAV_SEPARATOR_Y           MAINNAV_Y_POS
#define MAINNAV_SEPARATOR_WIDTH       MAINNAV_WIDTH
#define MAINNAV_SEPARATOR_HEIGHT      1

#define MAINNAV_SEPARATOR_HORZ_ALIGN  MAINNAV_HORZ_ALIGN
#define MAINNAV_SEPARATOR_VERT_ALIGN  MAINNAV_VERT_ALIGN

#define MAINNAV_SEPARATOR_ORIGIN      0 MAINNAV_HEIGHT
#define MAINNAV_SEPARATOR_COLOR       1 1 1 0.13

#define MAINNAV_SEPARATOR_RECT        MAINNAV_SEPARATOR_X MAINNAV_SEPARATOR_Y MAINNAV_SEPARATOR_WIDTH MAINNAV_SEPARATOR_HEIGHT MAINNAV_HORZ_ALIGN MAINNAV_VERT_ALIGN

#define SUBNAV_X_POS            MAINNAV_X_POS
#define SUBNAV_Y_POS            MAINNAV_Y_POS
#define SUBNAV_WIDTH 		    MAINNAV_WIDTH
#define SUBNAV_HEIGHT 		    MAINNAV_HEIGHT

#define SUBNAV_HORZ_ALIGN       MAINNAV_HORZ_ALIGN
#define SUBNAV_VERT_ALIGN       MAINNAV_VERT_ALIGN

#define SUBNAV_ORIGIN           0 0
#define SUBNAV_COLOR            1 1 1 0.04

#define SUBNAV_MENU_RECT        SUBNAV_X_POS (SUBNAV_Y_POS + SUBNAV_HEIGHT + MAINNAV_SEPARATOR_HEIGHT) SUBNAV_WIDTH SUBNAV_HEIGHT
#define SUBNAV_ITEM_RECT        0 0 SUBNAV_WIDTH SUBNAV_HEIGHT SUBNAV_HORZ_ALIGN SUBNAV_VERT_ALIGN

#define NAV_MENU_FULLSCREEN_RECT                RECT_MENU_CENTER_W_TOP_H(0, (MAINNAV_HEIGHT + MAINNAV_SEPARATOR_HEIGHT), 640, 480)
#define NAV_MENU_FULLSCREEN_RECT_SERVERBROWSER  RECT_MENU_CENTER_W_TOP_H(0, (MAINNAV_HEIGHT + MAINNAV_SEPARATOR_HEIGHT), 640, 480)

#define CLOSE_ALL				CLOSE_ALL_SUBNAVS; \
								CLOSE_ALL_OPTIONS; \
								CLOSE_ALL_CONTROLS; \
								CLOSE_SERVERBROWSER

#define CLOSE_ALL_SUBNAVS       close main_controls; \
								close main_options

#define CLOSE_SERVERBROWSER     close pc_join_unranked

#define CLOSE_CREATE_SERVER     close createserver; \
								close createserver_advanced

#define CLOSE_ALL_CONTROLS      close options_look; \
								close options_move; \
								close options_shoot; \
								close options_misc; \
								close options_mod

#define CLOSE_ALL_CONTROLS_EX_MULTI     close options_move; \
										close options_shoot; \
										close options_misc; \
										close options_look

#define CLOSE_ALL_CONTROLS_EX_LOOK      close options_move; \
										close options_shoot; \
										close options_misc; \
										close options_mod

#define CLOSE_ALL_CONTROLS_EX_MOVE      close options_look; \
										close options_shoot; \
										close options_misc; \
										close options_mod

#define CLOSE_ALL_CONTROLS_EX_SHOOT     close options_look; \
										close options_move; \
										close options_misc; \
										close options_mod

#define CLOSE_ALL_CONTROLS_EX_INTERACT  close options_look; \
										close options_move; \
										close options_shoot; \
										close options_mod

#define CLOSE_ALL_OPTIONS       close options_graphics; \
								close options_graphics_texture; \
								close options_sound; \
								close options_voice; \
								close options_game; \
								close options_view; \
								close muteplayer

#define CLOSE_ALL_OPTIONS_EX_GRAPHICS       close options_graphics_texture; \
											close options_sound; \
											close options_voice; \
											close options_game; \
											close options_view; \
											close muteplayer; \
											close sr_settings

#define CLOSE_ALL_OPTIONS_EX_GRAPHICS_TEX   close options_graphics; \
											close options_sound; \
											close options_voice; \
											close options_game; \
											close options_view; \
											close muteplayer; \
											close sr_settings

#define CLOSE_ALL_OPTIONS_EX_SOUND          close options_graphics; \
											close options_graphics_texture; \
											close options_voice; \
											close options_game; \
											close options_view; \
											close muteplayer; \
											close sr_settings

#define CLOSE_ALL_OPTIONS_EX_VOICE          close options_graphics; \
											close options_graphics_texture; \
											close options_sound; \
											close options_game; \
											close options_view; \
											close muteplayer; \
											close sr_settings

#define CLOSE_ALL_OPTIONS_EX_MUTE			close options_graphics; \
											close options_graphics_texture; \
											close options_sound; \
											close options_game; \
											close options_view; \
											close options_voice; \
											close sr_settings

#define CLOSE_ALL_OPTIONS_EX_GAME           close options_graphics; \
											close options_graphics_texture; \
											close options_sound; \
											close options_voice; \
											close options_view; \
											close muteplayer; \
											close sr_settings

#define CLOSE_ALL_OPTIONS_EX_VIEW           close options_graphics; \
											close options_graphics_texture; \
											close options_sound; \
											close options_voice; \
											close options_game; \
											close muteplayer; \
											close sr_settings

#define CLOSE_MODS              close mods_menu

#define CLOSE_PROFILE           close player_profile
