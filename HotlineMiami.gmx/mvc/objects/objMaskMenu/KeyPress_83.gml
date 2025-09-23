if (global.xbox)
    exit;
if (!on || wait > 0)
    exit;
wait = 3;
select++;
if (select > masks - 1)
    select = 0;

