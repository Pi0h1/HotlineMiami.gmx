global.loaded = 1;
with (objEffector) {
    global.amount = amount;
    amount = 0;
}
checkpoint_save(working_directory + "\\tempsave.sav");
with (objEffector) {
    amount = global.amount;
}
global.loaded = 0;

