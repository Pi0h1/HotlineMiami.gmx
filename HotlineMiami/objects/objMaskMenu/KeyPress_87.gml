if (global.xbox)
    exit;
if (!on || wait > 0)
    exit;
wait = 3;
select--;
if (select < 0)
    select = masks - 1;

