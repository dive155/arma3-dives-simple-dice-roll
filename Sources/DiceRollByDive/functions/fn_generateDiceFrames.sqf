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

_lastFrameIndex = (count _frames) - 1;
_lastFrame = _frames select _lastFrameIndex;
_unbuffedFinalValue = _lastFrame select 0;
_finalValue = _lastFrame select 0;
_buffedFrames = 0;

// Post-buff logic
if (_buff != 0 && (count _frames) > 0) then {
	_isCriticalSuccess = _useCriticals && {_finalValue == _maxValue};
	_isCriticalFailure = _useCriticals && {_finalValue == _minValue};

	if not (_isCriticalSuccess or _isCriticalFailure) then {
		// Extend last frame delay to 1s
		_lastFrame set [1, 1];
		_frames set [_lastFrameIndex, _lastFrame];

		private _buffDirection = if (_buff > 0) then {1} else {-1};
		private _nextValue = _finalValue;
		private _maxTotalTime = 3;
		private _maxPerFrameDelay = 0.5;

		// We'll track how many valid frames we can actually show
		private _validFrames = [];

		// Simulate which values would be added
		for "_i" from 1 to abs _buff do {
			_nextValue = _nextValue + _buffDirection;

			// Stop if we hit min or max — skip further frames
			if (_nextValue > _maxValue || _nextValue < _minValue) exitWith {};

			_validFrames pushBack _nextValue;
		};

		// Calculate per-frame delay to fit in max time
		private _numFrames = count _validFrames;
		_buffedFrames = _numFrames;
		private _frameDelay = _maxPerFrameDelay;
		if (_numFrames > 0) then {
			private _totalTime = _numFrames * _frameDelay;
			if (_totalTime > _maxTotalTime) then {
				_frameDelay = _maxTotalTime / _numFrames;
			};
		};

		// Add frames with adjusted delay
		{
			_frames pushBack [_x, _frameDelay];
		} forEach _validFrames;
	};
};

// Return the frames array
[_frames, _unbuffedFinalValue, _buffedFrames]
