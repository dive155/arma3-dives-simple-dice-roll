params["_values","_arguments"];

_pos=_arguments select 0; 
_object = _arguments select 1;
_message = _values select 2;
_hasDifficulty = _values select 3;
_difficulty = round (_values select 4);
_hasCriticals = _values select 5;

[_pos, _object, _message, _hasDifficulty, _difficulty, _hasCriticals];