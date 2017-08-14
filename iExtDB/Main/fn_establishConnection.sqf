/*
	Author: Heisen

	Description:
	Establishes Connection to MySQL Server.

	Parameter(s):
	-

	Returns:
	-
*/

if (iExtDB_Setup) exitWith {
	diag_log "iExtDB: Already Setup";
};

_database = getText(configFile >> "iExtDB_Config" >> "iExtDB_Connection" >> "Database");
_protocol = getText(configFile >> "iExtDB_Config" >> "iExtDB_Connection" >> "Protocol");
_protocol_name = getText(configFile >> "iExtDB_Config" >> "iExtDB_Connection" >> "Protocol_Name");
_protocol_lock = getText(configFile >> "iExtDB_Config" >> "iExtDB_Connection" >> "Protocol_Lock");
_protocol_id = round(random 1000);

uiNamespace setVariable ["protocol_id",_protocol_id];

diag_log format ["iExtDB: Session ID %1",_protocol_id];

_version = "extDB3" callExtension "9:VERSION";

if (_version isEqualTo "") exitWith {
	diag_log "iExtDB: Version not found";
};

diag_log format ["iExtDB: Version %1 found",_status];

_add_database = "extDB3" callExtension format ["9:ADD_DATABASE:%1",_database];

diag_log format ["iExtDB: Database %1",_database];

_add_database_protocol = "extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1,%2,%3,%4",_database,_protocol,_protocol_id,_protocol_name];

diag_log format ["iExtDB: Protocol %1 %2",_protocol,_protocol_name];

"extDB3" callExtension format["9:LOCK:%1",_protocol_lock];

iExtDB_Setup = true;