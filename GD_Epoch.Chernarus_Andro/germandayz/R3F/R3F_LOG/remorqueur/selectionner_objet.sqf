﻿if(R3F_LOG_mutex_local_verrou)then{player globalChat STR_R3F_LOG_mutex_action_en_cours;}else{R3F_LOG_mutex_local_verrou=true;R3F_LOG_objet_selectionne=_this select 0;player globalChat format[Tow_settings_action_selectionner_objet_remorque_fait,getText(configFile>>"CfgVehicles">>(typeOf R3F_LOG_objet_selectionne)>>"displayName")];R3F_LOG_mutex_local_verrou=false;};