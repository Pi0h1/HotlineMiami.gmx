var i, test;
i=0
test=1
repeat (9) {
if global.usedgun[i]=0 test=0
i+=1
}
if test=1 SteamSetAchievement("ACH_GUNS_FOR_SHOW")
