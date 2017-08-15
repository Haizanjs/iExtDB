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
	["Already Setup"] call iExtDB_fnc_log;
};

_database = getText(configFile >> "iExtDB_Config" >> "iExtDB_Connection" >> "Database");
_protocol = getText(configFile >> "iExtDB_Config" >> "iExtDB_Connection" >> "Protocol");
_protocol_name = getText(configFile >> "iExtDB_Config" >> "iExtDB_Connection" >> "Protocol_Name");
_protocol_lock = getText(configFile >> "iExtDB_Config" >> "iExtDB_Connection" >> "Protocol_Lock");
_protocol_id = round(random 1000);

uiNamespace setVariable ["protocol_id",_protocol_id];

[format ["Session ID %1",_protocol_id]] call iExtDB_fnc_log;

_version = "extDB3" callExtension "9:VERSION";

if (_version isEqualTo "") exitWith {
	["Version not found"] call iExtDB_fnc_log;
};

[format ["Version %1 found",_status]] call iExtDB_fnc_log;

_add_database = "extDB3" callExtension format ["9:ADD_DATABASE:%1",_database];

[format ["Database %1",_database]] call iExtDB_fnc_log;

_add_database_protocol = "extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1,%2,%3,%4",_database,_protocol,_protocol_id,_protocol_name];

[format["Protocol %1 %2",_protocol,_protocol_name]] call iExtDB_fnc_log;

"extDB3" callExtension format["9:LOCK:%1",_protocol_lock];

iExtDB_Setup = true;