/// PEd_getTileCustomData()
/**
 * @brief Gets custom data common for all tiles.
 */
with (PEd_oEditor)
{
    ds_list_clear(customData);
    
    var _c;

    _c = PEd_createCustomDataContainer("Tile");
    PEd_addCustomData(_c, PEdDataTypes.Real, "Depth", PEd_tileGetDepth, PEd_tileSetDepth);
    PEd_registerCustomDataContainer(_c);
    
    _c = PEd_createCustomDataContainer("Transform");
    PEd_addCustomData(_c, PEdDataTypes.Vector2, "Location", PEd_tileGetPosX, PEd_tileSetPosX);
    PEd_addCustomData(_c, PEdDataTypes.Vector2, "", PEd_tileGetPosY, PEd_tileSetPosY);
    
    PEd_addCustomData(_c, PEdDataTypes.Vector2, "Scale", PEd_tileGetScaleX, PEd_tileSetScaleX);
    PEd_addCustomData(_c, PEdDataTypes.Vector2, "", PEd_tileGetScaleY, PEd_tileSetScaleY);
    PEd_registerCustomDataContainer(_c);
    
    _c = PEd_createCustomDataContainer("Blend");
    PEd_addCustomData(_c, PEdDataTypes.Colour, "Colour", PEd_tileGetColourARGB, PEd_tileSetColourARGB);
    PEd_registerCustomDataContainer(_c);
}
