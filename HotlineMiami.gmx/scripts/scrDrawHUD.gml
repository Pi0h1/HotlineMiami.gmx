var scale = 1;
dir += (1 + update * 7) * delta
global.dir += 1 * delta
logicCombo    ();
logicScore    ();
logicAmmo     ();
logicTutorial ();
if finish = 1   {txtScore(view_wview[0]/2,view_hview-11,finishstring,fntScore,scale                              )}
if ammoy > -32  {txtScore(18+(string_width(ammostring)*0.5), view_hview[0]-ammoy, ammostring, fntScore,scale     )}
if update       {txtScore(view_wview[0]-18 - string_width(scorestring)*0.5,20,scorestring,fntScore,scale         )}
else            {txtScore(view_wview[0]-18 - string_width(scorestring)*0.5,20,scorestring,fntScoreUpdate,scale   )}
if global.combo>1 {txtScore(32,20,string(global.combo)+"x",fntScore,scale)}
