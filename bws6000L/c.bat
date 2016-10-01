rem c.bat file 
rem used to compile aoa
rem turbo asm and link
rem 
cls
tasm /o /c /la /a /m3 prcycle + prcallsd + prcalls + prdisp + prload1 + prloader + rfdwhd +  atoh + prwrite1 + except
tlink /3  prcycle + prcallsd + prcalls + prdisp + prload1 + prloader + rfdwhd + atoh + prwrite1 + except
