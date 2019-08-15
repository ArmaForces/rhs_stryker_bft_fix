class CfgPatches {
    class armaforces_rhs_stryker_bft_fix {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.90;
        requiredAddons[] = {
            "cba_main",
            "rhsusf_c_stryker"
        };
        author = "ArmaForces";
        url = "https://github.com/armaforces";
    };
};

#include "CfgFunctions.hpp"

class CfgVehicles {
    class Car_F;
    class Wheeled_APC_F: Car_F {
        class EventHandlers;
    };

    class rhsusf_stryker_base: Wheeled_APC_F {
        class EventHandlers: EventHandlers {
            class RHSUSF_EventHandlers {
                init="";
            };
            class ArmaForces_EventHandlers {
                init="_this call armaforces_rhs_stryker_bft_fix_fnc_init";
            };
        };
    };
};
