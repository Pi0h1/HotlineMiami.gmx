function scrSaveGame(){
	var file = working_directory+"\\tempsave.sav";
	var _root_list = ds_list_create();
	with (all) {
		var instArray = variable_instance_get_names(self);
		var map = ds_map_create();
		ds_list_add(_root_list,map);
		ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
		ds_map_add ( map, "object", object_get_name(object_index) );
		for (var i = 0; i < array_length(instArray); i++) {
			ds_map_add( map, instArray[i], variable_instance_get(self, instArray[i]) );
		}
		ds_map_destroy(map);
	}
		// Wrap the root LIST up in a MAP
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", _root_list);

	// Save all of this to a string
	var _string = json_encode(_wrapper)
	SaveStringToFile(file,_string);
	
	// Nuke the data
	ds_map_destroy(_wrapper);
	ds_list_destroy(_root_list);
	/*
	scrSaveFurniture();
	scrSaveEnemies();
	scrSavePlayer();
	scrSaveEffector();
	scrSaveCurrentSurface();
	scrSaveSurfaceManager();
	scrSaveScore();
	scrSaveMisc();
	*/
}