if (!on || fade || wait > 0)
    exit;
wait = 3;
if (select > 0)
    select--;
else select = 3;
if (select == 1 && test == 1)
    select = 0;

