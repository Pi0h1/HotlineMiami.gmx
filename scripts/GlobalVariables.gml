/*  The Global Variables Script™
    All global variables used by the game should be set in 
    this script and nowhere else. This allows you to load
    any room you want for quickly testing a level!          */
//======================================================================================//
/*  The following variables are original to https://github.com/Pi0h1/HotlineMiami.gmx;
    Therefore not present in vanilla Hotline Miami. */
//======================================================================================//
    global.PlayerStartingPointX = 0;
    global.PlayerStartingPointY = 0;
    global.devmode      = true;
    global.spawnObject  = 0;
    global.playerIndex  = 0;
    global.depthDeath   = 0;
    global.godmode      = 0;
    global.cutscene     = 0;
    global.restartedmusic = working_directory+"\Static.mp3"
    
    // Enables using JSON for the restart mechanic, disable this to use game_save (Warning: game_save is not compatible with GMS2!)
    global.useJson      = false;
    window_set_cursor(cr_none);
    
    scrInitLevelTitles();

//======================================================================================//
/*  End of original variables.  */
//======================================================================================//

/*  Hotline Miami's Global Variables
    Note: To improve code readability some of these variables have been renamed. */
//======================================================================================//

// Steam
//======================================================================================//
global.steamon = 0;

// Volume
//======================================================================================//
sxeasy_init();
global.musicVolume = 1;
global.soundVolume = 1;
scrLoadVol()

// Alienware
//======================================================================================//
global.alienware=0;
if file_exists(working_directory+"\alienware") {
    global.alienware=1;
    scrAlienWareInit()
    scrAlienWarePink()
    } else {
    global.alienware=0;
    }

// Controller
//======================================================================================//
global.controllertype   =   1   ;
global.upkey            =   'W' ;
global.leftkey          =   'A' ;
global.downkey          =   'S' ;
global.rightkey         =   'D' ;
global.restartkey       =   'R' ;
global.controller       =   0   ;

// Visuals
//======================================================================================//
display_set_gui_size(view_wview, view_hview);
global.shake        =   0; // Note: This not only controls how much the screen shakes, but also gamepad rumble.
global.surfaces =   1;
global.blood    =   1;
if file_exists(working_directory+"\blood")      global.blood=0;
if file_exists(working_directory+"\surfaces")   global.surfaces=0;
global.surfacesprites   =   0;
global.paused   =   0;
global.surf1    =   surface_create(room_width,room_height+64);
surface_set_target  (global.surf1);
draw_clear_alpha    (c_black,0);
surface_alpha();
surface_reset_target();
global.surf2    =   surface_create(640*3,480*3);
surface_set_target  (global.surf2);
draw_clear_alpha    (c_black,0);
surface_alpha();
surface_reset_target();
global.surf3    =   surface_create(640*3,480*3);
surface_set_target  (global.surf3);
draw_clear_alpha    (c_black,0);
surface_alpha();
surface_reset_target();

// Game logic
//======================================================================================//
global.maskload     =   0   ;
global.bonuslist    =   ds_list_create();
global.bonustime    =   0;
global.newmasks     =   0;
global.talked       =   1;
global.i            =   0;
global.resetstory   =   0;
global.comboflash   =   0;
global.parttitle[0] =   "PART ONE.";
global.parttitle[1] =   "PHONECALLS.";
global.nextlevel    =   rmTutorial;
global.sequence     =   rmSequence1;
global.revisit      =   0;
global.maskon       =   1;
global.maskindex    =   0;
scrLoadUnlocked     ();
scrLoadAchievements ();
scrCheckLetters     ();
scrCheckGuns        ();
scrCheckMasks       ();
scrInitScore        ();
global.done         =   0;
global.title        =   "TEST";
global.maskindex    =   0;
global.maskon       =   0;
global.factor       =   0;
