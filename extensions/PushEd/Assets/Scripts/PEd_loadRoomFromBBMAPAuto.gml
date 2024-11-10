/// PEd_loadRoomFromBBMAPAuto(file)
/**
 * @brief Auto-recognizes the version of the BBMAP file and loads a room that it contains.
 * @param {string} file Path to the BBMAP file.
 * @return {real} The loaded room.
 */
var _path = argument0;

////////////////////////////////////////////////////////////////////////////////
//
// Load new BBMAP
//
var _file = file_bin_open(_path, 0);
if (_file != -1)
{
    var _version = file_bin_read_byte(_file);   
    file_bin_close(_file);
    
    if (_version == 2)
    {
        return PEd_loadRoomFromBBMAP2(_path);
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Load old BBMAP
//
_file = file_text_open_read(_path);
if (_file != -1)
{
    file_text_close(_file);
    return PEd_loadRoomFromBBMAP(_path);
}

////////////////////////////////////////////////////////////////////////////////
//
// Load failed
//
return noone;
