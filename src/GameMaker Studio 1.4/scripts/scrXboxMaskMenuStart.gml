if global.masks[select]=0 exit
if on=0 exit
on=0
with objPlayer {
reload=30
image_index=0
image_speed=0.15
sprite_index=sprPMaskSlip
}
if select=0 objPlayer.masksprite=sprRoosterMask
if select=1 objPlayer.masksprite=sprOwlMask
if select=2 objPlayer.masksprite=sprTigerMask
if select=3 objPlayer.masksprite=sprPigMask
if select=4 objPlayer.masksprite=sprHorseMask
if select=5 objPlayer.masksprite=sprRabbitMask
if select=6 objPlayer.masksprite=sprWolfMask
if select=7 objPlayer.masksprite=sprGiraffeMask
if select=8 objPlayer.masksprite=sprCollieMask
if select=9 objPlayer.masksprite=sprElephantMask
if select=10 objPlayer.masksprite=sprCamelMask
if select=11 objPlayer.masksprite=sprMonkeyMask
if select=12 objPlayer.masksprite=sprUnicornMask
if select=13 objPlayer.masksprite=sprFrogMask
if select=14 objPlayer.masksprite=sprMoleMask
if select=15 objPlayer.masksprite=sprFoxMask
if select=16 objPlayer.masksprite=sprPantherMask
if select=17 objPlayer.masksprite=sprOctopusMask
if select=18 objPlayer.masksprite=sprChamelionMask
if select=19 objPlayer.masksprite=sprFishMask
if select=20 objPlayer.masksprite=sprBatMask
if select=21 objPlayer.masksprite=sprWalrusMask
if select=22 objPlayer.masksprite=sprCrocodileMask
if select=23 objPlayer.masksprite=sprLocustMask
if select=24 objPlayer.masksprite=sprCobraMask
if select=25 objPlayer.masksprite=sprRatMask
global.maskindex=select
objPlayer.maskindex=select
if file_exists(working_directory+"\mask.nfo") file_delete(working_directory+"\mask.nfo")
file=file_text_open_write(working_directory+"\mask.nfo")
file_text_write_string(file,string(select))
file_text_close(file)
