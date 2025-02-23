/// PEd_instanceDestroy(id)
/**
 * @brief Destroys the instance and removes it from the room that it is in.
 * @param {real} id The id of the instance.
 */
var _instances = PEd_roomGetInstances(argument0.pedRoom);
var _pos = ds_list_find_index(_instances, argument0);
if (_pos != -1)
{
    ds_list_delete(_instances, _pos);
}
with (argument0) { instance_destroy(); }
