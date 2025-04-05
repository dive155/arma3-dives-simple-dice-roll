params [
	"_numValues", 
	"_startValue", 
	"_initialSpeed", 
	["_slowDownPerFrame", 0.97],
	["_speedConstant", 5], 
	["_denominatorConstant", 0.3]
];

// Define the roulette values
_roulette = [];
for "_i" from 1 to _numValues do { _roulette pushBack _i; };

// Initial conditions
_currentValue = _startValue;
_previousValue = _currentValue; // Track the previous value to compare if it changes
_currentSpeed = _initialSpeed;  // Speed in terms of values per frame (e.g., 0.2 means it moves 0.2 places per frame)
_frames = [];

// Continue adding frames while the delay for the next frame is less than 1 second
while {true} do {
	// Calculate the current value to show (modulo 20 to make sure we are in the 1-20 range)
	_currentValue = (_currentValue + floor(_currentSpeed)) mod _numValues;
	_currentValue = if (_currentValue == 0) then {_numValues} else {_currentValue};  // Ensure it wraps correctly from 0 to 20

	// Calculate the delay for this frame. Start small, grow larger as the roulette slows down.
	_delay = 1 / (_denominatorConstant + (_currentSpeed * _speedConstant));  // Example delay function: the higher the speed, the smaller the delay
	
	// If the delay exceeds 1 second, stop adding frames
	if (_delay > 1 or (_currentValue == _previousValue and _currentSpeed < 1)) exitWith {};

	// Add the frame to the frames array
	_frames pushBack [_currentValue, _delay];

	// Decrease speed (simulate slowing down by reducing speed gradually)
	_currentSpeed = _currentSpeed * _slowDownPerFrame;  // Slow down by the given factor per frame
	
	// Update the previous value for comparison in the next frame
    _previousValue = _currentValue;
};

// Return the frames array
_frames