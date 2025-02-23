if argument0=rmSequence1 {global.sequence=rmSequence2 return rmStore1}
if argument0=rmSequence2 {global.sequence=rmSequence3 return rmPizzaHut1}
if argument0=rmSequence3 {global.sequence=rmSequence4 return rmVideoStore1}
if argument0=rmSequence4 {global.parttitle[0]="PART TWO." global.parttitle[1]="QUESTIONS." global.nextlevel=rmDream2 global.sequence=rmPart return rmBar1}
if argument0=rmSequence5 {global.sequence=rmSequence6 return rmStore2}
if argument0=rmSequence6 {global.sequence=rmSequence7 return rmPizzaHut2}
if argument0=rmSequence7 {global.sequence=rmSequence8 return rmVideoStore2}
if argument0=rmSequence8 {global.parttitle[0]="PART THREE." global.parttitle[1]="VISITATIONS." global.nextlevel=rmDream3 global.sequence=rmPart return rmBar2}
if argument0=rmSequence9 {global.sequence=rmSequence10 return rmStore3}
if argument0=rmSequence10 {global.sequence=rmSequence11 return rmPizzaHut3}
if argument0=rmSequence11 {global.sequence=rmSequence12 return rmVideoStore3}
if argument0=rmSequence12 {global.parttitle[0]="PART FOUR." global.parttitle[1]="CONNECTIONS." global.nextlevel=rmSequence12bDownstairs global.sequence=rmPart return rmBar3}
if argument0=rmSequence12bDownstairs {global.sequence=rmSequence13Downstairs song=working_directory+"\DeepCover.mp3" return global.sequence}
if argument0=rmSequence13 {global.sequence=rmSequence14 song=working_directory+"\DeepCover.mp3" return global.sequence}
if argument0=rmSequence14 {global.sequence=rmChapter global.level=rmMansionEntrance global.pretitle="FINAL CHAPTER" global.title="SHOWDOWN" song="TurfMain.mp3" return global.sequence}
if argument0=rmMCBar {global.sequence=rmMCSequence2 song="ItsSafeNow.mp3" return global.sequence}
if argument0=rmMCSequence2 {global.sequence=rmMCSequence3 song="ItsSafeNow.mp3" return global.sequence}
if argument0=rmMCSequence3 {global.sequence=rmMCSequence4 song="ItsSafeNow.mp3" return global.sequence}
if argument0=rmMCSequence4 {global.sequence=rmBikeEnding song="ANewMorning.mp3" return global.sequence}
if argument0=rmChapter {global.sequence=rmMenu song=working_directory+"\HorseSteppin.mp3" return global.sequence}
//if argument0=rmChapter {global.sequence=rmMenu song=working_directory+"\HorseSteppin.mp3" return global.sequence}
