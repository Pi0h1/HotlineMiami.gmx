/// MenuOptionsHorizontal(amount of options, x, y, textstring)
var xCoordinate = argument1;
var yCoordinate = argument2;

repeat(argument0) {
    if select = i {
        repeats = 6 + lengthdir_x(5, dir * 10)
            repeat(repeats) {
                txtMenu(xCoordinate+(i*80), yCoordinate, argument3[i], true)
            }
    } else {
        txtMenu(xCoordinate+(i*80), yCoordinate, argument3[i], false)
    }
    i += 1;
}
