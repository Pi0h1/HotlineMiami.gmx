var i, test;
i=0
test=1
repeat (16) {
if global.letter[i]=0 test=0
i+=1
}
if test=1 SteamSetAchievement("ACH_EYE_FOR_DETAILS")
