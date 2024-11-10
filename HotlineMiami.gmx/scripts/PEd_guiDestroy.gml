/// PEd_guiDestroy()
/**
 * @brief Destroys GUI.
 */
for (var i = 0; i < ds_list_size(guiShapes); i++)
{
    var _shape = guiShapes[| i];
    var _scrCleanUp = _shape[? "scrCleanUp"];
    if (_scrCleanUp != noone)
    {
        script_execute(_scrCleanUp, _shape);
    }
}
ds_list_destroy(guiShapes);
