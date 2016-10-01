/* include main */
#include	"unpipc.h"
#include <sched.h>
#include <time.h>

#define	MAXNITEMS 		1000000
#define	MAXNTHREADS			100

int		nitems;			/* read-only by producer and consumer */
int		count[MAXNTHREADS];
time_t		ptime[MAXNTHREADS];

struct {
  pthread_mutex_t	mutex;
  int	buff[MAXNITEMS];
  int	nput;
  int	nval;
} shared;

void	*produce(void *), *consume(void *);

int
main(int argc, char **argv)
{
	int			i, nthreads;
	int pret;
	pthread_attr_t *pattr;
	pthread_t	tid_produce[MAXNTHREADS], tid_consume;

	if (argc != 3){
		printf("Usage: prodcons2 <#items> <#threads>\n");
		exit(1);
	}
	nitems = min(atoi(argv[1]), MAXNITEMS);
	nthreads = min(atoi(argv[2]), MAXNTHREADS);

	/*
	pthread_attr_setschedpolicy(pthread_attr_t *, int);
	SCHED_FIFO, SCHED_RR, SCHED_OTHER
	*/

	/*if((pret=pthread_attr_setschedpolicy(pattr, SCHED_FIFO)) !=0){
		printf("Cannot set policy\n");
		exit(1);
	}*/

	pthread_mutex_init(&shared.mutex, NULL);

		/* start all the producer threads */
	for (i = 0; i < nthreads; i++) {
		count[i] = 0;
		if( (pret = pthread_create(&tid_produce[i], NULL, produce, &count[i])) != 0){
			printf("Error creating thread:%d\n", pret);
			exit(1);
		}
		ptime[i] = time(NULL);
	}

		/* wait for all the producer threads */
	for (i = 0; i < nthreads; i++) {
		pthread_join(tid_produce[i], NULL);
		printf("count[%d] = %d\n", i, count[i]);	
	}

		/* 4start, then wait for the consumer thread */
	if((pret=pthread_create(&tid_consume, NULL, consume, NULL)) != 0){
		printf("Error creating thread:%d\n", pret);
		exit(1);
	}
	pthread_join(tid_consume, NULL);

	exit(0);
}
/* end main */

/* include producer */
void *
produce(void *arg)
{
	int pret;

	for ( ; ; ) {
		//printf("Thread id:%d\n", pthread_self());
		
		//sleep(pthread_self());

		if((pret=pthread_mutex_lock(&shared.mutex))!=0){
			printf("Error locking mutex:%d\n", pret);
			exit(1);
		}
		if (shared.nput >= nitems) {
			printf("Thread %d last %d\n", pthread_self(), time(NULL)-ptime[pthread_self()-2]);
			if((pret=pthread_mutex_unlock(&shared.mutex))!= 0){
				printf("Error unlocking mutex:%d\n",pret);
				exit(1);
		}
			return(NULL);		/* array is full, we're done */
		}
		shared.buff[shared.nput] = shared.nval;
		//printf("%d;%d;%d\n",shared.nput,shared.nval,shared.buff[shared.nput]);
		shared.nput++;
		shared.nval++;
		if((pret=pthread_mutex_unlock(&shared.mutex))!=0){
			printf("Error unlocking mutex:%d\n", pret);
			exit(1);
		}

		sleep(1);
		*((int *) arg) += 1;
	}
}

void *
consume(void *arg)
{
	int		i;

	for (i = 0; i < nitems; i++) {
		if (shared.buff[i] != i)
			printf("buff[%d] = %d\n", i, shared.buff[i]);
	}
	return(NULL);
}
/* end producer */
