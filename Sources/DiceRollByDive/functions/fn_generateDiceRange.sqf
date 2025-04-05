params ["_numValues", "_value", ["_useZero", false]];

// Create an empty array to store the range
_range = [];

_fnc_addWhitespace = {
	params ["_number"];
	
	if (_number >= 10) exitWith {str(_number)};
	
	" " + str(_number);
};

// Add the 3 previous elements (looped)
_tempRange = [];
for "_i" from _value - 3 to _value - 1 do {
	_current = _i;
	
	if (!_useZero) then {	
		if (_current < 1) then {
			_current = _numValues + _current;
		};
	} else {
		if (_current < 0) then {
			_current = _numValues + _current;
		};
	};
	
	_tempRange pushBack ([_current] call _fnc_addWhitespace);
};

// Add the current value
_range pushBack _tempRange;
_range pushBack str(_value);

// Add the 3 next elements (looped)
_tempRange = [];
for "_i" from _value + 1 to _value + 3 step 1 do {
	_current = _i;
	
	if (_useZero) then {
		_current = _i % _numValues;
	} else {
		if (_current != _numValues) then {
			_current = _i % _numValues;  
		};
	};
	
	_tempRange pushBack ([_current] call _fnc_addWhitespace);
};
_range pushBack _tempRange;
_range