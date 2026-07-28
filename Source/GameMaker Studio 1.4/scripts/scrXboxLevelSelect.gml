if (global.xbox == 1) {
    if checkbutton(0,getid(5)) {
        if (presstart == 0) {
            presstart = 1;
            scrXboxLevelSelectStart();
        }
    } else presstart = 0;
    if checkbutton(0,getid(6)) {
        if (pressback == 0) {
            pressback = 1;
            scrXboxLevelSelectBack();
        } 
    } else pressback = 0;
    if leftthumb_x(0)>15000 {
        if (pressright == 0) {
            pressright = 1;
            scrXboxLevelSelectRight();
        }
    } else pressright = 0;
    if leftthumb_x(0)<-15000 {
        if (pressleft == 0) {
            pressleft = 1;
            scrXboxLevelSelectLeft();
        }
    } else pressleft = 0;
    if leftthumb_y(0)>5000 {
        if (pressup == 0) {
            pressup = 1;
            scrXboxLevelSelectUp();
        }
    } else pressup = 0;
    if leftthumb_y(0)<-5000 {
        if (pressdown == 0) {
            pressdown = 1;
            scrXboxLevelSelectDown();
        }
    } else pressdown = 0;
}
