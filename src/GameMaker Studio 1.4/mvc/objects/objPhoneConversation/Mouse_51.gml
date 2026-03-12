if global.xbox=1 exit
if skip<30 skip+=1 else 
    {
        if instance_exists(objAnsweringMachine)
            {
                if sprite=sprPhone with objAnsweringMachine active=0 
                    {
                        instance_destroy()
                    }
            }
            else
            {
                instance_destroy();
            }
    }

