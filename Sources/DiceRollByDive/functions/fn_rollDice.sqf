params [
	"_message",
	"_difficulty",
	"_sides", 
	"_startValue", 
	"_speed",
	"_targetPlayer",
	"_hasDifficulty",
	"_hasCriticals",
	"_buff",
	["_affectedPlayers", []],
	["_codeText", ""]
];

// D10 starts with 0
_useZero = _sides == 10;

_playerName = if (not isNull _targetPlayer) then {name _targetPlayer} else {""};

_introText = format ["<img <img size='5' image='\DiceRollByDive\ui\d%1_big.paa'/><br/><t font='PuristaBold' size='3'>%2 (D%3)</t><br/><t font='PuristaMedium' color='#dedede' size='2'>%4</t>", _sides, (localize "STR_DSDR_Title"), _sides, _message];
if (_playerName != "") then {
	_introText = _introText + format["<br/><t font='PuristaBold' size='2'>%1 </t><t font='PuristaBold' color='#00d2ff' size='2'>%2</t>", localize "STR_DSDR_ForPlayer", _playerName]
};

if (_hasDifficulty) then {
	_introText = _introText + format["<br/><t font='PuristaBold' size='2'>%1 </t><t font='PuristaBold' color='#f79205' size='2'>%2</t>", localize "STR_DSDR_Difficulty", _difficulty];
};

if (_buff != 0) then {
	private _buffColor = if (_buff > 0) then {"#099124"} else {"#f79205"};
	private _buffLabel = if (_buff > 0) then {(localize "STR_DSDR_Buff")} else {(localize "STR_DSDR_Debuff")};
	//_buffText = if (_buff > ) then {"+" + str(_buff)} else {str(_buff)};
	_introText = _introText + format[
		"<br/><t font='PuristaBold' size='2'>%1 </t><t font='PuristaBold' color='%2' size='2'>%3</t>",
		_buffLabel, _buffColor, _buff
	];
};

_introText = _introText + "<br/><br/>";

titleText [_introText, "PLAIN NOFADE", 3, true, true];
sleep 4;

_rangeText = "";
_framesData = [_sides, _startValue, _speed, 0.96, 5, 0.3, _useZero, _buff, _hasCriticals] call DSDR_fnc_generateDiceFrames;

_frames = _framesData select 0;
_unbuffedFinalValue = _framesData select 1;

_clickSounds = ["DSDR_Click1", "DSDR_Click2", "DSDR_Click3", "DSDR_Click4"];
_startTime = time;
playSound "DSDR_Roll_Short";
{
	_value = _x select 0;
	_range = [_sides, _value, _useZero] call DSDR_fnc_generateDiceRange;
	_delay = _x select 1;
	
	_range1 = (_range select 0) joinString " ";
	_currentValue = _range select 1;
	_range2 = (_range select 2) joinString " ";
	
	_currentColor = "#00d2ff";
	if (_hasDifficulty) then {
		_currentColor = "#f79205";
		if (_value >= _difficulty) then {
			_currentColor = "#099124";
		}; 
	};
 
	_rangeText = format ["<t font='EtelkaMonospaceProBold' color='#aeaeae' size='3'>%1</t> <t font='EtelkaMonospaceProBold' color='%2' size='4'> %3 </t> <t font='EtelkaMonospaceProBold' color='#aeaeae' size='3'>%4</t><br/>",
		_range1, _currentColor, _currentValue, _range2];
		
	_rangeText = _introText + _rangeText;		 
	titleText [_rangeText, "PLAIN NOFADE", _delay * 0.4, true, true];
	
	if (time - _startTime > 1.1) then {
		playSound (selectRandom _clickSounds);
	};
	sleep (_delay);
} forEach _frames;

_fn_getCriticalSuccessMessage = {
	format ["<t size='4' font='EtelkaMonospaceProBold' color='#b5009d'>%1</t>", localize "STR_DSDR_SuccessCritical"];
};

_fn_getSuccessMessage = {
	format ["<t size='4' font='EtelkaMonospaceProBold' color='#099124'>%1</t>", localize "STR_DSDR_Success"];
};

_fn_getFailureMessage = {
	format ["<t size='4' font='EtelkaMonospaceProBold' color='#f79205'>%1</t>", localize "STR_DSDR_Failure"];
};

_fn_getCriticalFailureMessage = {
	format ["<t size='4' font='EtelkaMonospaceProBold' color='#d40000'>%1</t>", localize "STR_DSDR_FailureCritical"];
};

_fn_getResultMessage = {
	format ["<t size='4' font='EtelkaMonospaceProBold' color='#00d2ff'>%1</t>", localize "STR_DSDR_Result"];
};

_result = _frames select (count _frames - 1) select 0;

_minValue = if (_useZero) then {0} else {1};
_maxValue = if (_useZero) then {_sides - 1} else {_sides};

_outcome = "";
_sound = "";
if (_hasDifficulty) then {
	if (_result < _difficulty) then {
		_outcome = call _fn_getFailureMessage;
		_sound = "DSDR_Failure";
	};

	if (_result >= _difficulty) then {
		_outcome = call _fn_getSuccessMessage;
		_sound = "DSDR_Success";
	};

	if (_hasCriticals) then {
		// TODO This could fail with D10 as it starts from 0
		if (_result == _minValue and _unbuffedFinalValue == _minValue) then {
			_outcome = call _fn_getCriticalFailureMessage;
			_sound = "DSDR_Failure_Critical";
		};

		if (_result == _maxValue and _unbuffedFinalValue == _maxValue) then {
			_outcome = call _fn_getCriticalSuccessMessage;
			_sound = "DSDR_Success_Critical"; 
		};
	};
} else {
	_outcome = call _fn_getResultMessage;
	_sound = "DSDR_Success";
};

// Is Zeus
if (count _affectedPlayers > 0) then {
	private _checkPassed = (not _hasDifficulty) or {_result >= _difficulty};
	private _args = [
		_result, 
		_checkPassed,
		_message,
		_hasDifficulty,
		_difficulty,
		_hasCriticals,
		_sides, 
		_targetPlayer,
		_affectedPlayers
	];
	["DSDR_diceRollHappened", [_args]] call CBA_fnc_localEvent;

	if (not (_codeText isEqualTo "")) then {
		private _codeHeader = "params[
			""_rollResult"", 
			""_checkPassed"",
			""_message"",
			""_hasDifficulty"",
			""_difficulty"",
			""_hasCriticals"",
			""_sides"", 
			""_targetPlayer"",
			""_affectedPlayers""
		];";
		
		private _code = _codeHeader + _codeText;
		private _compiled = compile _code;
		_args spawn _compiled;
	};
};

playSound _sound;
titleText [_rangeText + _outcome, "PLAIN NOFADE", 1, true, true];
sleep 5;
titleFadeOut 1;