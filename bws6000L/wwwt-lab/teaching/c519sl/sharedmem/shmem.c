/**********************************************/
/* shmem.c                               */
/* Shared memory example                */
/**********************************************/
#include <stdio.h>
#include<unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#define buffer_size 20

typedef struct
{
  char buffer[buffer_size];
}buf;
typedef struct
{
  int in, out;
  int readCount;
  int writeCount;
  int readFinish;
  int totalWords;
}vars;
 buf* buffPtr;
 vars* variables;
/**********************************************/
 int  main()
{
  
  FILE* infile;
  FILE* outfile;
  buf* buffPtr;
  vars* variables;
  int pid;
  int avgWords;
  
  int shmId1=0;
  int shmId2=0;
  char read[30];
  char write[30];
   shmId1 = shmget(IPC_PRIVATE, sizeof( buf), 0600);
  if(( buffPtr = (buf*)shmat( shmId1, NULL, 0))==NULL)
    printf("Can't attach shared memory\n");
  
   shmId2=shmget(IPC_PRIVATE,sizeof( vars),0600);
   if((variables=(vars*)shmat(shmId2,NULL,0))==NULL)
    printf("Can't attach shared memory for variables\n");

   variables->in = 0;
   variables->out = 0;
   variables->readCount = 0;
   variables->writeCount =0;
   variables->readFinish=0;
   variables->totalWords=0;

  pid = fork();

  if ( pid > 0 )
    {
      printf( "This is Producer:\n" );

      infile = fopen( "inp.txt","r");

      if ( infile==NULL )
        {
          printf( "input file cannot be opened" );
          exit ( 0 );
        }
      else
        {
	  
          fscanf( infile,"%s",read);
         strcpy( buffPtr[variables->in].buffer,read);
	        if(variables->in>variables->out)
	        {
    variables->totalWords = 
               variables->totalWords + ( variables->in -variables->out );
	        }
                else
                  {
	  variables->totalWords=
            variables->totalWords+(variables->in-variables->out)+buffer_size;
                  }

          while(!feof(infile))
            {
              if ( ( (variables->in+1) % buffer_size ) == variables->out )
                {
		  printf("Buffer is full\n");

                }//end of sleep while loop
               while ( ( (variables->in+1) % buffer_size ) == variables->out )
                ;                       
                
	       variables->in = ( variables->in + 1 ) % buffer_size;
	       variables->readCount = variables->readCount+1;
               fscanf( infile,"%s", read);
              strcpy(buffPtr[variables->in].buffer,read);
	      if(variables->in>variables->out)
                {
      variables->totalWords =
      variables->totalWords + ( variables->in -variables->out );
                }
                else
                  {
          variables->totalWords=
            variables->totalWords+(variables->in-variables->out)+buffer_size;
                  }

            }//end of read==1 while loop

              printf("Reading Finished\n");
              variables->readFinish=1;
              fclose(infile);
	      wait((int *)0);
             avgWords = 
        variables->totalWords / (variables->readCount+variables->writeCount);

              printf( "Average words in buffer is:%d\n ",avgWords );
	     
 if (shmctl( shmId1, IPC_RMID, NULL ) < 0 )
                {
                printf ( "shmctl failed for buf structure" );
                }
               else
               {
                printf ( "Deleting shared memory for buffer structure is successful\n" );
                }
              if (shmctl( shmId2, IPC_RMID, NULL ) < 0 )
             {
             printf ( "shmctl failed for variables structure" );
             }
               else
		 {
		   printf ( "Deleting shared memory for variable structure is successful\n" );
		 }
  
        }//end of else infile is not less than 0
      exit(0);
    }//end of pid>0 if condition

  else if(pid==0) // Consumer process
    {
      printf( "This is Consumer.\n" );

      outfile = fopen( "outp.txt","w" );

      if ( outfile==NULL )
        {
          printf( "output file can't be opened" );
          exit ( 0);
        }

      else
        {
          
           if ( variables->in == variables->out )
	     {
	       printf("Buffer is empty\n");
              
	     }
	   while ( variables->in == variables->out )
	     ;
	   strcpy(write,buffPtr[variables->out].buffer);
          fprintf( outfile,"%s ",write); 
	  variables->out = ( variables->out + 1 ) % buffer_size;
          variables-> writeCount=variables->writeCount+1;
	  if(variables->in>variables->out)
	    {
    variables->totalWords =
      variables->totalWords + ( variables->in -variables->out );
	    }
                else
                  {
          variables->totalWords=
            variables->totalWords+(variables->in-variables->out)+buffer_size;
                  }
	  
          while(1)
            {

              if((variables->readFinish==1)&&(variables->in==variables->out))
                {
		  printf("Writing finished\n");
		 exit(0);
		}
              if ( variables->in == variables->out )
                {
		    printf("Buffer is empty\n");
                }
	       while ( variables->in == variables->out )
		 ;
       	      strcpy(write,buffPtr[variables->out].buffer);
	      fprintf( outfile,"%s ",write);
              variables->out = ( variables->out + 1 ) % buffer_size;
              variables-> writeCount=variables->writeCount+1;
              if(variables->in>variables->out)
                {
         variables->totalWords =
        variables->totalWords + ( variables->in -variables->out );
                }
                else
                  {
          variables->totalWords=
            variables->totalWords+(variables->in-variables->out)+buffer_size;
              }
              
            }//end of read count and writecount comparision loop
             
        }//end of outfile is not less than zero condition
      
    }//end of pid==0 condition
  return 0;
}//end of main

