if (!hasInterface) exitWith {};
 
[localize "STR_DSDR_ModuleCategory", localize "STR_DSDR_ModuleSubcategory", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];

	[localize "STR_DSDR_SettingsHeader",[
	  ["SLIDER:RADIUS",[localize "STR_DSDR_RadiusTitle",localize "STR_DSDR_RadiusDescription"],[0,200,50,0,(ASLToATL _pos),[255,255,0,75]]],
	  ["CHECKBOX",[localize "STR_DSDR_GlobalTitle", localize "STR_DSDR_GlobalDescription"],[false]],
	  ["EDIT",[localize "STR_DSDR_MessageTitle",localize "STR_DSDR_MessageDescription"],[localize "STR_DSDR_MessageDefault",{}]],
	  ["SLIDER",[localize "STR_DSDR_DifficultyTitle",localize "STR_DSDR_DifficultyDescription"],[2,20,10,0]]
	],{
		params["_values","_arguments"];

		_radius = _values select 0;
		_global = _values select 1;
		_message = _values select 2;
		_difficulty = round (_values select 3);		
		
		_pos=_arguments select 0; 
		_object = _arguments select 1;
		_playerName = "";
		
		if (isPlayer _object) then {
			_playerName = name _object;
		};
		
		_affectedPlayers = allPlayers;
		if not _global then {
			_affectedPlayers = allPlayers select {
				private _playerPosASL = getPosASL _x;
				(_playerPosASL distance  _pos) <= _radius
			};
		};

		
		if (count _affectedPlayers < 1) exitWith {
			[objNull, localize "STR_DSDR_NoPlayersInRange"] call BIS_fnc_showCuratorFeedbackMessage;
		};
		
		_sides = 20;
		_diceParams = [
			_message,
			_difficulty,
			_sides, 
			1 + floor random _sides, 
			3 + random 3,
			_playerName
		];
		
		{
			_diceParams remoteExec ["DSDR_fnc_rollDice", _x];			
		} forEach _affectedPlayers;
		
		if not (player in _affectedPlayers) then {
			_diceParams spawn DSDR_fnc_rollDice;
		};
		
	},{},[_pos, _object]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;
 