params ["_module"];

private _position = getPos _module;
private _message = format ["Roll Dice (Global) module placed at: %1", _position];

[_message] remoteExecCall ["hint", 0]; // Show hint to all players

deleteVehicle _module;