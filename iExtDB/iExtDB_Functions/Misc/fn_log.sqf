/*
	Author: Heisen

	Description:
	Logs in .RPT provided message.

	Parameter(s):
	0: Formatted Message

	Returns:
	-
*/

_message = [_this,0,[],[[]]] call BIS_fnc_param;
diag_log format["iExtDB: %1",_message];