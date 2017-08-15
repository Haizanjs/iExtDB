/*
	Author: Heisen

	Description:
	Handle's a query request.

	Parameter(s):
	0: Protocal Type - query or aSync 
	1: Statement - SQL or pre-defined statement
	
	Returns:
	-
*/

private ["_query"];

_protocolType = [_this,0,[],[[]]] call BIS_fnc_param;
_statement = [_this,0,[],[[]]] call BIS_fnc_param;

if (_protocolType) then {
	_query = [0,_statement] call iExtDB_fnc_databaseQuery;
} else {
	_query = [2,_statement] call iExtDB_fnc_databaseASync;
};

if (_query select 0 isEqualTo 0) exitWith {
	[format["Query Error Occured %1",_query select 0]] call iExtDB_fnc_log;
};