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
		_pos=_arguments select 0; 
		_object = _arguments select 1;

		_affectedPlayers = [_values, _arguments] call DSDR_fnc_getAffectedPlayers;
		if (count _affectedPlayers < 1) exitWith {};
		
		_playerName = [_object] call DSDR_fnc_getTargetPlayerName;
		
		_message = _values select 2;
		_difficulty = round (_values select 3);		
		_sides = 20;
		_initialValue = 1 + floor random _sides;
		_initialSpeed = 3 + random 3;
		_diceParams = [
			_message,
			_difficulty,
			_sides, 
			_initialValue, 
			_initialSpeed,
			_playerName
		];
		
		[_diceParams, _affectedPlayers] call DSDR_fnc_rollDiceZeus
		
	},{},[_pos, _object]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;
 