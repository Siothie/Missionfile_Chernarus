﻿private["_l0","_l1","_l2","_l3","_l4","_l5","_l6","_l7","_l8","_l9","_l10","_l11","_l12","_l13","_l14"];_l0=3000;_l11=60;_l9=600;_l2=50;_l7=true;_l6=1000;_l1=false;_l5=50;_l10=time-lastBloodbag;_l12=time;_l14=player getVariable["combattimeout",0];_l13=if(_l14>=diag_tickTime)then{true}else{false};if(_l10<_l9)exitWith{cutText[format["You may not use Self Bloodbag this soon please wait %1!",(_l10-_l9)],"PLAIN DOWN"];};if(_l13)then{cutText[format["You are in Combat and cannot give yourself a Bloodbag"],"PLAIN DOWN"];}else{player removeAction s_player_selfBloodbagN;player playActionNow"Medic";r_interrupt=false;_l15=animationState player;r_doLoop=true;_l16=false;_l17=false;while{r_doLoop}do{_l15=animationState player;_l18=["medic",_l15]call fnc_inString;if(_l18)then{_l16=true;};if(!_l18 &&!r_interrupt &&(time-_l12)<_l11)then{player playActionNow"Medic";_l18=true;};if(_l16 &&!_l18 &&(time-_l12)>_l11)then{r_doLoop=false;_l17=true;lastBloodbag=time;};if(r_interrupt)then{r_doLoop=false;};sleep 0.1;};r_doLoop=false;if(_l17)then{player removeMagazine"ItemBloodbag";player removeMagazine"WoodenArrow";player removeMagazine"ItemTrashToiletpaper";player removeMagazine"ItemTrashRazor";r_player_blood=r_player_blood+_l0;if(r_player_blood>12000)then{r_player_blood=12000;};if(random(_l2)<1)then{r_player_infected=true;player setVariable["USEC_infected",true,true];cutText[format["You have used a bloodbag on yourself but the bloodbag was infected!"],"PLAIN DOWN"];if(_l7)then{r_player_blood=r_player_blood-_l6;player setVariable["USEC_BloodQty",r_player_blood,true];}else{r_player_lowblood=false;10 fadeSound 1;"dynamicBlur"ppEffectAdjust[0];"dynamicBlur"ppEffectCommit 5;"colorCorrections"ppEffectAdjust[1,1,0,[1,1,1,0.0],[1,1,1,1],[1,1,1,1]];"colorCorrections"ppEffectCommit 5;r_player_lowblood=false;player setVariable["USEC_BloodQty",r_player_blood,true];};}else{r_player_lowblood=false;10 fadeSound 1;"dynamicBlur"ppEffectAdjust[0];"dynamicBlur"ppEffectCommit 5;"colorCorrections"ppEffectAdjust[1,1,0,[1,1,1,0.0],[1,1,1,1],[1,1,1,1]];"colorCorrections"ppEffectCommit 5;r_player_lowblood=false;player setVariable["USEC_BloodQty",r_player_blood,true];cutText[format["You have used a bloodbag on yourself!"],"PLAIN DOWN"];};if(_l1)then{[player,_l5]call player_humanityChange;};}else{r_interrupt=false;player switchMove"";player playActionNow"stop";cutText[format["You have interrupted giving yourself a bloodbag!"],"PLAIN DOWN"];};};