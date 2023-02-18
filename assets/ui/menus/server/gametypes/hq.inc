CREATESERVER_BUTTON_VIS(	11, "@MPUI_RULES_TIME_LIMIT",
	"scr_koth_timelimit",
	{
		"@MPUI_RULES_UNLIMITED" 0 "@MPUI_RULES_10MINUTES" 10 "@MPUI_RULES_15MINUTES" 15 "@MPUI_RULES_20MINUTES" 20 "@MPUI_RULES_30MINUTES" 30
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "koth") ;
)

CREATESERVER_BUTTON_VIS(	12, "@MPUI_RULES_SCORE_LIMIT",
	"scr_koth_scorelimit",
	{
		"@MPUI_RULES_UNLIMITED" 0 "@MPUI_RULES_250POINTS" 250 "@MPUI_RULES_500POINTS" 500  "@MPUI_RULES_750POINTS" 750 "@MPUI_RULES_1000POINTS" 1000 "@MPUI_RULES_1500POINTS" 1500
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "koth");
)

CREATESERVER_BUTTON_VIS(	27, "@MPUI_RULES_HQ_HOLD_TIME",
	"koth_autodestroytime",
	{
		"@MPUI_RULES_UNLIMITED" 0 "@MPUI_RULES_30SECONDS" 30 "@MPUI_RULES_45SECONDS" 45  "@MPUI_RULES_1MINUTE" 60 "@MPUI_RULES_1_5MINUTES" 90 "@MPUI_RULES_2MINUTES" 120
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "koth");
)

CREATESERVER_BUTTON_VIS(28, "@MPUI_RULES_HQ_RESPAWN_DELAY",
	"koth_spawntime",
	{
		"@MPUI_RULES_INSTANT" 0 "@MPUI_RULES_15SECONDS" 15 "@MPUI_RULES_30SECONDS" 30  "@MPUI_RULES_1MINUTE" 60
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "koth");
)

CREATESERVER_BUTTON_VIS(29, "@MPUI_RULES_CLASSIC_HQ",
	"koth_kothmode",
	{
		"@MENU_DISABLED" 1 "@MENU_ENABLED" 0
	},
	play "mouse_click",
	when(dvarstring(ui_netGametypeName) == "koth");
)
