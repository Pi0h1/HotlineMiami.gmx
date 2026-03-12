if level = 0 {
    if select = 0 {
        {
            select = 0 //level=1 
            fade = 1
            scrInitScore()
        }
    }
    if select = 1 {
        fade = 1
        scrInitScore()
    }
     if select = 2 {
        fade = 1;
     }
    if select = 3 {
        level = 1
        select = 0
        scrInitMenuOptions();
        exit
    }
    if select = 4 {
        fade = 1;
        file_delete(working_directory + "\\skip");
    }
}

if level = 1 {
    if select = 0 {
        scrInitScore();
        fade = 1;
    }
    if select = 1 {
        level = 2;
        select = 0;
        scrInitMenuMusic();
        exit;
    }
}

if level = 2 {
    if select = 1 {
        scrSaveVol()
        level = 1
        select = 0
        scrInitMenuOptions();
        exit
    }
}

if level = 3 {
    scrInitMenuOptions();
    level = 1
    select = 0
}

if level = 4 {
    if select = 0 {
        global.surfaces = !global.surfaces
        if global.surfaces = 1 {
            global.blood = 1
            if file_exists(working_directory + "\\surfaces") file_delete(working_directory + "\\surfaces")
            if file_exists(working_directory + "\\blood") file_delete(working_directory + "\\blood")
        } else {
            file = file_text_open_write(working_directory + "\\surfaces") file_text_close(file)
            file = file_text_open_write(working_directory + "\\blood") file_text_close(file)
        }
    }

    if select = 1 {
        global.blood = !global.blood
        if global.blood = 1 {
            if file_exists(working_directory + "\\blood") file_delete(working_directory + "\\blood")
        } else {
            file = file_text_open_write(working_directory + "\\blood") file_text_close(file)
        }
    }
    if select = 2 global.alienware = !global.alienware
    alt[0] = "SURFACES "
    if global.surfaces = 1 alt[0] += "ON"
    else alt[0] += "OFF"
    alt[1] = "clear blood "
    if global.blood = 0 alt[1] += "on"
    else alt[1] += "off"
    alt[2] = "AlienWare "
    if global.alienware = 1 alt[2] += "ON"
    else alt[2] += "OFF"
    alt[3] = "BACK"
    if select = 3 {
        level = 1
        select = 0
        scrInitMenuOptions();
        exit
    }
}

