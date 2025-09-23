var i, test;
i=0
test=1
repeat (26) {
if global.usedmask[i]=0 test=0
i+=1
}
if test=1 SteamSetAchievement("ACH_SOUNDS_OF_ANIMALS_FIGHTING")
