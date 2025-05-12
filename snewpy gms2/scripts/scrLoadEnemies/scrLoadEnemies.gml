function scrLoadEnemies(){
	var Name = "Enemies";
	var Extension = ".sav";
	var file = (Name + Extension);

	var debugMessage = "State of "+ Name +" loaded";

	with (objEnemy) {
	    if path_index > 0{
	        path_delete(path);
	    }
	    instance_destroy();
	}

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
	            loadVariableState(_map,"x");
	            loadVariableState(_map,"y");
	            loadVariableState(_map,"sprite_index");
	            loadVariableState(_map,"image_index");
	            loadVariableState(_map,"image_blend");
	            loadVariableState(_map,"image_angle");
	            loadVariableState(_map,"image_xscale");
	            loadVariableState(_map,"image_yscale");
	            loadVariableState(_map,"image_alpha");
	            loadVariableState(_map,"direction");
	            loadVariableState(_map,"speed");
            
	            //Custom Variables
	            loadVariableState(_map,"ammo");
	            loadVariableState(_map,"energie");
	            loadVariableState(_map,"startx");
	            loadVariableState(_map,"starty");
	        }
	    }
    
	    ds_map_destroy(_wrapper);
	    show_debug_message(debugMessage);
    
	}
}