/// @description /// Returns the complete bitmask for all button states
function getbuttonstates(argument0) {
	// Argument0: Controller index

	return external_call(global.__buttonState,argument0)



}
