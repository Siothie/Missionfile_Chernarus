﻿if(R3F_LOG_mutex_local_verrou)then{player globalChat STR_R3F_LOG_mutex_action_en_cours;}else{R3F_LOG_mutex_local_verrou=true;private["_l0","_l1","_l2","_l3"];_l0=R3F_LOG_objet_selectionne;_l2=_this select 0;if(!(isNull _l0)&&!(_l0 getVariable"R3F_LOG_disabled"))then{if(isNull(_l0 getVariable"R3F_LOG_beingtransported")&&(isNull(_l0 getVariable"R3F_LOG_beingmoved")||(!alive(_l0 getVariable"R3F_LOG_beingmoved"))))then{private["_l4","_l5","_l6","_l7"];_l4=_l2 getVariable"R3F_LOG_objets_charges";_l5=0;{for[{_l3=0},{_l3<count R3F_LOG_CFG_objets_transportables},{_l3=_l3+1}]do{if(_x isKindOf(R3F_LOG_CFG_objets_transportables select _l3 select 0))exitWith{_l5=_l5+(R3F_LOG_CFG_objets_transportables select _l3 select 1);};};}forEach _l4;_l6=99999;for[{_l3=0},{_l3<count R3F_LOG_CFG_objets_transportables},{_l3=_l3+1}]do{if(_l0 isKindOf(R3F_LOG_CFG_objets_transportables select _l3 select 0))exitWith{_l6=(R3F_LOG_CFG_objets_transportables select _l3 select 1);};};_l7=0;for[{_l3=0},{_l3<count R3F_LOG_CFG_transporteurs},{_l3=_l3+1}]do{if(_l2 isKindOf(R3F_LOG_CFG_transporteurs select _l3 select 0))exitWith{_l7=(R3F_LOG_CFG_transporteurs select _l3 select 1);};};if(_l5+_l6<=_l7)then{if(_l0 distance _l2<=30)then{_l4=_l4+[_l0];_l2 setVariable["R3F_LOG_objets_charges",_l4,true];player globalChat Tow_settings_action_charger_selection_en_cours;sleep 2;private["_nb_tirage_pos","_position_attache"];_position_attache=[random 3000,random 3000,(10000+(random 3000))];_nb_tirage_pos=1;while{(!isNull(nearestObject _position_attache))&&(_nb_tirage_pos<25)}do{_position_attache=[random 3000,random 3000,(10000+(random 3000))];_nb_tirage_pos=_nb_tirage_pos+1;};_l0 attachTo[R3F_LOG_PUBVAR_point_attache,_position_attache];R3F_LOG_objet_selectionne=objNull;player globalChat format[Tow_settings_action_charger_selection_fait,getText(configFile>>"CfgVehicles">>(typeOf _l0)>>"displayName")];}else{player globalChat format[Tow_settings_action_charger_selection_trop_loin,getText(configFile>>"CfgVehicles">>(typeOf _l0)>>"displayName")];};}else{player globalChat Tow_settings_action_charger_selection_pas_assez_de_place;};}else{player globalChat format[Tow_settings_action_charger_selection_objet_transporte,getText(configFile>>"CfgVehicles">>(typeOf _l0)>>"displayName")];};};R3F_LOG_mutex_local_verrou=false;};