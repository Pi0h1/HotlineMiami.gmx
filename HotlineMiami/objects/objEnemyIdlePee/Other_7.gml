if (sprite_index == sprEIdlePee) {
    if (round(random(5)) == 2)
        sprite_index = sprEIdlePeeStop;
}
if (sprite_index == sprEIdlePeeStop) {
    sprite_index = sprEIdlePee;
}

