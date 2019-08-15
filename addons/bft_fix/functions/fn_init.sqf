/*
    armaforces_rhs_stryker_bft_fix_fnc_init

    File: fn_hello.sqf
    Date: 2019-06-25
    Last Update: 2019-08-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handle initialization of Stryker vehicle.

    Parameter(s):
        _vehicle - Vehicle [objNull, defaults to objNull]

    Returns:
        NOTHING
*/
params [
    ["_vehicle", objNull, [objNull]]
];

private _sections = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "hiddenSelections");
_vehicle setObjectTexture [_sections find "BFT_screen", getText (configFile >> "CfgWorlds" >> worldName >> "pictureMap")];

[{
    params ["_args", "_handle"];
    _args params ["_vehicle"];

    if (!alive _vehicle) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _scale = _vehicle animationSourcePhase "BFT_Map_Scale";
    _vehicle setUserMFDValue [0, worldSize * _scale];

    if (local _vehicle) then {;

        private _vehiclePos = getPos _vehicle;
        _vehiclePos resize 2;

        _vehiclePos = _vehiclePos apply {(round _x / worldSize) / _scale};

        _vehicle animateSource ["BFT_Map_Move_X", _vehiclePos select 0, true];
        _vehicle animateSource ["BFT_Map_Move_Y", _vehiclePos select 1, true];
    };
}, 1, _vehicle] call CBA_fnc_addPerFrameHandler;
