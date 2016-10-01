/*****************************************************/
/*shmem.c file */
/*****************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ipc.h>
/*#include <sys/shm.h>
#include <sys/sem.h>*/
#include <pthread.h>
#include <semaphore.h>
#include <errno.h>
/*****************************************************/
#define SHM_SIZE 20  /* make it a twenty length buffer */

typedef struct {
	int head;	/* array pointer, the next position to put data */
	int tail;	/* array pointer, the next position to read data */
	int finished;	/* set it when procuder finished writing data */
	sem_t* action;	/* control access to critical data */
	sem_t* count;	/* free buffer count */
	sem_t* full;	/* buffer full flag */
	char buffer[SHM_SIZE];
}data_s;

/*****************************************************/
void* produce(void* arg);	/* produce function */
void* consume(void* arg);	/* consume function */

/*****************************************************/
int main(int argc, char *argv[])
{
	data_s data;

	/* initialize buffer data */
	data.head = 0;
	data.tail = 0;
	data.finished = 0;
	
	/* initialize semaphore */
	data.action = sem_open("/action", O_CREAT, 0, 1);
	if(data.action == SEM_FAILED){
		/* must unlink named semaphores */
		sem_unlink("/action");
		sem_unlink("/count");
		sem_unlink("/full");
		data.action = sem_open("/action", O_CREAT, 0, 1);
	}
	
	data.count = sem_open("/count", O_CREAT, 0, SHM_SIZE);
	if(data.count == SEM_FAILED){
		printf("Can't create semaphore count!%d\n",errno);
		exit(1);
	}

	data.full = sem_open("/full", O_CREAT, 0, 0);
	if(data.full == SEM_FAILED){
		printf("Can't create semaphore full!%d\n",errno);
		exit(1);
	}

	int threadID;
	pthread_t producer;
	pthread_t consumer;

	/* create producer thread */
	threadID = pthread_create(&producer, NULL, produce, (void*)&data);
	if(0 != threadID ){
		printf("Can't create producer:%d\n", threadID);
	}

	/* create consumer thread */
	if(0 != pthread_create(&consumer, NULL, consume, (void*)&data)){
		printf("Can't create consumer\n");
	}

	/* wait for two threads to complete */
	pthread_join(producer, NULL);
	pthread_join(consumer, NULL);

	/* close semaphores */
	if(0 != sem_close(data.action)){
		printf("Can't open semaphore action!\n");
	}
	
	if(0 != sem_close(data.count)){
		printf("Can't open semaphore count!\n");
	}

	if(0 != sem_close(data.full)){
		printf("Can't open semaphore full!\n");
	}

	/* must unlink named semaphores */
	sem_unlink("/action");
	sem_unlink("/count");
	sem_unlink("/full");

}

/*****************************************************/
void* produce(void* arg){
	/* open file to read */
	FILE* file = fopen("inp.txt", "r");
	if(file == NULL){
		printf("Can't open data file:inp.txt\n");
		return(NULL);
	}

	/* get data from main thread */
	data_s* data = (data_s*)arg;

	int tmp;
	char ch;
	while((ch = (char)fgetc(file)) != EOF){
		/* wait for free buffer */
		sem_wait(data->count);

		/* wait for permission to change buffer data */
		sem_wait(data->action);
		
		/* write data to buffer */
		data->buffer[data->head] = ch;
		tmp = data->head + 1;
		if(tmp == SHM_SIZE){
			tmp = 0;
		}
		data->head = tmp;

		/* release the permission*/
		sem_post(data->action);

		/* signal we write some thing to the buffer */
		sem_post(data->full);
	}

	/* when we are finished, set up the flag */
	sem_wait(data->action);
	data->finished = 1;
	sem_post(data->action);

	fflush(stdout);
	fclose(file);
	return(NULL);
}

/*****************************************************/
void* consume(void* arg){
	/* open file to write */
	FILE* file = fopen("outp.txt", "w");
	if(file == NULL){
		printf("Can't open data file:outp.txt\n");
		return(NULL);
	}

	/* get data from main thread */
	data_s* data = (data_s*)arg;

	/* write data to file */
	int tmp, count, sval=0;
	char ch;
	sem_getvalue(data->full, &sval);
	while((data->finished != 1) || (sval > 0)){
		/* wait for data in buffer */
		sem_wait(data->full);

		/* wait for permission to change buffer data */
		sem_wait(data->action);
		
		ch = data->buffer[data->tail];
		fputc((int)ch, file);

		tmp = data->tail + 1;
		if(tmp == SHM_SIZE){
			tmp = 0;
		}
		data->tail = tmp;

		/* release permission */
		sem_post(data->action);

		/* signal we have read data from buffer */
		sem_post(data->count);

		/* get amout of data in buffer */
		sem_getvalue(data->full, &sval);
	}

/*****************************************************/
	fflush(stdout);
	fclose(file);
	return(NULL);
}
