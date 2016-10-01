--// query.sql


select a.No, a.Name, a.Price, c.SauceStyle, d.TasteStyle, f.cookstyle
--// g.MaterialName
from menu a, style b, SauceStyle c, TasteStyle d, itemcookway e,
	cookstyle f --, material g, materialinitem h
where a.No=&ItemNo and a.StyleNo= b.StyleNo and b.SauceNo=c.SNo
	and b.TasteNo=d.TNO and e.No=a.No and f.CNo=e.CNo
--	and h.No=a.No and h.MNo1=g.MNo  and h.MNo2=g.MNo
--	and h.MNo3=g.MNo and h.MNo4=g.MNo and h.MNo5=g.MNo
--	and h.MNo6=g.MNo and h.MNo7=g.MNo and h.MNo8=g.MNo
--	and h.MNo9=g.MNo and h.MNo10=g.MNo
/
