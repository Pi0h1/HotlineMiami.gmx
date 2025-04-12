var i, test;
i=0
test=1
repeat (7) {
if global.usedthrow[i]=0 test=0
i+=1
}
if test=1 SteamSetAchievement("ACH_PITCHER")
