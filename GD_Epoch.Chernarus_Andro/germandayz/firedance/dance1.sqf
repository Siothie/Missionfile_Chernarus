﻿private["_l0"];_l0=_this select 3;player removeAction s_player_dance;s_player_dance=-1;player playMove"ActsPercMstpSnonWnonDnon_DancingStefan";cutText["Let the party begin!","PLAIN DOWN"];r_interrupt=false;_l1=animationState player;r_doLoop=true;_l2=false;_l3=false;while{r_doLoop}do{_l1=animationState player;_l4=["ActsPercMstpSnonWnonDnon_DancingStefan",_l1]call fnc_inString;if(_l4)then{_l2=true;};if(_l2 and!_l4)then{r_doLoop=false;_l3=true;};if(r_interrupt)then{r_doLoop=false;};sleep 0.1;};r_doLoop=false;if(_l3)then{cutText["Awesome performance mate!","PLAIN DOWN"];}else{r_interrupt=false;[objNull,player,rSwitchMove,""]call RE;player playActionNow"stop";cutText["Dance Canceled!;(","PLAIN DOWN"];};