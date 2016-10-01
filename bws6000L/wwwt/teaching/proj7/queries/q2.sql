--// querychefsmenu.sql 


select a.ChefsNo, a.ChefsName, a.Price, c.SauceStyle, d.TasteStyle,
	f.cookstyle
from Chefsmenu a, style b, SauceStyle c, TasteStyle d, citemcookway e,
	cookstyle f
where a.ChefsNo=&ItemNo and a.StyleNo= b.StyleNo and b.SauceNo=c.SNo
	and b.TasteNo=d.TNO and e.No=a.ChefsNo and f.CNo=e.CNo;
