// If the current room is using the original camera size, update it to a 16:9 one.
var isUsingOriginalViewSize = (__view_get( e__VW.WView, 0 ) == 399);

if (isUsingOriginalViewSize) {
    __view_set( e__VW.WView, 0, 480 );
    __view_set( e__VW.HView, 0, 270 );
}
