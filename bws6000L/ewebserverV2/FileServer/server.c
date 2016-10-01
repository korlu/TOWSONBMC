/******************************************************************************\
* simples.c - Simple TCP/UDP server using Winsock 1.1
*       This is a part of the Microsoft® Source Code Samples.
*       Copyright 1996 - 2000 Microsoft Corporation.
*       All rights reserved.
*       This source code is only intended as a supplement to
*       Microsoft Development Tools and/or WinHelp documentation.
*       See these sources for detailed information regarding the
*       Microsoft samples programs.
To invoke server: 
   server -p udp -e 1444

cl  
\******************************************************************************/

#define WIN32_LEAN_AND_MEAN
#include <winsock.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define DEFAULT_PORT 5001
#define DEFAULT_PROTO SOCK_STREAM // TCP

void Usage(char *progname) {
    fprintf(stderr,"Usage\n%s -p [protocol] -e [endpoint] -i [interface]\n",
        progname);
    fprintf(stderr,"Where:\n\tprotocol is one of TCP or UDP\n");
    fprintf(stderr,"\tendpoint is the port to listen on\n");
    fprintf(stderr,"\tinterface is the ipaddr (in dotted decimal notation)");
    fprintf(stderr," to bind to\n");
    fprintf(stderr,"Defaults are TCP,5001 and INADDR_ANY\n");
    WSACleanup();
    exit(1);
}
int main(int argc, char **argv) {

    char Buffer[128];
    char *interface= NULL;
    unsigned short port=DEFAULT_PORT;
    int retval;
    int fromlen;
    int i;
    int socket_type = DEFAULT_PROTO;
    struct sockaddr_in local, from;
    WSADATA wsaData;
    SOCKET listen_socket, msgsock;

    /* Parse arguments */
    if (argc >1) {
        for(i=1;i <argc;i++) {
            if ( (argv[i][0] == '-') || (argv[i][0] == '/') ) {
                switch(tolower(argv[i][1])) {
                    case 'p':
                        if (!stricmp(argv[i+1], "TCP") )
                            socket_type = SOCK_STREAM;
                        else if (!stricmp(argv[i+1], "UDP") )
                            socket_type = SOCK_DGRAM;
                        else
                            Usage(argv[0]);
                        i++;
                        break;

                    case 'i':
                        interface = argv[++i];
                        break;
                    case 'e':
                        port = atoi(argv[++i]);
                        break;
                    default:
                        Usage(argv[0]);
                        break;
                }
            }
            else
                Usage(argv[0]);
        }
    }
    
    if ((retval = WSAStartup(0x202,&wsaData)) != 0) {
        fprintf(stderr,"WSAStartup failed with error %d\n",retval);
        WSACleanup();
        return -1;
    }
    
    if (port == 0){
        Usage(argv[0]);
    }

    local.sin_family = AF_INET;
    local.sin_addr.s_addr = (!interface)?INADDR_ANY:inet_addr(interface); 

    /* 
     * Port MUST be in Network Byte Order
     */
    local.sin_port = htons(port);

    listen_socket = socket(AF_INET, socket_type,0); // TCP socket
    
    if (listen_socket == INVALID_SOCKET){
        fprintf(stderr,"socket() failed with error %d\n",WSAGetLastError());
        WSACleanup();
        return -1;
    }
    //
    // bind() associates a local address and port combination with the
    // socket just created. This is most useful when the application is a 
    // server that has a well-known port that clients know about in advance.
    //

    if (bind(listen_socket,(struct sockaddr*)&local,sizeof(local) ) 
        == SOCKET_ERROR) {
        fprintf(stderr,"bind() failed with error %d\n",WSAGetLastError());
        WSACleanup();
        return -1;
    }

    //
    // So far, everything we did was applicable to TCP as well as UDP.
    // However, there are certain steps that do not work when the server is
    // using UDP.
    //

    // We cannot listen() on a UDP socket.

    if (socket_type != SOCK_DGRAM) {
        if (listen(listen_socket,5) == SOCKET_ERROR) {
            fprintf(stderr,"listen() failed with error %d\n",WSAGetLastError());
            WSACleanup();
            return -1;
        }
    }
    printf("%s: 'Listening' on port %d, protocol %s\n",argv[0],port,
        (socket_type == SOCK_STREAM)?"TCP":"UDP");
    while(1) {
        fromlen =sizeof(from);
        //
        // accept() doesn't make sense on UDP, since we do not listen()
        //
        if (socket_type != SOCK_DGRAM) {
            msgsock = accept(listen_socket,(struct sockaddr*)&from, &fromlen);
            if (msgsock == INVALID_SOCKET) {
                fprintf(stderr,"accept() error %d\n",WSAGetLastError());
                WSACleanup();
                return -1;
            }
            printf("accepted connection from %s, port %d\n", 
                        inet_ntoa(from.sin_addr),
                        htons(from.sin_port)) ;
            
        }
        else
            msgsock = listen_socket;

        //
        // In the case of SOCK_STREAM, the server can do recv() and 
        // send() on the accepted socket and then close it.

        // However, for SOCK_DGRAM (UDP), the server will do
        // recvfrom() and sendto()  in a loop.

        if (socket_type != SOCK_DGRAM)
            retval = recv(msgsock,Buffer,sizeof (Buffer),0 );
	//Here i will call my function when ever i recieve any thing
	//AFTP starts here
	
	
        else {
            retval = recvfrom(msgsock,Buffer,sizeof (Buffer),0,
                (struct sockaddr *)&from,&fromlen);
            //printf("Received datagram from %s\n",inet_ntoa(from.sin_addr));
        }
            
        if (retval == SOCKET_ERROR) {
            fprintf(stderr,"recv() failed: error %d\n",WSAGetLastError());
            closesocket(msgsock);
            continue;
        }
        if (retval == 0) {
            printf("Client closed connection\n");
            closesocket(msgsock);
            continue;
        }

	//Buffer[retval-1] = '\0';
        //printf("Received %d bytes, data [%s] from client\n",retval,Buffer);
	printf("Received message:");
	for(i=0; i<retval; i++)
		printf("%c", Buffer[i]);
	printf("\n");

        //printf("Echoing same data back to client\n");
	printf("Message to send back:");
	gets(Buffer);
	retval = strlen(Buffer);
	
        if (socket_type != SOCK_DGRAM)
            //retval = send(msgsock,Buffer,sizeof(Buffer),0);
	    retval = send(msgsock, Buffer, retval, 0);
        else
            //retval = sendto(msgsock,Buffer,sizeof (Buffer),0,
            //    (struct sockaddr *)&from,fromlen);
	    retval = sendto(msgsock, Buffer, retval, 0,
		(struct sockaddr *)&from, fromlen);

        if (retval == SOCKET_ERROR) {
            fprintf(stderr,"send() failed: error %d\n",WSAGetLastError());
        }
        if (socket_type != SOCK_DGRAM){
            printf("Terminating connection\n");
            closesocket(msgsock);
        }
        else 
            //printf("UDP server looping back for more requests\n");
        continue;
    }
}

