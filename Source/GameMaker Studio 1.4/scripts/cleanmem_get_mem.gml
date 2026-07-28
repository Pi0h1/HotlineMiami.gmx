//Clean Memory DLL
//Halo Shg
//
//mem = cleanmem_get_mem();
//
//Returns 0 if fails, or memory in bytes if succeeds.
{
    return ( external_call(global._cleanmem_get_mem) );
}
