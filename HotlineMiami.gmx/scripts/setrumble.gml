////// Sets controller Force Feedback
// Argument0: Controller index
// Argument1: Left motor vibration (0-65535)
// Argument2: Right motor vibration (0-65535)

return external_call(global.__rumble,argument0,argument1,argument2)
