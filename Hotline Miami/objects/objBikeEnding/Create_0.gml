if global.xbox=1 scrInitXboxButtons()
global.levels[19]=1
scrSaveUnlocked()
global.newguns=0
if global.ending=0 and global.masks[18]=0 {SteamSetAchievement("ACH_THATS_IT") global.sequence=rmMCSequence2Downstairs global.newmask[global.newmasks]=18 global.newmasks+=1 global.lastgrade=0}
if global.ending=1 and global.masks[20]=0 {SteamSetAchievement("ACH_THAT_IS_IT") global.sequence=rmMCSequence3Downstairs global.newmask[global.newmasks]=20 global.newmasks+=1 global.lastgrade=0}
image_speed=0
x=-96
state=0
targety=y-6+random(12)
centery=y
dir=0
fade=0
c_amount=0
credits_y=room_height

global.grade[19]=15
start_time=current_time
credits="a game by##DENNATON####game design by##JONATAN SODERSTROM##& DENNIS WEDIN####graphics artist##DENNIS WEDIN####additional graphics##JONATAN SODERSTROM####programmer##JONATAN SODERSTROM######additional programming##OSCAR DRAGEN####sound effects##JORDAN FEHR####mac version##LEON ARNOTT######published by##DEVOLVER DIGITAL##-----------##GRAEME STRUTHERS##NIGEL LOWRIE##RICK STULTS##MIKE WILSON##HARRY MILLER##STEPHANIE TINSLEY-SCHOPP##KIRK JOHNSON##WILL ELLIOTT######music by##SUN ARAW##COCONUTS##M.O.O.N.##JASPER BYRNE##EL HUERVO##PERTURBATOR##SCATTLE##ELIOTT BERLIN##EIRIK SUHRKE######special thanks to####TIM W##VILLE KRUMLINDE##JEFF ROBERTS##NIKLAS AKERBLAD##MATS EK##PETER RASMUSSON##MARTIN SVENSSON##OSCAR DRAGEN##MARKUS LARSSON##LINDA PARLESTEN##NIGEL LOWRIE##JAN WILLEM NIJMAN##RAMI ISMAIL#############THE END##########################THANK YOU FOR PLAYING!"
