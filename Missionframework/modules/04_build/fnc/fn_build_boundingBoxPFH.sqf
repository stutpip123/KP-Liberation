#include "script_components.hpp"
/*
    KPLIB_fnc_build_boundingBoxPFH

    File: fn_build_boundingBoxPFH.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates PFH used that draws bounding boxes of objects in queue

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

[{
    params ["", "_handle"];

    if (isNull KPLIB_buildLogic) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    // Draw bounding box for every object in queue
    {
        private _color = _x call KPLIB_fnc_build_objectColor;

        [_x, _color] call KPLIB_fnc_build_drawBoundingBox;

    } forEach LGVAR(buildQueue);

}, 0] call CBA_fnc_addPerFrameHandler;

true
