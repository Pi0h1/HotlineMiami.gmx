if (global.xbox)
    exit;
if (reload > 0)
    exit;

if (current < messages)
    current++;
else {
    if (instance_exists(objAnsweringMachine)) {
        if (sprite == sprPhone)
            with (objAnsweringMachine) {
                active = 0;
            }
            instance_destroy();
        } else {
        instance_destroy();
    }
}

reload = 10;

