/// @description (Old DnD) - Allows bouncing of the calling instance
/// @param advanced Whether to enable advanced bouncing (true) or not (false)
/// @param useall true if bouncing off non-solid and solid
function action_bounce(argument0, argument1) {
	var __useall = argument1;
	if (!__useall) {
		move_bounce_solid(argument0);
	} else {
		move_bounce_all(argument0);
	}



}
