function legacy_save(file){
	//game_save(file);
	scrSaveGame();
	show_debug_message("SAVED: " + file);
}

function legacy_load(file){
	//game_load(file);
	scrLoadGame();
	show_debug_message("LOADED: " + file);
}