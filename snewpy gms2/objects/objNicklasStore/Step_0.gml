if talked=1 and !instance_exists(objPhoneConversation) {
with objSixpack on=1
with objChipsBag on=1


with objETauntBat instance_destroy()
with objETauntChain instance_destroy()
with objETauntPipe instance_destroy()
with objETauntSmoke instance_destroy()
with objVictimWall {sprite_index=sprVictimDead tile_layer_show(1001)}


}
if global.xbox=1 scrXboxNickeTalkStore()
