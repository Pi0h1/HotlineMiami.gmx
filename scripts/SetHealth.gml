//  Health
//  0 = dies in one shot
if is_string(argument0)
{
if argument0 = "Random" {energie=round(random(1))}
if argument0 = "Invincible" {energie=-10}
}else{
energie=argument0
}
