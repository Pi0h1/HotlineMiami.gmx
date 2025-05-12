function scrLoadEffector(){
	var Name = "Effector";
	var Extension = ".sav";
	var file = (Name + Extension);

	var debugMessage = "State of "+ Name +" loaded";

	with (objEffector) instance_destroy();

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
	            x = objPlayer.x;
	            y = objPlayer.y;
	            sprite_index = _map[? "sprite_index"];
	            image_index = _map[? "image_index"];
	            image_blend = _map[? "image_blend"];
	            image_angle = _map[? "image_angle"];
	            image_xscale= _map[? "image_xscale"];
	            image_yscale= _map[? "image_yscale"];
	            image_alpha = _map[? "image_alpha"];
	        }
	    }
    
	    ds_map_destroy(_wrapper);
	    show_debug_message(debugMessage);
    
	}
}