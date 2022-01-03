dir += 1 + update * 7
global.dir += 1
logicCombo    ();
logicScore    ();
logicAmmo     ();
logicTutorial ();
if finish = 1   {txtScore(view_wview[0]/2,view_hview-11,finishstring,fntScore,0.75                              )}
if ammoy > -32  {txtScore(18+(string_width(ammostring)*0.5), view_hview[0]-ammoy, ammostring, fntScore,0.75     )}
if update       {txtScore(view_wview[0]-18 - string_width(scorestring)*0.5,20,scorestring,fntScore,0.75         )}
else            {txtScore(view_wview[0]-18 - string_width(scorestring)*0.5,20,scorestring,fntScoreUpdate,0.75   )}
