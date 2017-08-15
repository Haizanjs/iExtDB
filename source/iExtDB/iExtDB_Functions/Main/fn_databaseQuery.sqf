/*
	Author: Heisen

	Description:
	Queries Database with request provided.

	Parameter(s):
	0: Mode - aSync Mode
	1: Query - Pre-Defined query statements e.g. (format["insertExample:%1:%2:3",_input1,_input2,_input3])
	
	Returns:
	-
*/


_mode = [_this,0,[],[[]]] call BIS_fnc_param;
_query = [_this,1,[],[[]]] call BIS_fnc_param;
_protocol_id = uiNamespace getVariable "protocol_id";

_request = format ["%1:%2:%3",_mode,(call _protocol_id),_query];
_requestCall = "extDB3" callExtension _request;

[_requestCall] call iExtDB_fnc_log;