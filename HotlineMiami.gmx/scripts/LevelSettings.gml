//LevelSettings(objPlayerJacket,masks y/n)
if instance_exists(objEffector)         {instance_create(x,y,objEffector)}
//if instance_exists(objBackgroundColor)  {instance_create(x,y,objBackgroundColor)}
if instance_exists(objSurfacer)         {instance_create(x,y,objSurfacer)}
instance_create(x,y,argument1)
if argument0=true 
{
instance_create(x,y,objMaskMenu)
}



