--// querymaterial.sql

select h.No, a.name,
	g1.MaterialName,g2.MaterialName,g3.MaterialName,g4.MaterialName,
	g5.MaterialName,g6.MaterialName,g7.MaterialName,g8.MaterialName,
	g9.MaterialName,g10.MaterialName
from menu a, materialinitem h, material g1, material g2, material g3,
	material g4,
	material g5, material g6, material g7, material g8, material g9, 
	material g10 
where a.No=&ItemNo and h.No=a.No and g1.MNo=h.MNo1 and g2.MNo=h.MNo2
      and g3.MNo=h.MNo3 and g4.MNo=h.MNo4 and g5.MNo=h.MNo5
      and g6.MNo=h.MNo6 and g7.MNo=h.MNo7 and g8.MNo=h.MNo8
      and g9.MNo=h.MNo9 and g10.MNo=h.MNo10;

