/// PEd_instanceCreate(room, x, y, object)
/**
 * @brief Creates an instance of the object and adds it to the room.
 * @param {real} room   The id of the room.
 * @param {real} x      The x position to create the instance at.
 * @param {real} y      The y position to create the instance at.
 * @param {real} object The id of the object to create an instance of.
 * @return {real} The instance id.
 */
var _room = argument0;
var _x = argument1;
var _y = argument2;
var _object = argument3;
var _instances = PEd_roomGetInstances(_room);

////////////////////////////////////////////////////////////////////////////////
// In game
if (room != PEd_rmEditor)
{
    with (instance_create(_x, _y, _object))
    {
        pedRoom = _room;
        ds_list_add(_instances, id);
        return id;
    }
}

////////////////////////////////////////////////////////////////////////////////
// In editor
if (PEd_CREATE_DUMMY_2D)
{
    var _id;
    
    if (object_is_ancestor(_object, PEd_oObject3D))
    {
        // 3D object
        _id = instance_create(_x, _y, _object);
    }
    else
    {
        // 2D dummy
        _id = instance_create(_x, _y, PEd_oObject2D);
        _id.pedObjectName = object_get_name(_object);
        var _sprite = object_get_sprite(_object);
        if (_sprite >= 0)
        {
            _id.sprite_index = _sprite;
        }
    }
    
    with (_id)
    {
        pedRoom = _room;
        ds_list_add(_instances, id);
        return id;
    }
}
else
{
    with (instance_create(_x, _y, _object))
    {
        if (!object_is_ancestor(object_index, PEd_oObject3D))
        {
            event_perform_object(PEd_oObject3D, ev_create, 0);
        }
        pedRoom = _room;
        ds_list_add(_instances, id);
        return id;
    }
}
