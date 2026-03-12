if (fade) exit;
switch (level) {
    case 1:
        select=0;
        scrInitMainMenu();
        level=0;
        break;
    case 2:
    case 3:
    case 4:
        scrInitMenuOptions();
        select=0;
        level=1;
        break;
    default:
        file_delete(working_directory+"\\skip"); 
        fade=1;
        select=4;
        break;
}

