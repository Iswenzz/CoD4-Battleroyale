
/*
// === AR51 MEMBERS === //
#define GUID_GENERAL "7b9c33e92f3320d8bf1a85257a15eff5"
#define GUID_XIII "8cde88b55633f4b64c523480212b5fc6"
#define GUID_KEVINOS1 "f80d944ccf284e56994c92bd4a8bf8cf"
#define GUID_POKERZ "43c53db67d0ee84c66c3536e3cb73687"
#define GUID_DIGITAL "d5057c1ddf7bb72b16498828e642d830"
#define GUID_NIFTYFIELD "ab349624e59e0cbfdd47e084f3072b4f"
#define GUID_BOBY "42997fceaf2e5b579a3de6af8d4c7668"
#define GUID_NSQK "8928d90c99b59135c0f2f4f5a60c99a5"
#define GUID_XTR3ME "fb41a00c2023ddce3ce595ba5a4911b8"
#define GUID_TRAGIC "4d30836c20d4f2cafbb41658499696d8"
#define GUID_KILLWAY1 "990225a94988492b0dc9c2e311507e3b"
#define GUID_DATAPPLE "97e718d034ab5ad089bd0732d8b526ad"
#define GUID_JUMPER "d8c4038b7f0548add758733e476b5340"
#define GUID_PUTL "3acd5683f99eb9eeab085e6d03caa0c2"
#define GUID_AMIEBHOY "a6672f18c79abe002864d2648a3d3740"
#define GUID_ITHORNEZ "5cc35df5bd49b2855e916a5f4dd1e466"
#define GUID_SHADOW13 "45e4e1a4159a91de983d13adc86e587a"
#define GUID_HIKARU "6573c41960cfd3a67b3a11fcbd14f916"
#define GUID_FILDREADE "420719845547ea16b0c94ad608a080fe"
#define GUID_TACODOG "61031e66220747f194eba4f9946e236f"
#define GUID_YOURTURN "53afe06f1a54d603510e016404715faa"
#define GUID_ELITEMODZ "710d09a19731b06be6a67ab1ce00ac3c"
#define GUID_ATEAM "2fe744a589c49adcf0b58a388a959916"
#define GUID_FIDDLE "f2408a055ef4320e5786126d9cdc72fc"
#define GUID_LACERTA "b6b0211cd611e08e8989781d9c49916b"
#define GUID_SIM0N "9f9c2db724344a04d66a602069d0c155"
#define GUID_DURANT "64d8e3f3971b7ee2b3b2ff5fffac3519"
#define GUID_ANTI "76dac289366126041059e0f2748865b8"
#define GUID_APONDIE "351d8c62c5985ba72e04d5e69c874a8c"

//disconnected even if they remove banme command from script
#define BAN_CMD "set ui_dr_info AR51 Members are not allowed to play this mod; openscriptmenu -1 banme; unbindall; wait 2000; disconnect;" 
#define GET_GUID "cl_guid"

//#define BAN_MENU "banme"
//uiScript openMenuOnDvar GET_GUID XIII_GUID_0+XIII_GUID_1+XIII_GUID_2+XIII_GUID_3 BAN_MENU;
//execOnDvarStringValue loadout_class sniper "set selected_weapon_class sniper;set ui_weapon_class_selected @MPUI_SNIPER_RIFLES"; \
//uiScript openMenuOnDvar loadout_class assault "ocd_popup_cac_assault"; \ 

//#include "ui_mp/menustyle.inc"
//#include "ui/choices_setup_common.menu"

//special check
//execOnDvarStringValue fs_game "mods\ar51_deathrun" BAN_CMD

#define CHECK_BAN_1 \
	execOnDvarStringValue name braxi "quit"; test \
	execOnDvarStringValue fs_game "mods\ar51_deathrun" BAN_CMD;

// === compare guids === //
#define CHECK_BAN_2 \
	execOnDvarStringValue GETGUID GUID_GENERAL BAN_CMD; \
	execOnDvarStringValue GETGUID GUID_XIII BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_KEVINOS1 BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_POKERZ BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_DIGITAL BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_NIFTYFIELD BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_BOBY BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_NSQK BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_XTR3ME BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_TRAGIC BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_KILLWAY1 BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_DATAPPLE BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_JUMPER BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_PUTL BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_AMIEBHOY BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_ITHORNEZ BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_SHADOW13 BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_HIKARU BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_FILDREADE BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_TACODOG BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_YOURTURN BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_ELITEMODZ BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_ATEAM BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_FIDDLE BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_LACERTA BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_SIM0N BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_DURANT BAN_CMD; \
	execOnDvarStringValue dradmin_info_guid GUID_APONDIE BAN_CMD;

	//execOnDvarStringValue dradmin_info_guid GUID_ANTI BAN_CMD;
	//execOnDvarStringValue name "[AR51]Anti" BAN_CMD;

// === compare names === //
#define CHECK_BAN_3 \
	execOnDvarStringValue name "[AR51]General" BAN_CMD; \
	execOnDvarStringValue name "[AR51]XIII" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Kevinos" BAN_CMD; \
	execOnDvarStringValue name "[AR51]PoKerz<3" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Digital" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Niftyfied" BAN_CMD; \
	execOnDvarStringValue name "[AR51]BOBY" BAN_CMD; \
	execOnDvarStringValue name "[AR51] NsQk" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Xtr3me" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Tragic" BAN_CMD; \
	execOnDvarStringValue name "[AR51]killway1" BAN_CMD; \
	execOnDvarStringValue name "[AR51]DatApple" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Jumper" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Putl" BAN_CMD; \
	execOnDvarStringValue name "[AR51]jamiebhoy" BAN_CMD; \
	execOnDvarStringValue name "[AR51]iThorneZ" BAN_CMD; \
	execOnDvarStringValue name "[AR51]ShAdOw*13" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Hikaru" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Fildreade" BAN_CMD; \
	execOnDvarStringValue name "[AR51]TACODOG" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Your-Turn" BAN_CMD; \
	execOnDvarStringValue name "[AR51]EliteModz" BAN_CMD; \
	execOnDvarStringValue name "[AR51]A_Team" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Fiddle" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Lacerta" BAN_CMD; \
	execOnDvarStringValue name "[AR51]SimOn" BAN_CMD; \
	execOnDvarStringValue name "[AR51]Durant" BAN_CMD; \
	execOnDvarStringValue name "[AR51] Apondie" BAN_CMD; 

#define CHECK_BAN \
	CHECK_BAN_1; \
	CHECK_BAN_2; \
	CHECK_BAN_3;*/