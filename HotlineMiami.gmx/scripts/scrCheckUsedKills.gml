var i, test;
i=0
test=1
repeat (21) {
if global.usedkill[i]=0 test=0
i+=1
}
if test=1 SteamSetAchievement("ACH_ALWAYS_ON_TOP")
