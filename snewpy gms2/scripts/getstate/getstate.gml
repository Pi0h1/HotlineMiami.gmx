/// @description /// Returns the state of a controller
function getstate(argument0) {
	// Argument0: Controller index

	return external_call(global.__getState,argument0)



}
