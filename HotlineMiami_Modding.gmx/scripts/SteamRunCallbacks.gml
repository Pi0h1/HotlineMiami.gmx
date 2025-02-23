// once per frame, man
if global.steamon {
if global.steamreload>0 global.steamreload-=1 else {global.steamreload=60 external_call(iSteamRunCallbacks);}
}
