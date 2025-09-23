if (wait > 0) {
    wait--;
    exit;
}
if (image_index < 6)
    image_index++;
image_alpha = 1 - image_index * 0.1;

