// If the current room is using the original camera size, update it to a 16:9 one.
var isUsingOriginalViewSize = (view_wview[0] == 399);

if (isUsingOriginalViewSize) {
    view_wview[0] = 480;
    view_hview[0] = 270;
}
