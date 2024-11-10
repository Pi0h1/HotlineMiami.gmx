size=0
images=0
sprites=0
width=0
height=0
i=0 repeat (1000) {
if sprite_exists(i) {
size+=sprite_get_width(i)*sprite_get_height(i)*sprite_get_number(i)
images+=sprite_get_number(i)
sprites+=1
}
i+=1
}
size=width*height
show_message(string(sprites)+" sprites#"+string(images)+" subimages#"+string(size)+" pixels#"+string(sqrt(size)*(2.54/300))+" cm in print")
