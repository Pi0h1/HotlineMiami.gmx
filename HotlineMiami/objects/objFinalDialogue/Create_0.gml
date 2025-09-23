my_y = 0;
global.dir = 0;
dir = 0;
wait = 0;
phonex = 0;
blackx = 15;
line1x = 0;
line2x = 0;
index = sprBiker;
start = 0;
stop = 0;
if (global.xbox)
    scrInitXboxButtons();
question = 1;
question1[0] = "What's going on down here?";
question2[0] = "Who are you people?";
question1[1] = "Who are you working for?";
question2[1] = "You're the phone guys?";
question1[2] = "You think this is a game?";
question2[2] = "Why are you doing this?";
question1[3] = "Why are you killing people?";
question2[3] = "It's all been pointless?";
question1[4] = "That's it?";
question2[4] = "Any last words?";
currentquestion = 0;

fade = 0;

sprite = sprDialogueFaces;
change = 0;
current = 0;
select = -1;
if (global.xbox)
    select = 0;
reload = 0;
image_xscale = 1.5;
image_yscale = 1.5;

