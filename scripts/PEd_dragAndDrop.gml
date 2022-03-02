/// PEd_dragAndDrop()
/**
 * @brief Handles instance drag and drop.
 */
if (editMode == PEdEditModes.Object
    && mouseInViewport) 
{
    var _room  = PEd_getCurrentRoom();
    var _space = PEd_getMouseWorldPosition(_room);
    
    ////////////////////////////////////////////////////////////////////////////
    // Drop instance
    if (guiDnDObject != -1
        && mouse_check_button(mb_left)) 
    {
        var i = PEd_instanceCreate(_room, _space[0], _space[1], guiDnDObject);
        PEd_instanceSetPosZ(i, _space[2]);
        
        with (i) 
        {
            pivotOffX = 0;
            pivotOffY = 0;
            pivotOffZ = 0;
        }
        
        // Save instance id
        pedDnDInstance            = i;
        contentBrowserIndexObject = -1;
        guiDnDObject              = -1;
    }
    
    ////////////////////////////////////////////////////////////////////////////
    // Move dropped instance
    if (pedDnDInstance != noone
        && mouse_check_button(mb_left))
    {
        PEd_instanceSetPosX(pedDnDInstance, _space[0]);
        PEd_instanceSetPosY(pedDnDInstance, _space[1]);
        PEd_instanceSetPosZ(pedDnDInstance, _space[2]);
    }
}
