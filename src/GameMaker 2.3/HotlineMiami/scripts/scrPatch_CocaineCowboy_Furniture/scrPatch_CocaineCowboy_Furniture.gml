function scrCocaineCowboy_FurniturePatch() {
	// Fix for furniture placement in the early beta levels.

	if instance_exists(objSofaH64) {
	    with objSofaH64 {
	        x += (sprite_get_width(sprite_index)/2);
	        y += (sprite_get_height(sprite_index)/2);
	    }
	}

	if instance_exists(objSofaH48) {
	    with objSofaH48 {
	        x += (sprite_get_width(sprite_index)/2);
	        y += (sprite_get_height(sprite_index)/2);
	    }
	}




}
