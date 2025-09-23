// mask.nfo is for loading the current mask when the player dies on the first floor.
// After dying on the first floor, skip all the mask selection stuff
file = file_text_open_read("mask.nfo");
global.maskindex = file_text_read_real(file);
global.maskon = true;
with (objMaskMenu)
    instance_destroy();
with (objPlayer) {
    scrInitMaskPos();
    scrUpdateMaskPos(sprite_index);
    maskon = 1;
}
file_text_close(file);
