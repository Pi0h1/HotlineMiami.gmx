/*
    The "Broken Tele-Phone Pipeline", BTPP for short, is the process of:
    
        1. Decompiling HotlineMiami_Original.exe
        2. Opening it in Game Maker 7.0
        3. Importing to GameMaker: Studio 1.4
        4. Potentially importing to either other engines or future versions of GM

    A lot of data gets mangled and bugs are introduced during the BTPP. So it's necessary to do some
    manual fixing to ensure that the game you are playing is a faithful reproduction of the
    Hotline Miami game everyone is familiar with.
    
    The game most people are familiar with, however, is not HotlineMiami_Original.exe, but HotlineGL.exe
    
    If we keep the code exactly the same; it will not even compile. If we change it enough
    to compile, it still doesn't even resemble either HotlineMiami_Original or HotlineGL.

    If we change the code too much, people who are familiar with modding Hotline Miami will
    have to re-learn everything, and resources on how to mod the game will become outdated.
    
    So to ensure that the game resembles the game everyone is familiar with, we are going to go
    with an unintrusive approach, creating custom scripts that patch issues introduced by BTPP
    
    The scripts under the "AG" group mirror behaviors encountered in HotlineGL.exe.
        AG stands for Abstraction Games and mirrors a similar group found in the HotlineMiami_GL.wad file used by HotlineGL.exe
    
    The scripts under the "Custom" group are fixes to address issues introduced by BTPP.
    
    The scripts under the "Obsolete" group are functions that have become obsolete during the BTPP.
*/
