if argument0="Melee"{
with objWindowH {
    if place_meeting(x, y, global.my_id) {
      SteamIncStat("Windows", 1);
      if global.my_id.lasty < y + 2 {
        add = -1;
      } else {
        add = 1;
      }
      i = 0;
      repeat(24) {
        my_id = instance_create(x + i * 1.5, y, objShard);
        my_id.speed = random(5);
        my_id.direction = add * 90 - 8 + random(16);
        i += 1;
      }
      instance_create(x, y, objGlassPanelHBroken);
      global.shake = 4;
      instance_destroy();
    }
  }
}
else
{

with other {
if broken=false{
broken=true
image_index=1
global.shake=4
PlaySFX("Strong Glass")

if other.vspeed>0 {
add=-1
} else {
add=1
}
i=0

scrCreateShards("HorizontalWindow");
}
}

}
