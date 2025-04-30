params [
	["_pos",[0,0,0],[[]],3], 
	["_object",objNull,[objNull]],
	["_sides", 6],
	["_difficultyEnabledDefault", false],
	["_difficultySliderSettings", [2,6,3,0]],
	["_initialSpeed", 3]
];

private _restoreLineFeeds = {
	private _input = _this select 0;
	private _output = _input;
	
	if (typeName _input == "STRING") then {
		private _outputArr = _input splitString "%";
		_output = _outputArr joinString (toString [10])
	};
	_output
};
private _codeDesc = [localize "STR_DSDR_CodeDescription"] call _restoreLineFeeds;

[(localize "STR_DSDR_SettingsHeader") + format[" (D%1)", _sides],[
	["SLIDER:RADIUS",[localize "STR_DSDR_RadiusTitle",localize "STR_DSDR_RadiusDescription"],[0,200,50,0,(ASLToATL _pos),[255,0,0,200]]],
	["CHECKBOX",[localize "STR_DSDR_GlobalTitle", localize "STR_DSDR_GlobalDescription"],[false]],
	["EDIT",[localize "STR_DSDR_MessageTitle",localize "STR_DSDR_MessageDescription"],[localize "STR_DSDR_MessageDefault",{}]],
	["CHECKBOX",[localize "STR_DSDR_UseDifficultyTitle", localize "STR_DSDR_UseDifficultyDescription"],[_difficultyEnabledDefault]],
	["SLIDER",[localize "STR_DSDR_DifficultyTitle",localize "STR_DSDR_DifficultyDescription"],_difficultySliderSettings],
	["CHECKBOX",[localize "STR_DSDR_UseCriticalTitle", localize "STR_DSDR_UseCriticalDescription"],[_difficultyEnabledDefault]],
	["EDIT:CODE",[localize "STR_DSDR_CodeTitle",_codeDesc],["",{}]]
],{
	params["_values","_arguments"];
	
	([_values, _arguments] call DSDR_fnc_parseModuleArguments) params[
		"_pos", "_object", "_message", "_hasDifficulty", "_difficulty", "_hasCriticals", "_codeText", "_sides", "_initialSpeed"
	];

	_affectedPlayers = [_values, _arguments] call DSDR_fnc_getAffectedPlayers;
	if (count _affectedPlayers < 1) exitWith {};
	
	_playerName = [_object] call DSDR_fnc_getTargetPlayerName;
			
	_initialValue = floor random _sides;
	if (_sides != 10) then {
		_initialValue = _initialValue + 1;
	};
	_randomSpeed = _initialSpeed + random _initialSpeed;
	
	[[
		_message,
		_difficulty,
		_sides, 
		_initialValue, 
		_randomSpeed,
		_playerName,
		_hasDifficulty,
		_hasCriticals
	], _affectedPlayers, _codeText] call DSDR_fnc_rollDiceZeus
	
},{},[_pos, _object, _sides, _initialSpeed]] call zen_dialog_fnc_create;