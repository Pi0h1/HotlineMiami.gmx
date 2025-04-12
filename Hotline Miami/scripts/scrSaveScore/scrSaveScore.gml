function scrSaveScore(){
	var Name = "Score";
	var Extension = ".sav";
	var file = (Name + Extension);

	var debugMessage = "State of "+ Name +" saved";

	// Create a root list
	var _root_list = ds_list_create();

	// For every instance, create a map
	var _map = ds_map_create();
	ds_list_add(_root_list,_map);
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
    
	    // Custom Variables
	ds_map_add (_map, "drawscore", global.drawscore);
	ds_map_add (_map, "myscore", global.myscore);
	ds_map_add (_map, "combotime", global.combotime);
	ds_map_add (_map, "comboscore", global.comboscore);
	ds_map_add (_map, "killscore", global.killscore);
	ds_map_add (_map, "boldscore", global.boldscore);
	ds_map_add (_map, "timescore", global.timescore);
	ds_map_add (_map, "flexibilityscore", global.flexibilityscore);
	ds_map_add (_map, "mobilityscore", global.mobilityscore);
	ds_map_add (_map, "specialscore", global.specialscore);
	ds_map_add (_map, "noguns", global.noguns);
	ds_map_add (_map, "switchweapon", global.switchweapon);
	ds_map_add (_map, "neverseen", global.neverseen);
	ds_map_add (_map, "nomiss", global.nomiss);
	ds_map_add (_map, "oneweapon", global.oneweapon);
	ds_map_add (_map, "punchonly", global.punchonly);
	ds_map_add (_map, "combo", global.combo);
	ds_map_add (_map, "kills", global.kills);
	ds_map_add (_map, "time", global.time);


	// Wrap the root LIST up in a MAP
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", _root_list);

	// Save all of this to a string
	var _string = json_encode(_wrapper)
	SaveStringToFile(file,_string);

	// Nuke the data
	ds_map_destroy(_wrapper);

	show_debug_message(debugMessage);
}