function scrXboxMaskMenuStart() {
	if global.masks[select]=0 exit
	if on=0 exit
	on=0
	with objPlayer {
	reload=30
	image_index=0
	image_speed=0.15
	sprite_index=sprPMaskSlip
	}
	if select=0 objPlayer.masksprite=sprMaskPutOnRooster
	if select=1 objPlayer.masksprite=sprMaskPutOnOwl
	if select=2 objPlayer.masksprite=sprMaskPutOnTiger
	if select=3 objPlayer.masksprite=sprMaskPutOnPig
	if select=4 objPlayer.masksprite=sprMaskPutOnHorse
	if select=5 objPlayer.masksprite=sprMaskPutOnRabbit
	if select=6 objPlayer.masksprite=sprMaskPutOnWolf
	if select=7 objPlayer.masksprite=sprMaskPutOnGiraffe
	if select=8 objPlayer.masksprite=sprMaskPutOnCollie
	if select=9 objPlayer.masksprite=sprMaskPutOnElephant
	if select=10 objPlayer.masksprite=sprMaskPutOnCamel
	if select=11 objPlayer.masksprite=sprMaskPutOnMonkey
	if select=12 objPlayer.masksprite=sprMaskPutOnUnicorn
	if select=13 objPlayer.masksprite=sprMaskPutOnFrog
	if select=14 objPlayer.masksprite=sprMaskPutOnMole
	if select=15 objPlayer.masksprite=sprMaskPutOnFox
	if select=16 objPlayer.masksprite=sprPantherMask
	if select=17 objPlayer.masksprite=sprMaskPutOnOctopus
	if select=18 objPlayer.masksprite=sprMaskPutOnChamelion
	if select=19 objPlayer.masksprite=sprMaskPutOnFish
	if select=20 objPlayer.masksprite=sprMaskPutOnBat
	if select=21 objPlayer.masksprite=sprMaskPutOnWalrus
	if select=22 objPlayer.masksprite=sprMaskPutOnCrocodile
	if select=23 objPlayer.masksprite=sprMaskPutOnLocust
	if select=24 objPlayer.masksprite=sprMaskPutOnCobra
	if select=25 objPlayer.masksprite=sprMaskPutOnRat
	global.maskindex=select
	objPlayer.maskindex=select
	if file_exists(working_directory+"\\mask.nfo") file_delete(working_directory+"\\mask.nfo")
	file=file_text_open_write(working_directory+"\\mask.nfo")
	file_text_write_string(file,string(select))
	file_text_close(file)



}
