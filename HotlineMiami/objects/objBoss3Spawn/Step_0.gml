if (global.done) {
    if (objPlayer.y < 288) {
		checkpoint_save(working_directory + "\\tempsave.sav");
        instance_destroy();
        instance_create(352, -160, objVan);
    }
}

