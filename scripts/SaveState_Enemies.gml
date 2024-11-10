var Name = "Enemies";
var Extension = ".sav";
var file = (Name + Extension);

var debugMessage = "State of "+ Name +" saved";

// Create a root list
var _root_list = ds_list_create();

// For every instance, create a map
with (objEnemy) {
    var _map = ds_map_create();
    ds_list_add(_root_list,_map);
    ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
    
    var _obj = object_get_name(object_index);
    ds_map_add (_map, "obj", _obj);
    saveVariableState(_map,"x");
    saveVariableState(_map,"y");
    saveVariableState(_map,"sprite_index");
    saveVariableState(_map,"image_index");
    saveVariableState(_map,"image_blend");
    saveVariableState(_map,"image_angle");
    saveVariableState(_map,"image_xscale");
    saveVariableState(_map,"image_yscale");
    saveVariableState(_map,"image_alpha");
    saveVariableState(_map,"direction");
    saveVariableState(_map,"speed");

    // Custom variables
    saveVariableState(_map,"startx");
    saveVariableState(_map,"starty");
    saveVariableState(_map,"ammo");
    saveVariableState(_map,"energie");
        
}

// Wrap the root LIST up in a MAP
var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", _root_list);

// Save all of this to a string
var _string = json_encode(_wrapper)
SaveStringToFile(file,_string);

// Nuke the data
ds_map_destroy(_wrapper);

show_debug_message(debugMessage);
