﻿private["_l0","_l1","_l2","_l3","_l4","_l5","_l6","_l7","_l8","_l9","_l10","_l11","_l12","_l13","_l14","_l15","_l16","_l17","_l18","_l19","_l20","_l21","_l22","_l23","_l24","_l25","_l26","_l27","_l28","_l29","_position","_l30","_l31","_l32","_l33","_l34","_l35","_l36","_l37","_l38","_l39","_l40","_l41","_l42","_l43","_l44","_l45","_l46","_l47","_l48","_l49","_l50","_l51","_l52","_l53","_l54","_l55","_l56","_l57","_l58"];if(TradeInprogress)exitWith{cutText["\n\nBuilding already in progress.","PLAIN DOWN"];};TradeInprogress=true;_l17=(getNumber(configFile>>"CfgMovesMaleSdr">>"States">>(animationState player)>>"onLadder"))==1;_l18=dayz_isSwimming;_l7=false;_l8="";_l31=false;DZE_Q=false;DZE_Z=false;DZE_Q_alt=false;DZE_Z_alt=false;DZE_Q_ctrl=false;DZE_Z_ctrl=false;DZE_5=false;DZE_4=false;DZE_6=false;DZE_cancelBuilding=false;call gear_ui_init;closeDialog 1;if(_l18)exitWith{TradeInprogress=false;cutText[localize"str_player_26","PLAIN DOWN"];};if(_l17)exitWith{TradeInprogress=false;cutText[localize"str_player_21","PLAIN DOWN"];};if(player getVariable["combattimeout",0]>=time)exitWith{TradeInprogress=false;cutText["Cannot build while in combat.","PLAIN DOWN"];};_l3=_this;_l53=false;_l37=3;_l8="";_l58=getArray(configFile>>"CfgMagazines">>_l3>>"ItemActions">>"Build">>"neednearby");{_l55=_x select 0;_l37=_x select 1;if("fire"in _l55)then{_l54={inflamed _x}count(position player nearObjects _l37);if(_l54==0)then{_l53=true;_l8="fire";};};if("workshop"in _l55)then{_l54=count(nearestObjects[player,["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"],_l37]);if(_l54==0)then{_l53=true;_l8="workshop";};};if("fueltank"in _l55)then{_l54=count(nearestObjects[player,dayz_fuelsources,_l37]);if(_l54==0)then{_l53=true;_l8="fuel tank";};};}forEach _l58;if(_l53)exitWith{cutText[format["\n\nThis building needs a %1 within %2 meters",_l8,_l37],"PLAIN DOWN"];TradeInprogress=false;};_l2=getText(configFile>>"CfgMagazines">>_l3>>"ItemActions">>"Build">>"create");_l38=_l2;_l19=getArray(configFile>>"cfgMagazines">>_this>>"ItemActions">>"Build">>"require");_l20=getText(configFile>>"CfgVehicles">>_l2>>"displayName");_l39=getText(configFile>>"CfgVehicles">>_l2>>"ghostpreview");_l42=0;if(isNumber(configFile>>"CfgVehicles">>_l2>>"lockable"))then{_l42=getNumber(configFile>>"CfgVehicles">>_l2>>"lockable");};_l21=getArray(configFile>>"CfgVehicles">>_l2>>"offset");if((count _l21)<=0)then{_l21=[0,1.5,0];};_l40=(_l2=="Plastic_Pole_EP1_DZ");_l59=(_l2=="WorkBench_DZ");_l60=(_l2=="TentStorage");_l61=(_l2=="TentStorageDomed");_l62=(_l2=="TentStorageDomed2");_l63=(_l2=="LockboxStorageLocked");_l64=(_l2=="Generator_DZ");_l65=(_l2=="Land_Fire_DZ");_l37=30;_l41="Plot Pole";if(_l40)then{_l37=45;};_l35=nearestObjects[(vehicle player),["Plastic_Pole_EP1_DZ"],_l37];_l36=[];{if(alive _x)then{_l36 set[(count _l36),_x];};}foreach _l35;_l22=count(_l36);if(_l40 and _l22>0)exitWith{TradeInprogress=false;cutText["Cannot build plot pole within 45m of an existing plot.","PLAIN DOWN"];};if(_l22==0)then{if(_l40 or _l59 or _l60 or _l61 or _l62 or _l64 or _l63 or _l65)then{_l31=true;};}else{_l33=_l36 select 0;_l34=_l33 getVariable["CharacterID","0"];if(dayz_playerUID==_l34)then{_l31=true;}else{{if((_l34==getPlayerUID _x)&&(isPlayer _x))then{_l34=_x getVariable"CharacterID"};}forEach playableunits;_l32=player getVariable["friendlyTo",[]];diag_log format["DEBUG BUILD:(%1 IN %2)",_l34,_l32];if(_l34 in _l32)then{_l31=true;};};};if(!_l31)exitWith{TradeInprogress=false;cutText[format["You need a %1 nearby!",_l41],"PLAIN DOWN"];};_l5="";_l4=true;{_l6=_x in weapons player;if(!_l6)exitWith{_l4=false;_l5=_x;}}forEach _l19;_l15=_this in magazines player;if(!_l15)exitWith{TradeInprogress=false;cutText[format[(localize"str_player_31"),_l20,"build"],"PLAIN DOWN"];};if(!_l4)exitWith{TradeInprogress=false;cutText[format["Missing tool %1",_l5],"PLAIN DOWN"];};if(_l4)then{_l0=[0,0,0];_l23=true;_l24=getPosATL player;_l1=getDir player;if(_l39=="")then{_l30=createVehicle[_l2,_l0,[],0,"CAN_COLLIDE"];}else{_l2=_l39;_l30=createVehicle[_l2,_l0,[],0,"CAN_COLLIDE"];};_l30 attachTo[player,_l21];_position=getPosATL _l30;cutText["Planning construction: PgUp=raise,PgDn=lower,Q or E=flip 180,and Space-Bar to build.","PLAIN DOWN"];_l66=60;_l56=0;_l57=0;while{_l23}do{_l43=false;_l52="";_l44=false;if(DZE_Q)then{DZE_Q=false;_l52="up";_l43=true;};if(DZE_Z)then{DZE_Z=false;_l52="down";_l43=true;};if(DZE_Q_alt)then{DZE_Q_alt=false;_l52="up_alt";_l43=true;};if(DZE_Z_alt)then{DZE_Z_alt=false;_l52="down_alt";_l43=true;};if(DZE_Q_ctrl)then{DZE_Q_ctrl=false;_l52="up_ctrl";_l43=true;};if(DZE_Z_ctrl)then{DZE_Z_ctrl=false;_l52="down_ctrl";_l43=true;};if(DZE_4)then{_l44=true;DZE_4=false;_l1=180;};if(DZE_6)then{_l44=true;DZE_6=false;_l1=0;};if(_l44)then{_l30 setDir _l1;_l30 setPosATL _position;diag_log format["DEBUG Rotate BUILDING POS: %1",_position];};if(_l43)then{detach _l30;_position=getPosATL _l30;if(_l52=="up")then{_position set[2,((_position select 2)+0.1)];_l56=_l56+0.1;_l57=_l57-0.1;};if(_l52=="down")then{_position set[2,((_position select 2)-0.1)];_l57=_l57+0.1;_l56=_l56-0.1;};if(_l52=="up_alt")then{_position set[2,((_position select 2)+1)];_l56=_l56+1;_l57=_l57-1;};if(_l52=="down_alt")then{_position set[2,((_position select 2)-1)];_l57=_l57+1;_l56=_l56-1;};if(_l52=="up_ctrl")then{_position set[2,((_position select 2)+0.01)];_l56=_l56+0.01;_l57=_l57-0.01;};if(_l52=="down_ctrl")then{_position set[2,((_position select 2)-0.01)];_l57=_l57+0.01;_l56=_l56-0.01;};_l30 setDir(getDir _l30);_l30 setPosATL _position;diag_log format["DEBUG Change BUILDING POS: %1",_position];_l30 attachTo[player];};sleep 1;_l25=getPosATL player;if(DZE_5)exitWith{_l23=false;detach _l30;_l1=getDir _l30;_position=getPosATL _l30;diag_log format["DEBUG BUILDING POS: %1",_position];deleteVehicle _l30;};if(_l24 distance _l25>5)exitWith{_l23=false;_l7=true;_l8="Moving too fast.";detach _l30;deleteVehicle _l30;};cutText[format["%1",_l66],"PLAIN DOWN"];if(_l66<=0)exitWith{_l23=false;_l7=true;_l8="Ran out of time to find position.";detach _l30;deleteVehicle _l30;};_l66=_l66-1;if((_l57>5)or(_l56>5))exitWith{_l23=false;_l7=true;_l8="Cannot move up or down more than 5 meters";detach _l30;deleteVehicle _l30;};if(player getVariable["combattimeout",0]>=time)exitWith{_l23=false;_l7=true;_l8="Cannot build while in combat.";detach _l30;deleteVehicle _l30;};if(DZE_cancelBuilding)exitWith{_l23=false;_l7=true;_l8="Cancelled building.";detach _l30;deleteVehicle _l30;};};if(isOnRoad _l0)then{_l7=true;_l8="Cannot build on a road.";};if(!canbuild)then{_l7=true;_l8="Cannot build in a city.";};if(!placevault)then{_l7=true;_l8="Cannot build in a city.";};if(!_l7)then{_l2=_l38;_l16=createVehicle[_l2,_l0,[],0,"CAN_COLLIDE"];_l16 setdir _l1;_l0=_position;_l16 setPosATL _l0;cutText[format["Placing %1,move to cancel.",_l20],"PLAIN DOWN"];_l27=3;if(isNumber(configFile>>"CfgVehicles">>_l2>>"constructioncount"))then{_l27=getNumber(configFile>>"CfgVehicles">>_l2>>"constructioncount");};_l23=true;_l28=false;_l26=0;while{_l23}do{player playActionNow"Medic";_l13=20;_l14="repair";[player,_l14,0,false,_l13]call dayz_zombieSpeak;[player,_l13,true,(getPosATL player)]spawn player_alertZombies;r_interrupt=false;_l11=animationState player;r_doLoop=true;_l9=false;_l10=false;while{r_doLoop}do{_l11=animationState player;_l12=["medic",_l11]call fnc_inString;if(_l12)then{_l9=true;};if(_l9 and!_l12)then{r_doLoop=false;_l10=true;};if(r_interrupt)then{r_doLoop=false;};if(DZE_cancelBuilding)exitWith{r_doLoop=false;};sleep 0.1;};r_doLoop=false;if(!_l10)exitWith{_l23=false;_l28=false;};if(_l10)then{_l26=_l26+1;};cutText[format["Constructing %1 stage %2 of %3,move to cancel.",_l20,_l26,_l27],"PLAIN DOWN"];if(_l26==_l27)exitWith{_l23=false;_l28=true;};};if(_l28)then{_l29=([player,_l3]call BIS_fnc_invRemove);if(_l2 in["Plastic_Pole_EP1_DZ","Land_HBarrier3_DZ","Land_HBarrier1_DZ","MetalPanel_DZ","MetalFloor_DZ","CinderWallDoorSmallLocked_DZ","CinderWallDoorLocked_DZ"])then{_l16 addEventHandler["HandleDamage",{false}];_l16 enableSimulation false;};if(_l29==1)then{cutText[format[localize"str_build_01",_l20],"PLAIN DOWN"];_l16 setVariable["OEMPos",_l0,true];if(_l42>1)then{_l51="";switch(_l42)do{case 2:{_l45=(floor(random 3))+100;_l46=floor(random 10);_l47=floor(random 10);_l49=format["%1%2%3",_l45,_l46,_l47];if(_l45==100)then{_l50="Red";};if(_l45==101)then{_l50="Green";};if(_l45==102)then{_l50="Blue";};_l51=format["%1%2%3",_l50,_l46,_l47];};case 3:{_l45=floor(random 10);_l46=floor(random 10);_l47=floor(random 10);_l49=format["%1%2%3",_l45,_l46,_l47];_l51=_l49;};case 4:{_l45=floor(random 10);_l46=floor(random 10);_l47=floor(random 10);_l48=floor(random 10);_l49=format["%1%2%3%4",_l45,_l46,_l47,_l48];_l51=_l49;};};_l16 setVariable["CharacterID",_l49,true];PVDZE_obj_Publish=[_l49,_l16,[_l1,_l0],_l2];publicVariableServer"PVDZE_obj_Publish";cutText[format["You have setup your %2.Combination is %1",_l51,_l20],"PLAIN DOWN",5];}else{_l16 setVariable["CharacterID",dayz_playerUID,true];if(_l16 isKindOf"Land_Fire")then{_l16 spawn player_fireMonitor;}else{PVDZE_obj_Publish=[dayz_playerUID,_l16,[_l1,_l0],_l2];publicVariableServer"PVDZE_obj_Publish";};};}else{deleteVehicle _l16;cutText["Canceled building.","PLAIN DOWN"];};}else{r_interrupt=false;if(vehicle player==player)then{[objNull,player,rSwitchMove,""]call RE;player playActionNow"stop";};deleteVehicle _l16;cutText["Canceled building.","PLAIN DOWN"];};}else{deleteVehicle _l16;cutText[format["Canceled construction of %1 %2.",_l20,_l8],"PLAIN DOWN"];};};TradeInprogress=false;