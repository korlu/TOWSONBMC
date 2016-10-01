gcc prodcons2.c -D_REENTRANT -DSUNOS -D_POSIX_THREADS -D_POSIX_THREAD_SAFE_FUNCTIONS -D_PTHREADS -lpthread -lposix4 -lnsl -lsocket -lthread -o prodcons2 
