/// PlaySFX(sound)
// This script plays sound effects!
if is_string(argument0){
if argument0 = "Pick Up"            {audio_play(sndPickUp)                                                              }
if argument0 = "Strong Punch"       {audio_play(sndDoorHit) audio_play(sndPunch)                                        }
if argument0 = "Blunt"              {audio_play(sndHit) audio_play(sndPunch)                                            }
if argument0 = "Hard Blunt"         {audio_play(sndHit) audio_play(sndPunch)audio_play(sndDoorHit)audio_play(sndNeck)   }
if argument0 = "Light Cut"          {audio_play(choose(sndCut1,sndCut2))                                                }
if argument0 = "Cut"                {audio_play(choose(sndCut1,sndCut2))audio_play(sndHit)                              }
if argument0 = "Hard Cut"           {audio_play(choose(sndCut1,sndCut2))audio_play(sndHit)audio_play(sndPunch)          }
if argument0 = "Hammer"             {audio_play(choose(sndCut1,sndCut2))audio_play(sndHit) audio_play(sndPunch) audio_play(sndBonesBreak)}
if argument0 = "Light Glass"        {audio_play(choose(sndGlass1,sndGlass2))}
if argument0 = "Glass"              {audio_play(sndGlass1) audio_play(sndGlass2)}
if argument0 = "Strong Glass"       {audio_play(sndGlass1) audio_play(sndGlass2) audio_play(sndWeaponHit)}
if argument0 = "Molotov"            {audio_play(sndMolotov) audio_play(sndGlass1) audio_play(sndWeaponHit) audio_play(sndGlass2)}
} else {
audio_play(argument0)
}
