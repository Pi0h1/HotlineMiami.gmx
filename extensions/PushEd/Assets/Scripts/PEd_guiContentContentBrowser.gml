/// PEd_guiContentContentBrowser(container)
/**
 * @brief Draws the content of a Content Browser to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _container = argument0;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _contentX = round(guiLineHeight * 0.75);
var _contentY = 0;
var _room = PEd_getCurrentRoom();

////////////////////////////////////////////////////////////////////////////////
//
// Objects
//

// Draw section
if (PEd_guiDrawSection("Objects", _contentX, _contentY, contentBrowserShowObjects)) 
{
    contentBrowserShowObjects = !contentBrowserShowObjects;
}
_contentY += guiLineHeight;

// Object list
if (contentBrowserShowObjects) 
{
    for (var i = 0; i < PEd_objectListGetSize(); i++) 
    {
        var _name = PEd_objectListGetItem(i);
        if (_name != ""
            && (contentBrowserFilter == ""
            || string_pos(string_lower(contentBrowserFilter), string_lower(_name)) != 0)) 
        {
            if (PEd_guiDrawListItem(_name, _contentX, _contentY, contentBrowserIndexObject == i, editMode != 0)) 
            {
                // Create object
                var _objectIndex = asset_get_index(_name);
                if (contentBrowserIndexObject == i) 
                {
                    var _id = PEd_instanceCreate(_room, PEd_oPivot.x, PEd_oPivot.y, _objectIndex);
                    PEd_instanceSetPosX(_id, PEd_oPivot.x);
                    PEd_instanceSetPosY(_id, PEd_oPivot.y);
                    PEd_instanceSetPosZ(_id, PEd_oPivot.z);
                    PEd_selectObject(_id, true);
                    contentBrowserIndexObject = -1; // Select none (to avoid accidental instance creation)
                }
                else 
                {
                    contentBrowserIndexObject = i;
                    guiDnDObject = _objectIndex;
                }
            }
            _contentY += guiLineHeight;
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Backgrounds
//

// Draw section
if (PEd_guiDrawSection("Backgrounds", _contentX, _contentY, contentBrowserShowBackgrounds)) 
{
    contentBrowserShowBackgrounds = !contentBrowserShowBackgrounds;
}
_contentY += guiLineHeight;

// Backgound list
if (contentBrowserShowBackgrounds) 
{
    bkgShow = -1;
    var i = 0;
    do 
    {
        var _name = background_get_name(i);
        if (_name != "<undefined>"
            && (contentBrowserFilter == ""
            || string_pos(string_lower(contentBrowserFilter), string_lower(_name)) != 0)) 
        {
            var _item = PEd_guiDrawListItem(_name, _contentX, _contentY, contentBrowserIndexBackground == i, false)
            if (_item > 0) 
            {
                contentBrowserIndexBackground = i;
                guiDnDBackground = i;
                PEd_guiRequestRedrawAll(guiRoot)
            }
            else if (_item < 0)
            {
                bkgShow = i;
            }
            _contentY += guiLineHeight;
        }
        background_get_name(i);
        i++;
    }
    until (background_get_name(i) == "<undefined>");
}

return PEd_vec2(_containerWidth, _contentY);
