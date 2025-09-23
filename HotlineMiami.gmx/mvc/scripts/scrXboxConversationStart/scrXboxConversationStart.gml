if (current < messages)
    current++;
else {
    if (sprite == sprPhone)
        objAnsweringMachine.active = 0;
    instance_destroy();
}
reload = 10;
