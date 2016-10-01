/* Create a view that show each movie's director, actor/actress */
/* and its casts. */

drop view movie_cast cascade constraints;

create view 	movie_cast
as select	m.title, d.last_name, c.name_played, a.act_name
   from		movies m, directors d, casts c, actors_actresses a
   where	m.mid=d.mid and m.mid=c.mid and c.actid=a.actid
/

select	last_name director, name_played cast, act_name actor
from	movie_cast
where	last_name='Spielberg'
/

