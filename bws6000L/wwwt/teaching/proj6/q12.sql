select m.MLNAME || ', ' || m.MFNAME || ' ' || m.MMINIT || '.' MEMBER_NAME,
    MSSN, MACCTNO, MPHONE
from members m
where m.macctno in (select s.sacctnum from savings s
       where s.sbalance < 50);
