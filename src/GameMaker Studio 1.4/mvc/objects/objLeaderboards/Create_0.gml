if surface_exists(global.surf1) surface_free(global.surf1)
global.surf1 = surface_create(room_width, room_height)
song = working_directory + "\\Daisuke.mp3"
bonuses = ""
parscore = "/5000pts";
current = 0;
dir = 180;
dir2 = 0;
cdir = 0;
gradex = -10;
gradeon = 0;
alpha = 0;
level = "";
time = -1;
myscore = -1;
type = "GENERIC";
maxpoints = 28000;
skillpoints = -1;
grade = "F";
lastgrade = grade;
highscore = 0;
i = 0;
repeat(64) {
    repeat((64 - i) * 0.1) instance_create(136 + i + random(128 - i * 2), room_height * 0.6 + i, objSunSparkle);
    i += 1;
}
housex = 0;
dir = random(360);
factor = 0;
fade = 0;
c_amount = 0;
loadingIndex = 0;
global.currentlevel = 1;
if global.grade[global.currentlevel - 1] < scrGradeToNumber(grade) global.grade[global.currentlevel - 1] = scrGradeToNumber(grade)
global.lastgrade = scrGradeToNumber(grade);

loadingIconSpeed = .125;

