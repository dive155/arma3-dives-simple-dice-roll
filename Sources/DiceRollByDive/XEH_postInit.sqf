if (!hasInterface) exitWith {};

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D4)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];
	
	private _args = _this + [4, false, [2,4,3,0], 3];
	_args call DSDR_fnc_executeDiceModule;
	
}, "\DiceRollByDive\ui\d4_small.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D6)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];
	
	private _args = _this + [6, false, [2,6,3,0], 3];
	_args call DSDR_fnc_executeDiceModule;
	
}, "\DiceRollByDive\ui\d6_small.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D8)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];
	
	private _args = _this + [8, false, [2,8,4,0], 3];
	_args call DSDR_fnc_executeDiceModule;
	
}, "\DiceRollByDive\ui\d8_small.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D12)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];
	
	private _args = _this + [12, false, [2,12,4,0], 3];
	_args call DSDR_fnc_executeDiceModule;
	
}, "\DiceRollByDive\ui\d12_small.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D10)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];
	
	private _args = _this + [10, false, [2,9,4,0], 3];
	_args call DSDR_fnc_executeDiceModule;
	
}, "\DiceRollByDive\ui\d10_small.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D100)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];
	
	private _args = _this + [100, false, [2,100,50,0], 30];
	_args call DSDR_fnc_executeDiceModule;
	
}, "\DiceRollByDive\ui\d100_small.paa"] call zen_custom_modules_fnc_register;

[localize "STR_DSDR_ModuleCategory", (localize "STR_DSDR_ModuleSubcategory") + " (D20)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_object",objNull,[objNull]]];
	
	private _args = _this + [20, true, [2,20,10,0], 3];
	_args call DSDR_fnc_executeDiceModule;
	
}, "\DiceRollByDive\ui\d20_small.paa"] call zen_custom_modules_fnc_register;