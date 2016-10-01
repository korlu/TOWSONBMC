--// querylunchmenu.sql 


select a.LunchNo, a.LunchName, a.Price, c.SauceStyle, d.TasteStyle, f.cookstyle
from lunchmenu a, style b, SauceStyle c, TasteStyle d, litemcookway e,
	cookstyle f
where a.lunchNo=&ItemNo and a.StyleNo= b.StyleNo and b.SauceNo=c.SNo
	and b.TasteNo=d.TNO and e.No=a.lunchNo and f.CNo=e.CNo;
