params [
	"_numValues", 
	"_startValue", 
	"_initialSpeed", 
	["_slowDownPerFrame", 0.97],
	["_speedConstant", 5], 
	["_denominatorConstant", 0.3],
	["_useZero", false],
	["_buff", 0],
	["_useCriticals", true]
];

// Calculate correct value bounds
_minValue = if (_useZero) then {0} else {1};
_maxValue = if (_useZero) then {_numValues - 1} else {_numValues};

// Initial conditions
_currentValue = _startValue;
_previousValue = _currentValue;
_currentSpeed = _initialSpeed;
_frames = [];

// Frame generation loop
while {true} do {
	_currentValue = (_currentValue + floor(_currentSpeed)) mod _numValues;
	_currentValue = if (_currentValue < _minValue) then {_maxValue} else {_currentValue};

	_delay = 1 / (_denominatorConstant + (_currentSpeed * _speedConstant));
	if (_delay > 1 or (_currentValue == _previousValue and _currentSpeed < 1)) exitWith {};

	_frames pushBack [_currentValue, _delay];
	_currentSpeed = _currentSpeed * _slowDownPerFrame;
	_previousValue = _currentValue;
};

// Post-buff logic
if (_buff != 0 && (count _frames) > 0) then {
	_lastFrameIndex = (count _frames) - 1;
	_lastFrame = _frames select _lastFrameIndex;
	_finalValue = _lastFrame select 0;

	_isCriticalSuccess = _useCriticals && {_finalValue == _maxValue};
	_isCriticalFailure = _useCriticals && {_finalValue == _minValue};

	if not (_isCriticalSuccess or _isCriticalFailure) then {
		// Extend last frame delay to 1s
		_lastFrame set [1, 1];
		_frames set [_lastFrameIndex, _lastFrame];

		_buffDirection = if (_buff > 0) then {1} else {-1};

		_nextValue = _finalValue;

		for "_i" from 1 to abs _buff do {
			_nextValue = _nextValue + _buffDirection;

			// Check if we've reached the end
			if (_nextValue > _maxValue || _nextValue < _minValue) exitWith {};

			_frames pushBack [_nextValue, 0.5];
		};
	};
};

// Return the frames array
_frames
