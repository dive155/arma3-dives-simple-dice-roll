params ["_diceParams", "_affectedPlayers"];

{
	_diceParams remoteExec ["DSDR_fnc_rollDice", _x];			
} forEach _affectedPlayers;

if not (player in _affectedPlayers) then {
	_diceParams spawn DSDR_fnc_rollDice;
};