﻿player removeAction s_clothes;s_clothes=-1;private["_l0","_l1"];_l0=_this select 3;_l2=typeOf _l0;if(_l2 in["Survivor2_DZ","SurvivorW2_DZ"])then{cutText["The clothing is not interesting for you.","PLAIN DOWN"];};if(_l2 in["Bandit1_DZ","Bandit2_DZ","Soldier_Crew_PMC","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","Priest_DZ","Functionary1_EP1_DZ","GUE_Commander_DZ","Ins_Soldier_GL_DZ","Haris_Press_EP1_DZ","Pilot_EP1_DZ","RU_Policeman_DZ","Soldier_TL_PMC_DZ","Soldier_Sniper_PMC_DZ","Soldier_Bodyguard_AA12_PMC_DZ","Drake_Light_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_CO_DZ","GUE_Soldier_2_DZ"])then{_l2="Skin_"+_l2;_l3=random 1;if(_l3>0.4)then{_l1=[player,_l2]call BIS_fnc_invAdd;}else{_l2="Skin_Survivor2_DZ";_l1=[player,_l2];player removeMagazine"ItemTrashRazor";cutText["As you try to remove the clothes,your razor broke.","PLAIN DOWN"];};if(_l1)then{player playActionNow"PutDown";private["_l4","_l5","_l6"];_l4=_l0 getVariable["bodyName","unknown"];_l5=_l0 getVariable["deathType","unknown"];_l6=localize format["str_death_%1",_l5];_l7="Survivor2_DZ";_position=getPosATL _l0;_l8=getDir _l0;_l9=animationState_body;private["_l10","_l11","_l12","_l13"];_l10=weapons _l0;_l12=primaryWeapon_body;_l13=secondaryWeapon _l0;if(!(_l12 in _l10)&& _l12!="")then{_l10=_l10+[_l12];};if(!(_l13 in _l10)&& _l13!="")then{_l10=_l10+[_l13];};_l11=magazines _l0;private["_l14","_l15","_l16"];dayz_myBackpack=unitBackpack _l0;_l14=(typeOf dayz_myBackpack);if(_l14!="")then{_l15=getWeaponCargo unitBackpack _l0;_l16=getMagazineCargo unitBackpack _l0;};_l17=currentWeapon _l0;_l18=getArray(configFile>>"cfgWeapons">>_l17>>"muzzles");if(count _l18>1)then{_l17=currentMuzzle _l0;};diag_log"Attempting to switch model";diag_log str(_l10);diag_log str(_l11);diag_log(str(_l15));diag_log(str(_l16));_l0 setPosATL dayz_spawnPos;_l19=_l0;_l20=createGroup west;_l21=_l20 createUnit[_l7,position player,[],0,"NONE"];_l21 setPosATL _position;_l21 setDir _l8;{_l21 removeMagazine _x;}forEach magazines _l21;removeAllWeapons _l21;{if(typeName _x=="ARRAY")then{_l21 addMagazine[_x select 0,_x select 1]}else{_l21 addMagazine _x};}forEach _l11;{_l21 addWeapon _x;}forEach _l10;if(str(_l10)!=str(weapons _l21))then{{_l10=_l10-[_x];}forEach(weapons _l21);{_l21 addWeapon _x;}forEach _l10;};if(_l12!=(primaryWeapon _l21))then{_l21 addWeapon _l12;};if(_l13!=(secondaryWeapon _l21)&& _l13!="")then{_l21 addWeapon _l13;};if(!isNil"_l14")then{if(_l14!="")then{_l21 addBackpack _l14;_l22=dayz_myBackpack;dayz_myBackpack=unitBackpack _l21;_l23=[];_l24=[];if(count _l15>0)then{_l23=_l15 select 0;_l24=_l15 select 1;};_l25=0;{dayz_myBackpack addWeaponCargoGlobal[_x,(_l24 select _l25)];_l25=_l25+1;}forEach _l23;_l26=[];_l27=[];if(count _l16>0)then{_l26=_l16 select 0;_l27=_l16 select 1;};_l25=0;{dayz_myBackpack addmagazineCargoGlobal[_x,(_l27 select _l25)];_l25=_l25+1;}forEach _l26;};};diag_log"Taking Clothes.Equipment:";diag_log str(weapons _l21);diag_log str(magazines _l21);diag_log str(getWeaponCargo unitBackpack _l21);diag_log str(getMagazineCargo unitBackpack _l21);removeAllWeapons _l19;{_l19 removeMagazine _x;}forEach magazines _l19;deleteVehicle _l19;_l21 setDamage 1;_l21 setVariable["bodyName",_l4,true];_l21 setVariable["deathType",_l5,true];}else{cutText["You need a free slot to take clothing.","PLAIN DOWN"];};};if(_l2 in["SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ","SurvivorWsequishaD_DZ","SurvivorWsequisha_DZ","SurvivorWpink_DZ","SurvivorW3_DZ","BanditW1_DZ","BanditW2_DZ"])then{_l2="Skin_"+_l2;_l3=random 1;if(_l3>0.4)then{_l1=[player,_l2]call BIS_fnc_invAdd;}else{_l2="Skin_SurvivorW2_DZ";_l1=[player,_l2];player removeMagazine"ItemTrashRazor";cutText["As you try to remove the clothes,your razor broke.","PLAIN DOWN"];};if(_l1)then{player playActionNow"PutDown";private["_l4","_l5","_l6"];_l4=_l0 getVariable["bodyName","unknown"];_l5=_l0 getVariable["deathType","unknown"];_l6=localize format["str_death_%1",_l5];_l7="SurvivorW2_DZ";_position=getPosATL _l0;_l8=getDir _l0;_l9=animationState_body;private["_l10","_l11","_l12","_l13"];_l10=weapons _l0;_l12=primaryWeapon_body;_l13=secondaryWeapon _l0;if(!(_l12 in _l10)&& _l12!="")then{_l10=_l10+[_l12];};if(!(_l13 in _l10)&& _l13!="")then{_l10=_l10+[_l13];};_l11=magazines _l0;private["_l14","_l15","_l16"];dayz_myBackpack=unitBackpack _l0;_l14=(typeOf dayz_myBackpack);if(_l14!="")then{_l15=getWeaponCargo unitBackpack _l0;_l16=getMagazineCargo unitBackpack _l0;};_l17=currentWeapon _l0;_l18=getArray(configFile>>"cfgWeapons">>_l17>>"muzzles");if(count _l18>1)then{_l17=currentMuzzle _l0;};diag_log"Attempting to switch model";diag_log str(_l10);diag_log str(_l11);diag_log(str(_l15));diag_log(str(_l16));_l0 setPosATL dayz_spawnPos;_l19=_l0;_l20=createGroup west;_l21=_l20 createUnit[_l7,position player,[],0,"NONE"];_l21 setPosATL _position;_l21 setDir _l8;{_l21 removeMagazine _x;}forEach magazines _l21;removeAllWeapons _l21;{if(typeName _x=="ARRAY")then{_l21 addMagazine[_x select 0,_x select 1]}else{_l21 addMagazine _x};}forEach _l11;{_l21 addWeapon _x;}forEach _l10;if(str(_l10)!=str(weapons _l21))then{{_l10=_l10-[_x];}forEach(weapons _l21);{_l21 addWeapon _x;}forEach _l10;};if(_l12!=(primaryWeapon _l21))then{_l21 addWeapon _l12;};if(_l13!=(secondaryWeapon _l21)&& _l13!="")then{_l21 addWeapon _l13;};if(!isNil"_l14")then{if(_l14!="")then{_l21 addBackpack _l14;_l22=dayz_myBackpack;dayz_myBackpack=unitBackpack _l21;_l23=[];_l24=[];if(count _l15>0)then{_l23=_l15 select 0;_l24=_l15 select 1;};_l25=0;{dayz_myBackpack addWeaponCargoGlobal[_x,(_l24 select _l25)];_l25=_l25+1;}forEach _l23;_l26=[];_l27=[];if(count _l16>0)then{_l26=_l16 select 0;_l27=_l16 select 1;};_l25=0;{dayz_myBackpack addmagazineCargoGlobal[_x,(_l27 select _l25)];_l25=_l25+1;}forEach _l26;};};diag_log"Taking Clothes.Equipment:";diag_log str(weapons _l21);diag_log str(magazines _l21);diag_log str(getWeaponCargo unitBackpack _l21);diag_log str(getMagazineCargo unitBackpack _l21);removeAllWeapons _l19;{_l19 removeMagazine _x;}forEach magazines _l19;deleteVehicle _l19;_l21 setDamage 1;_l21 setVariable["bodyName",_l4,true];_l21 setVariable["deathType",_l5,true];}else{cutText["You need a free slot to take clothing.","PLAIN DOWN"];};};