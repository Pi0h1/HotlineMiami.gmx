if room=rmMCBar {
global.done=0
global.phone=0
global.package=0
global.level=rmNoodleShop
global.pretitle="SIXTEENTH CHAPTER"
global.title="SAFEHOUSE"
global.sequence=rmMCBar
global.revisit=0
return rmMCChapter
}
if room=rmNoodleShop return rmScore
if room=rmMCSequence2Downstairs return rmMCChapter
if room=rmArcadeDownstairs return rmScore
if room=rmMCSequence3Downstairs return rmMCChapter
if room=rmPhoneHomEntranceBiker return rmMCSequence4
if room=rmMCSequence4Downstairs return rmMCChapter
if room=rmJanitors return rmBikeEnding
return room
