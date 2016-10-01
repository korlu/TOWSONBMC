/////////////////////////////////////////////////////////////////////*
//                                                                //
//    AFTP uses UDP protocol to transfer files to DOSC Machines   //
//								  //
////////////////////////////////////////////////////////////////////*

#define WIN32_LEAN_AND_MEAN
#include <winsock.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define DEFAULT_PORT 5008
#define DEFAULT_PROTO SOCK_DGRAM// UDP


void main(void)
{
char Buffer[128];						//recv buffer
char sendBuffer[1003];						//send buffer
char *interface= NULL;						//we just use one interface
unsigned short port=DEFAULT_PORT;				//default port 5001
int retval;
int fromlen;
int i;
int statusCode=0; 						//says what to send to the client
int socket_type = DEFAULT_PROTO;				//udp
struct sockaddr_in local, from;					
WSADATA wsaData;			
SOCKET listen_socket, msgsock;

	if((retval = WSAStartup(0x202,&wsaData)) != 0) 
		{
		fprintf(stderr,"WSAStartup failed with error %d\n",retval);
        	WSACleanup();
        	//return -1;
    		}

	local.sin_family = AF_INET;
	local.sin_addr.s_addr = (!interface)?INADDR_ANY:inet_addr(interface); 

/* 
 Port MUST be in Network Byte Order
*/
	local.sin_port = htons(port);

	listen_socket = socket(AF_INET, socket_type,0); // UDP socket	
	
	if (listen_socket == INVALID_SOCKET)
		{
        	fprintf(stderr,"socket() failed with error %d\n",WSAGetLastError());
        	WSACleanup();
        	//return -1;
    		}	

//
    // bind() associates a local address and port combination with the
    // socket just created. This is most useful when the application is a 
    // server that has a well-known port that clients know about in advance.
    //

	if (bind(listen_socket,(struct sockaddr*)&local,sizeof(local) ) == SOCKET_ERROR) 
		{
        	fprintf(stderr,"bind() failed with error %d\n",WSAGetLastError());
        	WSACleanup();
       		// return -1;
    		}

    while(1)
    		{
		    
		fromlen =sizeof(from);	
		msgsock = listen_socket;	
		
		// However, for SOCK_DGRAM (UDP), the server will do
        	// recvfrom() and sendto()  in a loop.
		retval = recvfrom(msgsock,Buffer,sizeof (Buffer),0,(struct sockaddr *)&from,&fromlen);
            	
			
		printf("Received datagram from %s\n",inet_ntoa(from.sin_addr));
	 	
		if (retval == SOCKET_ERROR) 
			{
            		fprintf(stderr,"recv() failed: error %d\n",WSAGetLastError());
            		closesocket(msgsock);
            		continue;
        		}	
	
		if (retval == 0) 
			{
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


		
		statusCode=Protocol(Buffer);
		if(statusCode==-1)
			{
			continue;
			}
		else if(statusCode==-201)
			{
			
			continue;
			}
		else if(statusCode==-2010)
			{
			continue;
			}
		else if(statusCode==-301)
			{
			continue;
			}
		else if(statusCode==-3010)
			{
			continue;
			}
		else
			continue;





		

		
        	printf("Echoing same data back to client\n");
		printf("Message to send back:");
		gets(Buffer);
		retval = strlen(Buffer);	
		
		//retval = sendto(msgsock,Buffer,sizeof (Buffer),0,
		//(struct sockaddr *)&from,fromlen);
		retval = sendto(msgsock, Buffer, retval, 0,(struct sockaddr *)&from, fromlen);	
		
		if (retval == SOCKET_ERROR) 
			{
            		fprintf(stderr,"send() failed: error %d\n",WSAGetLastError());	
			}	
			
			printf("UDP server looping back for more requests\n");	
		
		}
}

int Protocol(long bufferAdd)
{
int i;
char *buffPtr;
bufferPtr=(char *)bufferAddress;
    for(i=0;i<3;i++)
    	{
    	if(bufferPtr[0]==1 && bufferPtr[1]==0 && buffer[2]==1)
    		{
    		//101 means Start Transferring
		//return 201;		//means send first file in index
		}
	else if(bufferPtr[0]==2 && bufferPtr[1]==0 && buffer[2]==2)
		{
		//202 means client is ready to accept files
		//return 301; 
		}
	else if(bufferPtr[0]==2 && bufferPtr[1]==0 && buffer[2]==3)
		{
		//203 means client is not ready to accept files
		//return -1;
		}
	else if(bufferPtr[0]==2 && bufferPtr[1]==0 && buffer[2]==4)
		{
		//204 means file already exists
		//return 2010;			//means that send next file
				}	
   	else if(bufferPtr[0]==3 && bufferPtr[1]==0 && buffer[2]==2)
		{
		//302 is an ack meaning data send was recieved send more
		//return 3010; 			//means countinue sending next chunk
		
		}
	else if(bufferPtr[0]==3 && bufferPtr[1]==0 && buffer[2]==4)
		{
		//304 is an ack from client meaning that file rec complete
		//return 2010;			// next file
		}	
	else if(bufferPtr[0]==1 && bufferPtr[1]==0 && buffer[2]==4)
		{
		//104 is an ack meaning Connection should end
		// return -1;
		}
	else
		return -1;				
    	}

}
