if instance_exists(objPlayerBiker){
    my_id=instance_create(objPlayer.x,objPlayer.y,objPlayerJacket)
    my_id.ammo=last_ammo
    my_id.sprite_index=last_sprite
    }
with objPlayerBiker instance_destroy();

if instance_exists(objPlayerJacket){
    instance_create(objPlayer.x,objPlayer.y,objPlayerBiker)
    }
with objPlayerJacket instance_destroy();
