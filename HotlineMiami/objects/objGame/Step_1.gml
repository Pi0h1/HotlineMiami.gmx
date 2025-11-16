if ( roomRestartIndex > 0 )
{
	room_speed = 9999;
    if ( room != roomRestartIndex )
    {
        room_goto( roomRestartIndex );
        return;
    }
    if ( room_persistent )
    {
        room_persistent = false;
    }
    for ( var i = roomRestartIndex; i < array_length( global.tempSave ); ++i )
    {
        var buf = global.tempSave[i];
        if ( buffer_exists( buf ) )
        {
            global.tempSave[i] = -1;
            buffer_delete( buf );
            roomRestartIndex = i;
            break;
        }
    }
    if ( i < array_length( global.tempSave ) )
    {
        room_goto( roomRestartIndex );
        return;
    }
    // Done
    room_goto(global.level);
	roomRestartIndex = -1;
	audio_stop_sound(sndPolice);
	sxeasy_play(global.levelSong);
	room_speed = 60;
}

