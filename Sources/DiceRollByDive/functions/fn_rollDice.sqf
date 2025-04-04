params [
	"_message",
	"_difficulty",
	"_sides", 
	"_startValue", 
	"_speed",
	"_playerName"
];

_introText = format ["<t font='PuristaBold' size='2'>Dice Roll:</t><br/><t font='PuristaMedium' color='#dedede' size='2'>%1</t>", _message];
if (_playerName != "") then {
	_introText = _introText + format["<br/><t font='PuristaBold' size='2'>For Player: </t><t font='PuristaBold' color='#00d2ff' size='2'>%1</t>", _playerName]
};
_introText = _introText + format["<br/><t font='PuristaBold' size='2'>Difficulty: </t><t font='PuristaBold' color='#f79205' size='2'>%1</t><br/><br/>", _difficulty];
titleText [_introText, "PLAIN NOFADE", 3, true, true];
sleep 4;

_rangeText = "";
_frames = [_sides, _startValue, _speed, 0.97, 5, 0.3] call DSDR_fnc_generateDiceFrames;
{
	_value = _x select 0;
	_range = [_sides, _value] call DSDR_fnc_generateDiceRange;
	_delay = _x select 1;
	
	_range1 = (_range select 0) joinString " ";
	_currentValue = _range select 1;
	_range2 = (_range select 2) joinString " ";
	
	_currentColor = "#f79205";
	if (_value >= _difficulty) then {
		_currentColor = "#099124";
	}; 
 
	_rangeText = format ["<t font='EtelkaMonospaceProBold' color='#aeaeae' size='3'>%1</t> <t font='EtelkaMonospaceProBold' color='%2' size='4'> %3 </t> <t font='EtelkaMonospaceProBold' color='#aeaeae' size='3'>%4</t><br/>",
		_range1, _currentColor, _currentValue, _range2];
		
	_rangeText = _introText + _rangeText;		 
	titleText [_rangeText, "PLAIN NOFADE", _delay * 0.4, true, true];
	sleep (_delay);
} forEach _frames;

_fn_getCriticalSuccessMessage = {
	format ["<t size='4' font='EtelkaMonospaceProBold' color='#b5009d'>%1</t>", "Critical Success!"];
};

_fn_getSuccessMessage = {
	format ["<t size='4' font='EtelkaMonospaceProBold' color='#099124'>%1</t>", "Success!"];
};

_fn_getFailureMessage = {
	format ["<t size='4' font='EtelkaMonospaceProBold' color='#f79205'>%1</t>", "Failure!"];
};

_fn_getCriticalFailureMessage = {
	format ["<t size='4' font='EtelkaMonospaceProBold' color='#d40000'>%1</t>", "Critical Failure!"];
};

_result = _frames select (count _frames - 1) select 0;

_outcome = "";
if (_result < _difficulty) then {
	_outcome = call _fn_getFailureMessage;
};

if (_result >= _difficulty) then {
	_outcome = call _fn_getSuccessMessage;
};

if (_result == 1) then {
	_outcome = call _fn_getCriticalFailureMessage;
};

if (_result == _sides) then {
	_outcome = call _fn_getCriticalSuccessMessage; 
};

titleText [_rangeText + _outcome, "PLAIN NOFADE", 1, true, true];
sleep 5;
titleFadeOut 1;