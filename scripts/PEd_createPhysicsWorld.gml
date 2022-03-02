/// PEd_createPhysicsWorld(enabled, gravityX, gravityY, pxToM)
/**
 * @brief Creates a physics world.
 * @param {bool} enabled  True to enable physics.
 * @param {real} gravityX The gravity on the x axis.
 * @param {real} gravityY The gravity on the y axis.
 * @param {real} pxToM    Pixel to meter ratio.
 * @return {real} The id of the physics world.
 */
var _physicsWorld = ds_map_create();
_physicsWorld[? "enabled"] = argument[0];
_physicsWorld[? "gravityX"] = argument[1];
_physicsWorld[? "gravityY"] = argument[2];
_physicsWorld[? "pxToM"] = argument[3];
return _physicsWorld;
