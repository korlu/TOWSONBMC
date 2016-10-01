/* List actor/actress who plays in the movie of 'Saving Private Ryan'. */

select    a.act_name
from      actors_actresses a, casts c, movies m
where     m.mid=c.mid
          and   c.actid=a.actid
          and   m.title='Saving Private Ryan'
/