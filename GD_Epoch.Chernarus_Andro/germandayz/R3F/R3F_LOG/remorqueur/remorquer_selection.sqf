﻿if(R3F_LOG_mutex_local_verrou)then{player globalChat STR_R3F_LOG_mutex_action_en_cours;}else{R3F_LOG_mutex_local_verrou=true;private["_l0","_l1"];_l0=R3F_LOG_objet_selectionne;_l1=_this select 0;if(!(isNull _l0)&&(alive _l0)&&!(_l0 getVariable"R3F_LOG_disabled"))then{if(isNull(_l0 getVariable"R3F_LOG_beingtransported")&&(isNull(_l0 getVariable"R3F_LOG_beingmoved")||(!alive(_l0 getVariable"R3F_LOG_beingmoved"))))then{if(_l0 distance _l1<=15)then{_l2=_l1;_l3=1;while{!isNull(_l2 getVariable["R3F_LOG_beingtransported",objNull])}do{_l3=_l3+1;_l2=_l2 getVariable["R3F_LOG_beingtransported",objNull];};_l2=_l0;_l4=1;while{!isNull(_l2 getVariable["R3F_LOG_remorque",objNull])}do{_l4=_l4+1;_l2=_l2 getVariable["R3F_LOG_remorque",objNull];};if(_l3+_l4<=2)then{_l1 setVariable["R3F_LOG_remorque",_l0,true];_l0 setVariable["R3F_LOG_beingtransported",_l1,true];player attachTo[_l1,[(boundingBox _l1 select 1 select 0),(boundingBox _l1 select 0 select 1)+1,(boundingBox _l1 select 0 select 2)-(boundingBox player select 0 select 2)]];player setDir 270;player setPos(getPos player);player playMove"AinvPknlMstpSlayWrflDnon_medic";sleep 2;_l0 attachTo[_l1,[0,(boundingBox _l1 select 0 select 1)+(boundingBox _l0 select 0 select 1)+0,(boundingBox _l1 select 0 select 2)-(boundingBox _l0 select 0 select 2)]];R3F_LOG_objet_selectionne=objNull;detach player;if(_l0 isKindOf"StaticWeapon")then{private["_l5"];_l5=((_l0 weaponDirection(weapons _l0 select 0))select 0)atan2((_l0 weaponDirection(weapons _l0 select 0))select 1);if!(_l0 isKindOf"D30_Base")then{_l5=_l5+180;};R3F_ARTY_AND_LOG_PUBVAR_setDir=[_l0,(getDir _l0)-_l5];if(isServer)then{["R3F_ARTY_AND_LOG_PUBVAR_setDir",R3F_ARTY_AND_LOG_PUBVAR_setDir]spawn R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;}else{publicVariable"R3F_ARTY_AND_LOG_PUBVAR_setDir";};};sleep 5;}else{player globalChat"You can't tow more than one vehicle.";};}else{player globalChat format[Tow_settings_action_remorquer_selection_trop_loin,getText(configFile>>"CfgVehicles">>(typeOf _l0)>>"displayName")];};}else{player globalChat format[Tow_settings_action_remorquer_selection_objet_transporte,getText(configFile>>"CfgVehicles">>(typeOf _l0)>>"displayName")];};};R3F_LOG_mutex_local_verrou=false;};