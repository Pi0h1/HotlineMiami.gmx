function scrLoadGame(){
/*    var data = json_parse(json_string);
    var keys = ds_map_keys(data);

    for (var i = 0; i < array_length(keys); i++) {
        var var_name = keys[i];
        variable_instance_set(inst, var_name, data[var_name]);
    }


// Example: Load variables back into an instance
if (file_exists("object_save.json")) {
    var file = file_text_open_read("object_save.json");
    var json_string = file_text_read_string(file);
    file_text_close(file);

    load_object_data(id, json_string);
}
*/
	
	var file = working_directory+"\\tempsave.sav"
	scrLoadFurniture();
	scrLoadEnemies();
	scrLoadPlayer();
	scrLoadEffector();
	scrLoadSurface();
	scrLoadSurfaceManager();
	scrLoadScore();
	scrLoadWeapons();
	scrLoadMisc();
	scrDestroyObjects();
	show_debug_message("Loaded game state from JSON files")
	
}