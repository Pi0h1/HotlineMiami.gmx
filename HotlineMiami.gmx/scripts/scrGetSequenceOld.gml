if argument0=rmSequence1 {global.sequence=rmSequence2 return global.sequence}
if argument0=rmSequence2 {global.sequence=rmSequence3 return global.sequence}
if argument0=rmSequence3 {global.sequence=rmSequence4 return global.sequence}
if argument0=rmSequence4 {global.parttitle[0]="PART TWO" global.parttitle[1]="QUESTIONS" global.nextlevel=rmDream2 global.sequence=rmPart return global.sequence}
if argument0=rmSequence5 {global.sequence=rmSequence6 return global.sequence}
if argument0=rmSequence6 {global.sequence=rmSequence7 return global.sequence}
if argument0=rmSequence7 {global.sequence=rmSequence8 return global.sequence}
if argument0=rmSequence8 {global.parttitle[0]="PART THREE" global.parttitle[1]="VISITATIONS" global.nextlevel=rmDream3 global.sequence=rmPart return global.sequence}
if argument0=rmSequence9 {global.sequence=rmSequence12 return global.sequence}
if argument0=rmSequence12 {song=working_directory+"\Static.mp3" global.sequence=rmSequence12bDownstairs return global.sequence}
if argument0=rmSequence12bDownstairs {global.sequence=rmSequence13Downstairs return global.sequence}
if argument0=rmSequence13 {global.sequence=rmMenu song=working_directory+"\HorseSteppin.mp3" return global.sequence}
