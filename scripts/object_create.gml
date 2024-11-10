/// object_create(object)
// This script creates an object only if it doesn't exist.

if (!instance_exists(argument0)) {
    instance_create(x,y,argument0);
}
