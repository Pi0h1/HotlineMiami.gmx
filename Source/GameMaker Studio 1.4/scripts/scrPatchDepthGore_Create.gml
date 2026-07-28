/*
Post-Studio GameMaker changed how depth relates to instance order.
Newer objects have more depth rather than less.
Being made in Legacy, Hotline Miami expects the opposite.
*/

// This should be called on the create event of gore objects.
depth = 99999;
depth -= global.depthGore;
global.depthGore++;
