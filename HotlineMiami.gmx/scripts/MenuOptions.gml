/// MenuOptions(amount of options, x, y, textstring, are there horizontal options available?)
var horizontalOptions = argument4;
var xCoordinate = argument1;
var yCoordinate = argument2;


repeat(argument0) {
    if select = i {
        repeats = 6 + lengthdir_x(5, dir * 10)
            repeat(repeats) {
                txtMenu(xCoordinate, yCoordinate+(i*20), argument3[i], true)
            }
    } else {
        txtMenu(xCoordinate, yCoordinate+(i*20), argument3[i], false)
    }
    i += 1
}
