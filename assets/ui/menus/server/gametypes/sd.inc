CREATESERVER_BUTTON_VIS(11, "@MPUI_RULES_ROUND_LENGTH",
	"scr_sd_timelimit",
	{
		"@MPUI_RULES_UNLIMITED" 0 "@MPUI_RULES_2_5MINUTES" 2.5 "@MPUI_RULES_3MINUTES" 3 "@MPUI_RULES_5MINUTES" 5 "@MPUI_RULES_8MINUTES" 8 "@MPUI_RULES_10MINUTES" 10
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "sd");
)

CREATESERVER_BUTTON_VIS(12, "@MPUI_RULES_SCORE_LIMIT",
	"scr_sd_scorelimit",
	{
		"@MPUI_RULES_UNLIMITED" 0 "@MPUI_RULES_1POINT" 1 "@MPUI_RULES_4POINTS" 4 "@MPUI_RULES_8POINTS" 8 "@MPUI_RULES_12POINTS" 12 "@MPUI_RULES_24POINTS" 24
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "sd");
)

CREATESERVER_BUTTON_VIS(13, "@MPUI_RULES_ROUND_SWITCH",
	"scr_sd_roundswitch",
	{
		"@MPUI_RULES_NEVER" 0 "@MPUI_RULES_EVERY_ROUND" 1 "@MPUI_RULES_EVERY_2ROUNDS" 2 "@MPUI_RULES_EVERY_3ROUNDS" 3 "@MPUI_RULES_EVERY_4ROUNDS" 4
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "sd");
)

CREATESERVER_BUTTON_VIS(27, "@MPUI_RULES_PLANT_TIME",
	"scr_sd_planttime",
	{
		"@MPUI_RULES_1SECOND" 1 "@MPUI_RULES_2_5SECONDS" 2.5 "@MPUI_RULES_5SECONDS" 5 "@MPUI_RULES_7_5SECONDS" 7.5 "@MPUI_RULES_10SECONDS" 10
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "sd");
)

CREATESERVER_BUTTON_VIS(28, "@MPUI_RULES_DEFUSE_TIME",
	"scr_sd_defusetime",
	{
		"@MPUI_RULES_1SECOND" 1 "@MPUI_RULES_2_5SECONDS" 2.5 "@MPUI_RULES_5SECONDS" 5 "@MPUI_RULES_7_5SECONDS" 7.5 "@MPUI_RULES_10SECONDS" 10
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "sd");
)

CREATESERVER_BUTTON_VIS(29, "@MPUI_RULES_BOMB_TIMER",
	"scr_sd_bombtimer",
	{
		"@MPUI_RULES_5SECONDS" 5 "@MPUI_RULES_15SECONDS" 15 "@MPUI_RULES_30SECONDS" 30 "@MPUI_RULES_45SECONDS" 45 "@MPUI_RULES_1MINUTE" 60
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "sd");
)

CREATESERVER_BUTTON_VIS(30, "@MPUI_RULES_MULTI_BOMB",
	"scr_sd_multibomb",
	{
		"@MENU_DISABLED" 0 "@MENU_ENABLED" 1
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "sd");
)
