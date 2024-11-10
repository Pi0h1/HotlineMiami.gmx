/// PEd_getRoomCustomData()
/**
 * @brief Gets custom data common for all rooms.
 */
with (PEd_oEditor)
{
    ds_list_clear(customData);
    
    var _c;

    _c = PEd_createCustomDataContainer("Room");
    PEd_addCustomData(_c, PEdDataTypes.String, "Name", PEd_roomGetName, PEd_roomSetName);
    PEd_addCustomData(_c, PEdDataTypes.String, "Caption", PEd_roomGetCaption, PEd_roomGetCaption);
    PEd_addCustomData(_c, PEdDataTypes.String, "Creation Code", PEd_roomGetCode, PEd_roomSetCode);
    PEd_addCustomData(_c, PEdDataTypes.Real, "Speed", PEd_roomGetSpeed, PEd_roomSetSpeed);
    PEd_addCustomData(_c, PEdDataTypes.Bool, "Persistent", PEd_roomGetPersistent, PEd_roomSetPersistent);
    
    PEd_addCustomData(_c, PEdDataTypes.Vector2, "Size", PEd_roomGetWidth, PEd_roomSetWidth);
    PEd_addCustomData(_c, PEdDataTypes.Vector2, "", PEd_roomGetHeight, PEd_roomSetHeight);
    
    PEd_addCustomData(_c, PEdDataTypes.Vector3, "Grid", PEd_roomGetSnapH, PEd_roomSetSnapH);
    PEd_addCustomData(_c, PEdDataTypes.Vector3, "", PEd_roomGetSnapV, PEd_roomSetSnapV);
    PEd_addCustomData(_c, PEdDataTypes.Vector3, "", PEd_roomGetSnapD, PEd_roomSetSnapD);
    PEd_registerCustomDataContainer(_c);
    
    _c = PEd_createCustomDataContainer("Background");
    PEd_addCustomData(_c, PEdDataTypes.Colour, "Colour", PEd_roomGetColourARGB, PEd_roomSetColourARGB);
    PEd_addCustomData(_c, PEdDataTypes.Bool, "Show Colour", PEd_roomGetShowColour, PEd_roomSetShowColour);
    PEd_addCustomData(_c, PEdDataTypes.Background, "Image", PEd_roomGetBackground, noone);
    PEd_registerCustomDataContainer(_c);
}
