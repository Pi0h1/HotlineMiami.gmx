var test, i;
test=0
i=0 
repeat (20){
if global.grade[i]<15 test+=1
i+=1
}
if test<=4 SteamSetAchievement("ACH_GET_A_LIFE")
