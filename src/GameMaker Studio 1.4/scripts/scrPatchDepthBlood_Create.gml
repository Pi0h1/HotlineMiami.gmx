/*
Post-Studio GameMaker changed how depth relates to instance order.
Newer objects have more depth rather than less.
Being made in Legacy, Hotline Miami expects the opposite.
*/

// This should be called on the create event of blood objects that stay still.
depth = 999998;
depth -= global.depthBlood;
global.depthBlood++;
