﻿private["_l0","_l1","_l2","_l3","_l4","_l5","_l6","_l7","_l8","_l9","_l10","_l11","_l12","_l13","_l14","_l15","_l16","_l17","_l18","_l19","_l20","_l21","_l22","_l23","_l24","_l25","_l26","_l27","_l28","_l29","_l30","_l31","_l32","_l33","_l34","_l35","_l36","_l37"];if(TradeInprogress)exitWith{cutText["Upgrade already in progress.","PLAIN DOWN"];};TradeInprogress=true;player removeAction s_player_upgrade_build;s_player_upgrade_build=1;_l33=30;_l34="Plot Pole";_l35=nearestObjects[(vehicle player),["Plastic_Pole_EP1_DZ"],_l33];_l36=[];{if(alive _x)then{_l36 set[(count _l36),_x];};}foreach _l35;_l37=count(_l36);_l29=false;if(_l37==0)then{_l29=true;}else{_l31=_l36 select 0;_l32=_l31 getVariable["CharacterID","0"];if(dayz_playerUID==_l32)then{_l29=true;}else{_l30=player getVariable["friendlyTo",[]];{if((_l32==getPlayerUID _x)&&(isPlayer _x))then{_l32=_x getVariable"CharacterID"};}forEach playableunits;if(_l32 in _l30)then{_l29=true;};};};if(!_l29)exitWith{TradeInprogress=false;cutText[format["Unable to upgrade %1 nearby.",_l34,_l33],"PLAIN DOWN"];};_l21=_this select 3;_l15=_l21 getVariable["ObjectID","0"];_l16=_l21 getVariable["ObjectUID","0"];if(_l15=="0"&& _l16=="0")exitWith{TradeInprogress=false;s_player_upgrade_build=-1;cutText["Not setup yet.","PLAIN DOWN"];};_l2=typeOf _l21;_l4=getText(configFile>>"CfgVehicles">>_l2>>"displayName");_l22=getArray(configFile>>"CfgVehicles">>_l2>>"upgradeBuilding");if((count _l22)>0)then{_l19=_l22 select 0;_l23=0;if(isNumber(configFile>>"CfgVehicles">>_l19>>"lockable"))then{_l23=getNumber(configFile>>"CfgVehicles">>_l19>>"lockable");};_l20=_l22 select 1;_l8=0;_l3="";_l5=true;{_l9=_x select 0;_l10=_x select 1;_l11={(_x==_l9)||(configName(inheritsFrom(configFile>>"cfgMagazines">>_x))==_l9)}count magazines player;if(_l11<_l10)exitWith{_l3=_l9;_l8=(_l10-_l11);_l5=false;};}forEach _l20;if(_l5)then{player playActionNow"Medic";[player,20,true,(getPosATL player)]spawn player_alertZombies;_l17=[];_l13=0;_l14=0;{_l12=0;_l9=_x select 0;_l10=_x select 1;_l14=_l14+_l10;{if((_l12<_l10)&&((_x==_l9)|| configName(inheritsFrom(configFile>>"cfgMagazines">>_x))==_l9))then{_l6=([player,_x]call BIS_fnc_invRemove);_l12=_l12+_l6;_l13=_l13+_l6;if(_l6>=1)then{_l17 set[count _l17,_x];};};}forEach magazines player;}forEach _l20;if(_l14==_l13)then{_l0=_l21 getVariable["OEMPos",(getposATL _l21)];_l1=getDir _l21;_l28=_l21 getVariable["CharacterID","0"];_l2=_l19;_l7=createVehicle[_l2,[0,0,0],[],0,"CAN_COLLIDE"];_l7 setDir _l1;_l7 setPosATL _l0;if(_l2 in["Plastic_Pole_EP1_DZ","Land_HBarrier3_DZ","Land_HBarrier1_DZ","MetalPanel_DZ","MetalFloor_DZ","CinderWallDoorSmallLocked_DZ","CinderWallDoorLocked_DZ"])then{_l7 addEventHandler["HandleDamage",{false}];_l7 enableSimulation false;};if(_l23==3)then{_l24=floor(random 10);_l25=floor(random 10);_l26=floor(random 10);_l27=format["%1%2%3",_l24,_l25,_l26];_l28=_l27;cutText[format["You have upgraded %2.Combination is %1",_l27,_l4],"PLAIN DOWN",5];}else{cutText[format["You have upgraded %1.",_l4],"PLAIN DOWN",5];};PVDZE_obj_Swap=[_l28,_l7,[_l1,_l0],_l2,_l21,_l15,_l16];publicVariableServer"PVDZE_obj_Swap";player reveal _l7;}else{{player addMagazine _x;}forEach _l17;cutText[format["Missing Parts after first check Item: %1/%2",_l13,_l14],"PLAIN DOWN"];};}else{_l18=getText(configFile>>"CfgMagazines">>_l3>>"displayName");cutText[format["Missing %1 more of %2",_l8,_l18],"PLAIN DOWN"];};}else{cutText["No upgrades available","PLAIN DOWN"];};TradeInprogress=false;s_player_upgrade_build=-1;