class CfgPatches {
    class DiceRollByDive {
        name = "Dive's Simple Dice Roll";
        author = "Dive";
        requiredVersion = 1.0;
        requiredAddons[]=
		{
			"A3_Modules_F",
			"zen_context_menu",
			"zen_attributes",
			"zen_custom_modules",
			"cba_main"
		};
        units[] = {};
        weapons[] = {};
    };
};

class CfgFunctions {
    class DSDR {
        class Functions {
            file = "DiceRollByDive\functions";
            class rollDice {};
			class rollDiceZeus {};
			class generateDiceFrames {};
			class generateDiceRange {};
			class getAffectedPlayers {};
			class getTargetPlayerName {};
        };
    };
};

class CfgFactionClasses {
    class NO_CATEGORY;

    class DSDR_Modules : NO_CATEGORY {
        displayName = "Dice Roll";
    };
};

class Extended_PostInit_EventHandlers
{
	class DSDR_PostInit
	{
		init="call compile preprocessFileLineNumbers 'DiceRollByDive\XEH_postInit.sqf'";
	};
};

#include "CfgSounds.hpp"