var Name = "Weapons";
var Extension = ".sav";
var file = (Name + Extension);

var debugMessage = "State of "+ Name +" loaded";

with (objWeapon) instance_destroy();

if (file_exists(file))
{
    var _wrapper = LoadJSONFromFile(file)
    var _list = _wrapper[? "ROOT"];
    
    for (var i = 0; i < ds_list_size(_list); i++)
    {
        var _map = _list[| i];
        
        var _obj = _map[? "obj"]
        with (instance_create(0,0,asset_get_index(_obj)))
        {
            x = _map[? "x"];
            y = _map[? "y"];
        }
    }
    
    ds_map_destroy(_wrapper);
    show_debug_message(debugMessage);
    
}
