/// PEd_roomApplySettings(room)
/**
 * @brief Applies room settings to the current room.
 * @param {real} room The id of the room.
 */
var _room = argument0;
var _width = PEd_roomGetWidth(_room);
var _height = PEd_roomGetHeight(_room);

////////////////////////////////////////////////////////////////////////////////
// Apply view and background settings
background_colour = PEd_roomGetColour(_room);
background_showcolour = PEd_roomGetShowColour(_room);

for (var i = 0; i < 8; i++)
{
    ////////////////////////////////////////////////////////////////////////////
    // Views
    var _viewport = PEd_roomGetViewport(_room, i);
    view_visible[i] = PEd_viewportGetVisible(_viewport);
    view_xview[i] = PEd_viewportGetX(_viewport);
    view_yview[i] = PEd_viewportGetY(_viewport);
    view_wview[i] = PEd_viewportGetWidth(_viewport);
    view_hview[i] = PEd_viewportGetHeight(_viewport);
    view_xport[i] = PEd_viewportGetPortX(_viewport);
    view_yport[i] = PEd_viewportGetPortY(_viewport);
    view_wport[i] = PEd_viewportGetPortWidth(_viewport);
    view_hport[i] = PEd_viewportGetPortHeight(_viewport);
    view_hborder[i] = PEd_viewportGetBorderHor(_viewport);
    view_vborder[i] = PEd_viewportGetBorderVer(_viewport);
    view_hspeed[i] = PEd_viewportGetSpeedHor(_viewport);
    view_vspeed[i] = PEd_viewportGetSpeedVer(_viewport);
    view_object[i] = PEd_viewportGetObject(_viewport);

    ////////////////////////////////////////////////////////////////////////////
    // Backgrounds
    var _background = PEd_roomGetBackground(_room, i);
    background_foreground[i] = PEd_backgroundIsForeground(_background);
    background_index[i] = PEd_backgroundGetImage(_background);
    background_visible[i] = PEd_backgroundGetVisible(_background);
    
    if (PEd_backgroundGetStretch(_background))
    {
        background_xscale[i] = _width / background_get_width(background_index[i]);
        background_yscale[i] = _height / background_get_height(background_index[i]);
        background_htiled[i] = false;
        background_vtiled[i] = false;
        background_x[i] = 0;
        background_y[i] = 0;
    }
    else
    {
        background_xscale[i] = 1;
        background_yscale[i] = 1;
        background_htiled[i] = PEd_backgroundGetTiledHor(_background);
        background_vtiled[i] = PEd_backgroundGetTiledVer(_background);
        background_x[i] = PEd_backgroundGetX(_background);
        background_y[i] = PEd_backgroundGetY(_background);
    }
}
