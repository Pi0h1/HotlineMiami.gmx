function scrLoadScore(){
	var Name = "Score";
	var Extension = ".sav";
	var file = (Name + Extension);

	var debugMessage = "State of "+ Name +" loaded";

	with (objSurfacer) instance_destroy();

	if (file_exists(file))
	{
	    var _wrapper = LoadJSONFromFile(file)
	    var _list = _wrapper[? "ROOT"];
    
	    for (var i = 0; i < ds_list_size(_list); i++)
	    {
	        var _map = _list[| i];
        
	            // Custom Variables
	        global.drawscore = _map[? "drawscore" ]; 
	        global.myscore = _map[? "myscore" ];
	        global.combotime = _map[? "combotime"];
	        global.comboscore = _map[? "comboscore"];
	        global.killscore = _map[? "killscore"];
	        global.boldscore = _map[? "boldscore"];
	        global.timescore = _map[? "timescore"];
	        global.flexibilityscore = _map[? "flexibilityscore"];
	        global.mobilityscore = _map[? "mobilityscore"];
	        global.specialscore = _map[? "specialscore"];
	        global.noguns = _map[? "noguns"];
	        global.switchweapon = _map[? "switchweapon"];
	        global.neverseen = _map[? "neverseen"];
	        global.nomiss = _map[? "nomiss"];
	        global.oneweapon = _map[? "oneweapon"];
	        global.punchonly = _map[? "punchonly"];
	        global.combo = _map[? "combo"];
	        global.kills = _map[? "kills"];
	        global.time = _map[? "time"];  
	    }
    
	    ds_map_destroy(_wrapper);
	    show_debug_message(debugMessage);
    
	}
}