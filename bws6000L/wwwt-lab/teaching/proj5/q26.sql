/* Make a list of all movies that either directed by 'Steven Spielberg' */
/* or played by 'Ben Kingsley'. */

select    distinct m.title
from      movies m
where     m.mid in  (select	d.mid
		     from	movies m, directors d
		     where	m.mid=d.mid
				and d.first_name='Steven' 
	  			and d.last_name='Spielberg') 		   
	  or
	  m.mid in  (select	c.mid
		     from      	movies m, casts c, actors_actresses a
		     where     	m.mid=c.mid 
	  			and c.actid=a.actid 
	  			and a.act_name='Ben Kingsley')
/

