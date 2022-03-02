/// PEd_actShowInfo()
/**
 * @brief Shows message containing info about PushEd. 
 */
if (!PEd_guiShapeExists(guiWindowInfo))
{
    var _info = PEd_guiCreateWindow("Info");
    var _width = 450;
    var _height = 150;
    PEd_guiShapeSetPosition(_info,
        round((windowWidth - _width) * 0.5),
        round((windowHeight - _height) * 0.5));
    PEd_guiShapeSetSize(_info, _width, _height);
    var _infoContainer = _info[? "container"];
    PEd_guiWindowSetContent(_info, PEd_guiContentInfo);
    PEd_guiAddItem(guiRoot, _info);
    guiWindowInfo = _info;
}
