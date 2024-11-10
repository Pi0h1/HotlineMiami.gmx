var i, test;
i=0
test=1
repeat (9) {
if global.usedmelee[i]=0 test=0
i+=1
}
if test=1 SteamSetAchievement("ACH_KNIFE_FOR_PROS")
