﻿private["_l0","_l1"];_l0=objNull;diag_log"Running""kh_actions"".";_l2=5;_l3=0.002;while{true}do{if(!isNull player)then{private["_l4","_l5","_l6"];_l4=vehicle player;_l6=(count((position _l4)nearObjects["Land_A_FuelStation_Feed",_l2]));_l5=_l6>0;if(_l0!=_l4)then{if(!isNull _l0)then{_l0 removeAction _l1;_l0=objNull;};if(_l4!=player && _l5 &&!(_l4 isKindof"Bicycle")&&!(_l4 isKindof"Air"))then{_l0=_l4;_l1=_l0 addAction[("<t color=""#FFBF00"">"+("Refuel(Unpowered)")+"</t>"),"germandayz\refuel\vehicle_refuel.sqf",[_l3],-1,false,true,"","vehicle _this==_target && local _target"];};};if(!_l5)then{_l0 removeAction _l1;_l0=objNull;};};sleep 2;}