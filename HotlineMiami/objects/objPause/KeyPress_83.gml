if (!on || fade || wait > 0)
    exit;
wait = 3;
if (select < 3)
    select++;
else select = 0;
if (select == 1 && test == 1)
    select = 2;

