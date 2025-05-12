function scrRestart(){
	loadCheckpoint = instance_create_depth(0, 0, depth, objLoadCheckpoint);
	with (loadCheckpoint) {
		scrResetSurfaces();
		scrLoadGame();
	}
}