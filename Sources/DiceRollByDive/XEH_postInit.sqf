missionNamespace setVariable ["amogus", true];

if (!hasInterface) exitWith {};

["Dice Roll", "Roll Dice (Config)", 
{
	params [["_pos",[0,0,0],[[]],3], ["_logic",objNull,[objNull]]];

	["Roll the Dice",[
	  ["SLIDER:RADIUS",["Radius","Players within the radius will see the dice roll"],[0,200,50,0,(ASLToATL _pos),[255,255,0,75]]],
	  ["CHECKBOX",["Global","Show to every player in the game"],[false]],
	  ["EDIT",["Message","Message to be shown to the player"],["Luck check",{}]],
	  ["SLIDER",["Difficulty","The value the player needs to roll to succeed"],[2,20,10,0]]
	],{
		params["_values","_arguments"];

		_pos=_arguments select 0; 
	},{},[_pos]] call zen_dialog_fnc_create;

}, "\DiceRollByDive\ui\DSDR_module_icon.paa"] call zen_custom_modules_fnc_register;
 