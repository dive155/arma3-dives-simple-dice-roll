class CfgPatches {
    class DiceRollByDive {
        name = "Dive's Simple Dice Roll";
        author = "Dive";
        requiredVersion = 1.0;
        requiredAddons[] = {"A3_Modules_F"};
        units[] = {"DSDR_Module_DiceRoll_WholeMap"};
        weapons[] = {};
    };
};

class CfgFunctions {
    class DSDR {
        class Functions {
            file = "DiceRollByDive\functions";
            class modulePlacedWholeMap {};
        };
    };
};

class CfgFactionClasses {
    class NO_CATEGORY;

    class DSDR_Modules : NO_CATEGORY {
        displayName = "Dice Roll";
    };
};

class CfgVehicles {
    class Module_F;
    
    class DSDR_Module_DiceRoll_WholeMap : Module_F {
        scope = 1;
		scopeCurator = 2;
        displayName = "Roll Dice (Whole Map)";
        category = "DSDR_Modules";
        function = "DSDR_fnc_modulePlacedWholeMap";
		icon = "\DiceRollByDive\ui\DSDR_module_icon.paa";
        isGlobal = 1;
    };
};