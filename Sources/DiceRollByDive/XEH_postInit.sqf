if (!hasInterface) exitWith {};

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D4)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];

	[(localize "STR_DSDR_SettingsHeader") + " (D4)",[
	  ["SLIDER:RADIUS",[localize "STR_DSDR_RadiusTitle",localize "STR_DSDR_RadiusDescription"],[0,200,50,0,(ASLToATL _pos),[255,0,0,200]]],
	  ["CHECKBOX",[localize "STR_DSDR_GlobalTitle", localize "STR_DSDR_GlobalDescription"],[false]],
	  ["EDIT",[localize "STR_DSDR_MessageTitle",localize "STR_DSDR_MessageDescription"],[localize "STR_DSDR_MessageDefault",{}]],
	  ["CHECKBOX",[localize "STR_DSDR_UseDifficultyTitle", localize "STR_DSDR_UseDifficultyDescription"],[false]],
	  ["SLIDER",[localize "STR_DSDR_DifficultyTitle",localize "STR_DSDR_DifficultyDescription"],[2,4,3,0]],
	  ["CHECKBOX",[localize "STR_DSDR_UseCriticalTitle", localize "STR_DSDR_UseCriticalDescription"],[false]]
	],{
		params["_values","_arguments"];
		
		([_values, _arguments] call DSDR_fnc_parseModuleArguments) params[
			"_pos", "_object", "_message", "_hasDifficulty", "_difficulty", "_hasCriticals"
		];

		_affectedPlayers = [_values, _arguments] call DSDR_fnc_getAffectedPlayers;
		if (count _affectedPlayers < 1) exitWith {};
		
		_playerName = [_object] call DSDR_fnc_getTargetPlayerName;
				
		_sides = 4;
		_initialValue = 1 + floor random _sides;
		_initialSpeed = 3 + random 3;
		
		[[
			_message,
			_difficulty,
			_sides, 
			_initialValue, 
			_initialSpeed,
			_playerName,
			_hasDifficulty,
			_hasCriticals
		], _affectedPlayers] call DSDR_fnc_rollDiceZeus
		
	},{},[_pos, _object]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D6)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];

	[(localize "STR_DSDR_SettingsHeader") + " (D6)",[
	  ["SLIDER:RADIUS",[localize "STR_DSDR_RadiusTitle",localize "STR_DSDR_RadiusDescription"],[0,200,50,0,(ASLToATL _pos),[255,0,0,200]]],
	  ["CHECKBOX",[localize "STR_DSDR_GlobalTitle", localize "STR_DSDR_GlobalDescription"],[false]],
	  ["EDIT",[localize "STR_DSDR_MessageTitle",localize "STR_DSDR_MessageDescription"],[localize "STR_DSDR_MessageDefault",{}]],
	  ["CHECKBOX",[localize "STR_DSDR_UseDifficultyTitle", localize "STR_DSDR_UseDifficultyDescription"],[false]],
	  ["SLIDER",[localize "STR_DSDR_DifficultyTitle",localize "STR_DSDR_DifficultyDescription"],[2,6,3,0]],
	  ["CHECKBOX",[localize "STR_DSDR_UseCriticalTitle", localize "STR_DSDR_UseCriticalDescription"],[false]]
	],{
		params["_values","_arguments"];
		
		([_values, _arguments] call DSDR_fnc_parseModuleArguments) params[
			"_pos", "_object", "_message", "_hasDifficulty", "_difficulty", "_hasCriticals"
		];

		_affectedPlayers = [_values, _arguments] call DSDR_fnc_getAffectedPlayers;
		if (count _affectedPlayers < 1) exitWith {};
		
		_playerName = [_object] call DSDR_fnc_getTargetPlayerName;
				
		_sides = 6;
		_initialValue = 1 + floor random _sides;
		_initialSpeed = 3 + random 3;
		
		[[
			_message,
			_difficulty,
			_sides, 
			_initialValue, 
			_initialSpeed,
			_playerName,
			_hasDifficulty,
			_hasCriticals
		], _affectedPlayers] call DSDR_fnc_rollDiceZeus
		
	},{},[_pos, _object]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D8)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];

	[(localize "STR_DSDR_SettingsHeader") + " (D8)",[
	  ["SLIDER:RADIUS",[localize "STR_DSDR_RadiusTitle",localize "STR_DSDR_RadiusDescription"],[0,200,50,0,(ASLToATL _pos),[255,0,0,200]]],
	  ["CHECKBOX",[localize "STR_DSDR_GlobalTitle", localize "STR_DSDR_GlobalDescription"],[false]],
	  ["EDIT",[localize "STR_DSDR_MessageTitle",localize "STR_DSDR_MessageDescription"],[localize "STR_DSDR_MessageDefault",{}]],
	  ["CHECKBOX",[localize "STR_DSDR_UseDifficultyTitle", localize "STR_DSDR_UseDifficultyDescription"],[false]],
	  ["SLIDER",[localize "STR_DSDR_DifficultyTitle",localize "STR_DSDR_DifficultyDescription"],[2,8,4,0]],
	  ["CHECKBOX",[localize "STR_DSDR_UseCriticalTitle", localize "STR_DSDR_UseCriticalDescription"],[false]]
	],{
		params["_values","_arguments"];
		
		([_values, _arguments] call DSDR_fnc_parseModuleArguments) params[
			"_pos", "_object", "_message", "_hasDifficulty", "_difficulty", "_hasCriticals"
		];

		_affectedPlayers = [_values, _arguments] call DSDR_fnc_getAffectedPlayers;
		if (count _affectedPlayers < 1) exitWith {};
		
		_playerName = [_object] call DSDR_fnc_getTargetPlayerName;
				
		_sides = 8;
		_initialValue = 1 + floor random _sides;
		_initialSpeed = 3 + random 3;
		
		[[
			_message,
			_difficulty,
			_sides, 
			_initialValue, 
			_initialSpeed,
			_playerName,
			_hasDifficulty,
			_hasCriticals
		], _affectedPlayers] call DSDR_fnc_rollDiceZeus
		
	},{},[_pos, _object]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D12)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];

	[(localize "STR_DSDR_SettingsHeader") + " (D12)",[
	  ["SLIDER:RADIUS",[localize "STR_DSDR_RadiusTitle",localize "STR_DSDR_RadiusDescription"],[0,200,50,0,(ASLToATL _pos),[255,0,0,200]]],
	  ["CHECKBOX",[localize "STR_DSDR_GlobalTitle", localize "STR_DSDR_GlobalDescription"],[false]],
	  ["EDIT",[localize "STR_DSDR_MessageTitle",localize "STR_DSDR_MessageDescription"],[localize "STR_DSDR_MessageDefault",{}]],
	  ["CHECKBOX",[localize "STR_DSDR_UseDifficultyTitle", localize "STR_DSDR_UseDifficultyDescription"],[false]],
	  ["SLIDER",[localize "STR_DSDR_DifficultyTitle",localize "STR_DSDR_DifficultyDescription"],[2,12,4,0]],
	  ["CHECKBOX",[localize "STR_DSDR_UseCriticalTitle", localize "STR_DSDR_UseCriticalDescription"],[false]]
	],{
		params["_values","_arguments"];
		
		([_values, _arguments] call DSDR_fnc_parseModuleArguments) params[
			"_pos", "_object", "_message", "_hasDifficulty", "_difficulty", "_hasCriticals"
		];

		_affectedPlayers = [_values, _arguments] call DSDR_fnc_getAffectedPlayers;
		if (count _affectedPlayers < 1) exitWith {};
		
		_playerName = [_object] call DSDR_fnc_getTargetPlayerName;
				
		_sides = 12;
		_initialValue = 1 + floor random _sides;
		_initialSpeed = 3 + random 3;
		
		[[
			_message,
			_difficulty,
			_sides, 
			_initialValue, 
			_initialSpeed,
			_playerName,
			_hasDifficulty,
			_hasCriticals
		], _affectedPlayers] call DSDR_fnc_rollDiceZeus
		
	},{},[_pos, _object]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D10)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];

	[(localize "STR_DSDR_SettingsHeader") + " (D10)",[
	  ["SLIDER:RADIUS",[localize "STR_DSDR_RadiusTitle",localize "STR_DSDR_RadiusDescription"],[0,200,50,0,(ASLToATL _pos),[255,0,0,200]]],
	  ["CHECKBOX",[localize "STR_DSDR_GlobalTitle", localize "STR_DSDR_GlobalDescription"],[false]],
	  ["EDIT",[localize "STR_DSDR_MessageTitle",localize "STR_DSDR_MessageDescription"],[localize "STR_DSDR_MessageDefault",{}]],
	  ["CHECKBOX",[localize "STR_DSDR_UseDifficultyTitle", localize "STR_DSDR_UseDifficultyDescription"],[false]],
	  ["SLIDER",[localize "STR_DSDR_DifficultyTitle",localize "STR_DSDR_DifficultyDescription"],[2,9,4,0]],
	  ["CHECKBOX",[localize "STR_DSDR_UseCriticalTitle", localize "STR_DSDR_UseCriticalDescription"],[false]]
	],{
		params["_values","_arguments"];
		
		([_values, _arguments] call DSDR_fnc_parseModuleArguments) params[
			"_pos", "_object", "_message", "_hasDifficulty", "_difficulty", "_hasCriticals"
		];

		_affectedPlayers = [_values, _arguments] call DSDR_fnc_getAffectedPlayers;
		if (count _affectedPlayers < 1) exitWith {};
		
		_playerName = [_object] call DSDR_fnc_getTargetPlayerName;
				
		_sides = 10;
		_initialValue = floor random _sides;
		_initialSpeed = 3 + random 3;
		
		[[
			_message,
			_difficulty,
			_sides, 
			_initialValue, 
			_initialSpeed,
			_playerName,
			_hasDifficulty,
			_hasCriticals
		], _affectedPlayers] call DSDR_fnc_rollDiceZeus
		
	},{},[_pos, _object]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D100)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];

	[(localize "STR_DSDR_SettingsHeader") + " (D100)",[
	  ["SLIDER:RADIUS",[localize "STR_DSDR_RadiusTitle",localize "STR_DSDR_RadiusDescription"],[0,200,50,0,(ASLToATL _pos),[255,0,0,200]]],
	  ["CHECKBOX",[localize "STR_DSDR_GlobalTitle", localize "STR_DSDR_GlobalDescription"],[false]],
	  ["EDIT",[localize "STR_DSDR_MessageTitle",localize "STR_DSDR_MessageDescription"],[localize "STR_DSDR_MessageDefault",{}]],
	  ["CHECKBOX",[localize "STR_DSDR_UseDifficultyTitle", localize "STR_DSDR_UseDifficultyDescription"],[false]],
	  ["SLIDER",[localize "STR_DSDR_DifficultyTitle",localize "STR_DSDR_DifficultyDescription"],[2,100,50,0]],
	  ["CHECKBOX",[localize "STR_DSDR_UseCriticalTitle", localize "STR_DSDR_UseCriticalDescription"],[false]]
	],{
		params["_values","_arguments"];
		
		([_values, _arguments] call DSDR_fnc_parseModuleArguments) params[
			"_pos", "_object", "_message", "_hasDifficulty", "_difficulty", "_hasCriticals"
		];

		_affectedPlayers = [_values, _arguments] call DSDR_fnc_getAffectedPlayers;
		if (count _affectedPlayers < 1) exitWith {};
		
		_playerName = [_object] call DSDR_fnc_getTargetPlayerName;
				
		_sides = 100;
		_initialValue = floor random _sides;
		_initialSpeed = 30 + random 30;
		
		[[
			_message,
			_difficulty,
			_sides, 
			_initialValue, 
			_initialSpeed,
			_playerName,
			_hasDifficulty,
			_hasCriticals
		], _affectedPlayers] call DSDR_fnc_rollDiceZeus
		
	},{},[_pos, _object]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D20)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];

	[(localize "STR_DSDR_SettingsHeader") + " (D20)",[
	  ["SLIDER:RADIUS",[localize "STR_DSDR_RadiusTitle",localize "STR_DSDR_RadiusDescription"],[0,200,50,0,(ASLToATL _pos),[255,0,0,200]]],
	  ["CHECKBOX",[localize "STR_DSDR_GlobalTitle", localize "STR_DSDR_GlobalDescription"],[false]],
	  ["EDIT",[localize "STR_DSDR_MessageTitle",localize "STR_DSDR_MessageDescription"],[localize "STR_DSDR_MessageDefault",{}]],
	  ["CHECKBOX",[localize "STR_DSDR_UseDifficultyTitle", localize "STR_DSDR_UseDifficultyDescription"],[true]],
	  ["SLIDER",[localize "STR_DSDR_DifficultyTitle",localize "STR_DSDR_DifficultyDescription"],[2,20,10,0]],
	  ["CHECKBOX",[localize "STR_DSDR_UseCriticalTitle", localize "STR_DSDR_UseCriticalDescription"],[true]]
	],{
		params["_values","_arguments"];
		
		([_values, _arguments] call DSDR_fnc_parseModuleArguments) params[
			"_pos", "_object", "_message", "_hasDifficulty", "_difficulty", "_hasCriticals"
		];

		_affectedPlayers = [_values, _arguments] call DSDR_fnc_getAffectedPlayers;
		if (count _affectedPlayers < 1) exitWith {};
		
		_playerName = [_object] call DSDR_fnc_getTargetPlayerName;
				
		_sides = 20;
		_initialValue = 1 + floor random _sides;
		_initialSpeed = 3 + random 3;
		
		[[
			_message,
			_difficulty,
			_sides, 
			_initialValue, 
			_initialSpeed,
			_playerName,
			_hasDifficulty,
			_hasCriticals
		], _affectedPlayers] call DSDR_fnc_rollDiceZeus
		
	},{},[_pos, _object]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;