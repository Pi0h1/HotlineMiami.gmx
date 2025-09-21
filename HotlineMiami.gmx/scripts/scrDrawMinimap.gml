///scrDrawMinimap(offset, range, scale, dir)

var hudOffset = argument0;
var mapRange = argument1;
var hudScale = argument2;
var colorDir = argument3;

draw_set_color(c_black);
draw_circle(hudOffset, hudOffset, mapRange/hudScale * 1.2, false);

//Render the player in the center of the map. No calculation needed.
draw_set_color(c_blue);
draw_circle(hudOffset, hudOffset, 16/hudScale, false);

if (instance_exists(objCamera3D))
    var playerDir = objCamera3D.angle; //How you want to retrieve this can be changed

//Render the enemy, we can also account for the direction the player is facing with some lengthdir magic.
draw_set_color(c_red);
with (objEnemy)
{
    var dist = point_distance(objPlayer.x, objPlayer.y, x, y);
    
    if (dist > mapRange)
        continue;
    
    var dir = point_direction(objPlayer.x, objPlayer.y, x, y);
    
    draw_circle(hudOffset + lengthdir_x(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist, dir - playerDir + 90)/hudScale, 16/hudScale, false);
}

with (objKnockedOut)
{
    var dist = point_distance(objPlayer.x, objPlayer.y, x, y);
    
    if (dist > mapRange)
        continue;
    
    var dir = point_direction(objPlayer.x, objPlayer.y, x, y);
    
    draw_circle(hudOffset + lengthdir_x(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist, dir - playerDir + 90)/hudScale, 16/hudScale, false);
}

