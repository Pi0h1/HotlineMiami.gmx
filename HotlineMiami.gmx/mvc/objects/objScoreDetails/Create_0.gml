if (global.xbox)
    scrInitXboxButtons();
if (surface_exists(global.surf1))
    surface_free(global.surf1);
global.surf1 = surface_create(room_width, room_height);
song = working_directory + "\\Daisuke.mp3";
bonuses = "";
i = 0;
repeat (ds_list_size(global.bonuslist)) {
    bonuses += ds_list_find_value(global.bonuslist, i) + "#";
    i++;
}
parscore = "/5000pts";
current = 0;
dir = 180;
dir2 = 0;
cdir = 0;
gradex = -10;
gradeon = 0;
alpha = 0;
level = global.title;
time = global.time;
myscore = global.myscore;

type = "GENERIC";
maxpoints = scrGetMaxpoints();

skillpoints = global.myscore;
grade = "F";
if (skillpoints < maxpoints * (1 / 15))
    grade = "F-";
if (skillpoints > maxpoints * (2 / 15))
    grade = "F";
if (skillpoints > maxpoints * (3 / 15))
    grade = "F+";
if (skillpoints > maxpoints * (4 / 15))
    grade = "D-";
if (skillpoints > maxpoints * (5 / 15))
    grade = "D";
if (skillpoints > maxpoints * (6 / 15))
    grade = "D+";
if (skillpoints > maxpoints * (7 / 15))
    grade = "C-";
if (skillpoints > maxpoints * (8 / 15))
    grade = "C";
if (skillpoints > maxpoints * (9 / 15))
    grade = "C+";
if (skillpoints > maxpoints * (10 / 15))
    grade = "B-";
if (skillpoints > maxpoints * (11 / 15))
    grade = "B";
if (skillpoints > maxpoints * (12 / 15))
    grade = "B+";
if (skillpoints > maxpoints * (13 / 15))
    grade = "A-";
if (skillpoints > maxpoints * (14 / 15))
    grade = "A";
if (skillpoints > maxpoints * (15 / 15))
    grade = "A+";
global.currentlevel = scrGetCurrentLevel();
lastgrade = grade;
if (global.grade[global.currentlevel - 1] < scrGradeToNumber(grade))
    global.grade[global.currentlevel - 1] = scrGradeToNumber(grade);
if (global.myscore > global.highscore[global.currentlevel - 1])
    global.highscore[global.currentlevel - 1] = global.myscore;
highscore = global.highscore[global.currentlevel - 1];
global.lastgrade = scrGradeToNumber(grade);
if (string_count("exposure", string_lower(bonuses)) > 6)
    type = "EXHIBITIONIST";
if (string_count("pressure", string_lower(bonuses)) > 3)
    type = "IMPROVISER";
if (string_count("sharp", string_lower(bonuses)) > 2)
    type = "MARKSMAN";
if (string_count("combo", string_lower(bonuses)) > 5)
    type = "COMBO BREAKER";
if (string_count("sneaky", string_lower(bonuses)) > 1)
    type = "COWARD";
if (string_count("projectile", string_lower(bonuses)) > 1)
    type = "PITCHER";
if (string_count("door", string_lower(bonuses)) > 4)
    type = "DOOR MAN";
if (string_count("mercy", string_lower(bonuses)) > 2)
    type = "CHIROPRACTOR";
if (string_count("7x", string_lower(bonuses)) > 0 || string_count("6x", string_lower(bonuses)) > 0 || string_count("5x", string_lower(bonuses)) > 0 || string_count("4x", string_lower(bonuses)) > 0)
    type = "COMBO TRAINEE";
if (string_count("10x", string_lower(bonuses)) > 0 || string_count("8x", string_lower(bonuses)) > 0 || string_count("9x", string_lower(bonuses)) > 0 || string_count("11x", string_lower(bonuses)) > 0)
    type = "COMBO SPECIALIST";
if (string_count("12x", string_lower(bonuses)) > 0 || string_count("13x", string_lower(bonuses)) > 0 || string_count("14x", string_lower(bonuses)) > 0 || string_count("15x", string_lower(bonuses)) > 0)
    type = "COMBO MASTER";
if (string_count("execution", string_lower(bonuses)) > 4)
    type = "EXECUTIONER";
if (string_count("execution", string_lower(bonuses)) > 10)
    type = "SADIST";
if (string_count("sharp", string_lower(bonuses)) > 6)
    type = "COWARD";
if (string_count("exposure", string_lower(bonuses)) == 0)
    type = "INVISIBLE MAN";
i = 0;
repeat(64) {
    repeat((64 - i) * 0.1) instance_create(136 + i + random(128 - i * 2), room_height * 0.6 + i, objSunSparkle);
    i++;
}
housex = 0;

dir = random(360);
factor = 0;
fade = 0;
c_amount = 0;

