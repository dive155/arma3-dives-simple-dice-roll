params ["_diceParams", "_affectedPlayers", "_codeText"];

{
	if (_x != player) then {
		_diceParams remoteExec ["DSDR_fnc_rollDice", _x];			
	};
} forEach _affectedPlayers;

_diceParams = _diceParams + [_affectedPlayers, _codeText];
_diceParams spawn DSDR_fnc_rollDice;