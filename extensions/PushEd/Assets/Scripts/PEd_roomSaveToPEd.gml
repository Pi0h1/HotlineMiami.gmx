/// PEd_roomSaveToPEd(room, file)
/**
 * @brief Saves the room into the *.ped file.
 * @param {real}   room The id of the room.
 * @param {string} file The name of the file to export to.
 * @return {bool} True on success.
 */
var _room = argument0;
var _path = argument1;
var _roomName = string_replace(filename_name(_path), ".ped", "");
PEd_roomSetName(_room, _roomName);

var _roomSave = PEd_roomCopy(_room);

////////////////////////////////////////////////////////////////////////////////
// Write camera and editor settings
_roomSave[? "using3D"] = global.pedUsing3D;
_roomSave[? "editMode"] = PEd_oEditor.editMode;
_roomSave[? "editTool"] = PEd_oEditor.editTool;
_roomSave[? "editFloor"] = PEd_oEditor.editFloor;
_roomSave[? "cameraX"] = PEd_oEditor.x;
_roomSave[? "cameraY"] = PEd_oEditor.y;
_roomSave[? "cameraZ"] = PEd_oEditor.z;
_roomSave[? "cameraDir"] = PEd_oEditor.direction;
_roomSave[? "cameraPitch"] = PEd_oEditor.camPitch;
_roomSave[? "viewX"] = view_xview[0];
_roomSave[? "viewY"] = view_yview[0];
_roomSave[? "viewZoom"] = PEd_oEditor.viewZoom;
_roomSave[? "pivotX"] = PEd_oPivot.x;
_roomSave[? "pivotY"] = PEd_oPivot.y;
_roomSave[? "pivotZ"] = PEd_oPivot.z;

////////////////////////////////////////////////////////////////////////////////
// Write instances
var _instances = PEd_roomGetInstances(_room);
var _instanceCount = ds_list_size(_instances);
var _instancesSave = PEd_roomGetInstances(_roomSave);
ds_list_clear(_instancesSave);

for (var i = 0; i < _instanceCount; i++)
{
    PEd_dsListAddMap(_instancesSave, PEd_createSaveInstance(_instances[| i]));
}

////////////////////////////////////////////////////////////////////////////////
// Write tiles
var _tiles = PEd_roomGetTiles(_room);
var _tileCount = ds_list_size(_tiles);
var _tilesSave = PEd_roomGetTiles(_roomSave);
ds_list_clear(_tilesSave);

for (var i = 0; i < _tileCount; i++)
{
    PEd_dsListAddMap(_tilesSave, PEd_createSaveTile(_tiles[| i]));
}

////////////////////////////////////////////////////////////////////////////////
// Write to file
if (file_exists(_path))
{
    file_copy(_path, "Backups\" + _roomName + "_backup.ped");
}

var _file = file_text_open_write(_path);
if (_file != -1)
{
    file_text_write_string(_file, json_encode(_roomSave));
    file_text_close(_file);
    ds_map_destroy(_roomSave);
    return true;
}

ds_map_destroy(_roomSave);
return false;