int AFTP(long bufferAddress)
{
int i;
char *buffPtr;
bufferPtr=(char *)bufferAddress;
    for(i=0;i<3;i++)
    	{
    	if(bufferPtr[0]==1 && bufferPtr[1]==0 && buffer[2]==1)
    		{
    		//101 means Start Transferring
		//call send to send ACK  for 102 which is 102 followed by status code 201
		//and wait for ack
		//no ack retransmit
		}
	else if(bufferPtr[0]==2 && bufferPtr[1]==0 && buffer[2]==2)
		{
		//202 means client is ready to accept files
		//send 301 which means file
				}
	else if(bufferPtr[0]==2 && bufferPtr[1]==0 && buffer[2]==3)
		{
		//203 means client is not ready to accept files
		//end connection go back to accept connection
		}
	else if(bufferPtr[0]==2 && bufferPtr[1]==0 && buffer[2]==4)
		{
		//204 means file already exists
		//send 201
		//go back to rec
		}	
   	else if(bufferPtr[0]==3 && bufferPtr[1]==0 && buffer[2]==2)
		{
		//302 is an ack meaning data send was recieved send more
		//send 301 which means file
		//wait for ACk if not recieved resend
		}
	else if(bufferPtr[0]==3 && bufferPtr[1]==0 && buffer[2]==4)
		{
		//304 is an ack from client meaning that file rec complete
		//send 201 next file
		//wait for ACk if not recieved retransmit
		}	
	else if(bufferPtr[0]==1 && bufferPtr[1]==0 && buffer[2]==4)
		{
		//104 is an ack meaning Connection should end
		// go back to listen
	}	
    	}



}
