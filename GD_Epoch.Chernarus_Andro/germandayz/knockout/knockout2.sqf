﻿private["_l0","_l1","_l2"];_l0=_this select 0;_l1=_this select 1;diag_log("Knockout attempt on:"+str(_l0)+"and I am:"+str(player));if(_l0==player)then{diag_log("Knocked out!");[player,_l1]call fnc_usec_damageUnconscious;sleep 0.75;_l2=floor(random 3);if(_l2==0)then{playSound"beat02";};if(_l2==1)then{playSound"beat03";};if(_l2==2)then{playSound"beat04";};cutText["You've been knocked out!","PLAIN DOWN"];};