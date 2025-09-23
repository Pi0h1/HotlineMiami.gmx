if (other.active) {
    instance_create(x, y, objBoss3Dead);
    instance_destroy();
    objEffector.brus = 10;
    other.active = 0;
}