//We do a for loop and check for all instances of objWall inside of it so that way the wall renders are correctly layered.
for (var i = 0; i <= 10; i++)
{
    var j = i * 0.05;   //How far apart the walls in each layer should be
    var k = i;          //Scale factor based on distance from the wall (Only use this if you want the walls to be bigger the further away they are)
    with (objWallHeavyH)
    {
        //Get original distance
        var ogDist = point_distance(objPlayer.x, objPlayer.y, x, y + 4);
        
        //Starting direction and distance (x1y1)
        var dir = point_direction(objPlayer.x, objPlayer.y, x - (k), y + 4);
        var dist = point_distance(objPlayer.x, objPlayer.y, x - (k) + lengthdir_x(j * ogDist, dir), y + 4 + lengthdir_y(j * ogDist, dir));
        
        //I'm using dist instead of ogDist because it produces a much cooler effect that is hard to explain in words, just trust the process
        if (dist > mapRange)
            continue;
        
        //Ending direction and distance (x2y2)
        var dir2 = point_direction(objPlayer.x, objPlayer.y, x + 32 + lengthdir_x(j * ogDist, dir) + (k), y + 4 + lengthdir_y(j * ogDist, dir));
        var dist2 = point_distance(objPlayer.x , objPlayer.y, x + 32 + lengthdir_x(j * ogDist, dir) + (k), y + 4 + lengthdir_y(j * ogDist, dir));
        
        //Set color so that it does the cool HLM2/HLM3 text effect.
        draw_set_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, colorDir + (360/10*i))));
       
        //Render the wall in the map 
        draw_line_width(hudOffset + lengthdir_x(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_x(dist2, dir2 - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist2, dir2 - playerDir + 90)/hudScale, (8 + (2 * k))/hudScale);
    }
    
    with (objWallHeavyV)
    {
        //Get original distance
        var ogDist = point_distance(objPlayer.x, objPlayer.y, x + 4, y);
        
        //Starting direction and distance (x1y1)
        var dir = point_direction(objPlayer.x, objPlayer.y, x + 4, y - (k));
        var dist = point_distance(objPlayer.x, objPlayer.y, x + 4 + lengthdir_x(j * ogDist, dir), y - (k) + lengthdir_y(j * ogDist, dir));
        
        //I'm using dist instead of ogDist because it produces a much cooler effect that is hard to explain in words, just trust the process
        if (dist > mapRange)
            continue;
        
        //Ending direction and distance (x2y2)
        var dir2 = point_direction(objPlayer.x, objPlayer.y, x + 4 + lengthdir_x(j * ogDist, dir), y + 32 + lengthdir_y(j * ogDist, dir) + (k));
        var dist2 = point_distance(objPlayer.x , objPlayer.y, x + 4 + lengthdir_x(j * ogDist, dir), y + 32 + lengthdir_y(j * ogDist, dir) + (k));
        
        //Set color so that it does the cool HLM2/HLM3 text effect.
        draw_set_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, colorDir + (360/10*i))));
       
        //Render the wall in the map 
        draw_line_width(hudOffset + lengthdir_x(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_x(dist2, dir2 - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist2, dir2 - playerDir + 90)/hudScale, (8 + (2 * k))/hudScale);
    }
    
    with (objWallBrickV)
    {
        if (object_index == objWallBrickH)
        {
            //Get original distance
            var ogDist = point_distance(objPlayer.x, objPlayer.y, x, y + 4);
            
            //Starting direction and distance (x1y1)
            var dir = point_direction(objPlayer.x, objPlayer.y, x - (k), y + 4);
            var dist = point_distance(objPlayer.x, objPlayer.y, x - (k) + lengthdir_x(j * ogDist, dir), y + 4 + lengthdir_y(j * ogDist, dir));
            
            //I'm using dist instead of ogDist because it produces a much cooler effect that is hard to explain in words, just trust the process
            if (dist > mapRange)
                continue;
            
            //Ending direction and distance (x2y2)
            var dir2 = point_direction(objPlayer.x, objPlayer.y, x + 32 + lengthdir_x(j * ogDist, dir) + (k), y + 4 + lengthdir_y(j * ogDist, dir));
            var dist2 = point_distance(objPlayer.x , objPlayer.y, x + 32 + lengthdir_x(j * ogDist, dir) + (k), y + 4 + lengthdir_y(j * ogDist, dir));
            
            //Set color so that it does the cool HLM2/HLM3 text effect.
            draw_set_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, colorDir + (360/10*i))));
           
            //Render the wall in the map 
            draw_line_width(hudOffset + lengthdir_x(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_x(dist2, dir2 - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist2, dir2 - playerDir + 90)/hudScale, (8 + (2 * k))/hudScale);
        }
        else
        { 
            //Get original distance
            var ogDist = point_distance(objPlayer.x, objPlayer.y, x + 4, y);
            
            //Starting direction and distance (x1y1)
            var dir = point_direction(objPlayer.x, objPlayer.y, x + 4, y - (k));
            var dist = point_distance(objPlayer.x, objPlayer.y, x + 4 + lengthdir_x(j * ogDist, dir), y - (k) + lengthdir_y(j * ogDist, dir));
            
            //I'm using dist instead of ogDist because it produces a much cooler effect that is hard to explain in words, just trust the process
            if (dist > mapRange)
                continue;
            
            //Ending direction and distance (x2y2)
            var dir2 = point_direction(objPlayer.x, objPlayer.y, x + 4 + lengthdir_x(j * ogDist, dir), y + 32 + lengthdir_y(j * ogDist, dir) + (k));
            var dist2 = point_distance(objPlayer.x , objPlayer.y, x + 4 + lengthdir_x(j * ogDist, dir), y + 32 + lengthdir_y(j * ogDist, dir) + (k));
            
            //Set color so that it does the cool HLM2 gradient transition text effect.
            draw_set_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, colorDir + (360/10*i))));
           
            //Render the wall in the map 
            draw_line_width(hudOffset + lengthdir_x(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist, dir - playerDir + 90)/hudScale, hudOffset + lengthdir_x(dist2, dir2 - playerDir + 90)/hudScale, hudOffset + lengthdir_y(dist2, dir2 - playerDir + 90)/hudScale, (8 + (2 * k))/hudScale);
        }
    }
}
