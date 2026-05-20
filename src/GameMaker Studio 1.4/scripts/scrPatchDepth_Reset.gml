/*
Post-Studio GameMaker changed how depth relates to instance order.
Newer objects have more depth rather than less.
Being made in Legacy, Hotline Miami expects the opposite.
*/

// This should be called upon room_start and when initializing the variables.
global.depthDebris = 1;
global.depthCorpse = 1;
global.depthBlood = 1;
global.depthGore = 1;
