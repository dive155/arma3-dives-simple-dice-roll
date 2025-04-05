params [
	"_values",
	"_arguments"
];

_radius = _values select 0;
_global = _values select 1;
_pos=_arguments select 0; 

_affectedPlayers = allPlayers;
if not _global then {
	_affectedPlayers = allPlayers select {
		private _playerPosASL = getPosASL _x;
		(_playerPosASL distance  _pos) <= _radius
	};
};

if (count _affectedPlayers < 1) then {
	[objNull, localize "STR_DSDR_NoPlayersInRange"] call BIS_fnc_showCuratorFeedbackMessage;
};

_affectedPlayers