//****************************************************
// parserObj.h 
// Header file for parserObj
// Coded by Tufail Ahmed, Karthick Venkatasamy Jaganathan
// Dated 01/01/05
// Towson University, Copyright 2005
// ***************************************************

#include "../INTERFACES/aoaprotected.h"
#include "parserObj.h"
#include "../FTP/ftpObj.h"
#include "../TCP/tcpObj.h"
#include "../webserver/apptask.h"

// Global constants declaration
 
// This constant defines the maximum size of the file name 
const int  FILESIZE   = 80;	

// Status codes for response headers 
const char pageFound[]="200 OK";
const char pageNotFound[]="404 Not Found";
const char OK[]="200 OK";
char httpHeader[]="HTTP/1.1 ";
// This is used to add it to the response header 
char contentType[45]="Content-Type: text/html;";

// This is the default fiile name if the request is a directory 
char defaultFile[]="/index.htm";

// These are contents to be appended to the response header 
char acceptRange[25]="Accept-Ranges: bytes";

// This specifies the size of the fragment to send 
const int FRAGSIZE = 1000; 

/*********************************************************************************
// This method is used to identify if the 
-  0 In case the request hasbeen successfully processed 
- -1 Message is empty
- -2 Method not supported (POST, HEAD) 
- -3 Response header does not start with '/' 	
- -4 Version number does not start with ' '
- -5 No line break after version number
- -6 Version number is not 1.0 or 1.1
*********************************************************************************/

//parses the request msg the TCP DATA
int parserObj::processRequest(int currenttcbrno, int currenttask)
	{	
		TCPObj tcp;
		int retcode=0;
		char *requestMsg;
		char c1;
		int len,i=0;
		requestMsg = &c1;

		requestMsg = (char*)(tcp.getMsgPtr(currenttcbrno, &len));

		//for(i=0; i<16; i++)
		//    io.AOAprintHex((long)requestMsg[i], Line8+i*20);

		// If the request message is null return 
		if(requestMsg[0]=='\0')
		   return -1; 
		
		// Check for GET Method 	
		if(requestMsg[0] == 'G' && requestMsg[1] == 'E' && requestMsg[2] == 'T' && requestMsg[3] == ' ')
		{
			// Calling method Get 	
			//wlst.insert(currenttask, tsk.Current_TCBRNo, 0x01000000, 2); 
			retcode = methodGET(&requestMsg[4], currenttcbrno, currenttask);
			//wlst.insert(currenttask, tsk.Current_TCBRNo, 0x04000000, 2); 
			return retcode;
		}
		else if(requestMsg[0] == 'P' &&	requestMsg[1] == 'O' && requestMsg[2] == 'S' && requestMsg[3] == 'T') 
		{
			//--------------------------------------------------------------------
			// In here Post method is not implemented 
			// But dont u have to send any message to the client saying that the
			// server doesnot support post 
			//wlst.insert(currenttask, tsk.Current_TCBRNo, 0x0f000000, 2); 
	        	return -2;
			//--------------------------------------------------------------------
		}
        else if(requestMsg[0] == 'H' &&	requestMsg[1] == 'E' && requestMsg[2] == 'A' && requestMsg[3] == 'D')
		{	//--------------------------------------------------------------------	
			// In here head is not implemented 
			// but dont u have to specify it to the client that the server doesnot 
			// support this method
			//wlst.insert(currenttask, tsk.Current_TCBRNo, 0x0f000000, 2); 
			return -3;    
			//--------------------------------------------------------------------
		}
		else
		{
			//wlst.insert(currenttask, tsk.Current_TCBRNo, 0x0f000000, 2); 
            io.AOAprintHex((long)requestMsg, Line6+20); 
            io.AOAPrintText(" eroor in parserobj", Line7+20); 
            io.Application_Status = 2; 
            io.AOAExit(); 
			return -4;
		}
   
  	 return 0;
    }

/********************************************************************************************
 * This is a parser for GET Method 
 * This method processes the get request 
 ********************************************************************************************/
int parserObj::methodGET(char *requestMsg,int currenttcbrno, int currenttask)	
	{
			AOATask task;
	// TCPObject to send and receive TCP Messages 	
	TCPObj tcp;	

	// Just some counter variable to parse the file name 
	int i=0, j=0, k=0;

	// Variable to get the recource name 
	char resourceName[FILESIZE+1];
	
	// This buffer is used to create the response header 
	char responseHeader[FRAGSIZE];
	
	// This variable used to track the size of the response header 	
	long HeaderSize=0;
	// This variable is used to track the size of the resource file 
	unsigned long FileSize=0;

	// This variable used to keep track of the Resource Start Address 
	unsigned long FileStartAddress=0;
	
	// This variable is used to track the number of characters in fileName
	int fileNameSize=0;
	
	// This is a flag to denote if the resource is a file or directory 
	int fileCheck=0;
	
	// This is the variable used to track the resource type 
	char cType[4];

	int retcode=0;

	// Clear the Response header 
	responseHeader[0]='\0';

	// check if the response header starts with '/' if not return error 
	if(requestMsg[0] != '/')
	{ 
		//wlst.insert(currenttask, tsk.Current_Tcbrno, 0x0f000000, 2); 
		return -3;	
	}
	
	// Get the resource name from the resource 
	i = 1;
	// Extract the file name from the resuest 
	while(requestMsg[i]!=' ')
	{					
		resourceName[i-1]=requestMsg[i];	
		i++;	
	}
	
	if(i==1)
	{
		// If the file name is / then append index.htm to it 
		strcpy(resourceName,(char*)&defaultFile[1]); 	
	}
	else 
	{
		// Convert the resource name into string 
		// by placing '/0' at the end of the 
		// resource name 
		 resourceName[i-1]='\0';
	}
	// check and get the HTTP Version
	retcode=checkVersion(&requestMsg[i]);		
	if(retcode==0)  //parsing ends here
	{
		fileNameSize=io.AOAStrLen(resourceName);
		// IF the file name is greater than the acceptable length by AOA 
		// then truncate the file but dont retur a error 
		// since the File searching routine will find that the file name 
		// is not available so it will send a error to the client 
		// saying file not found 
		if(fileNameSize > FILESIZE)
		{
			resourceName[FILESIZE-1] ='\0';
		}
		j = 0; 
		// Get the file type and check it
		// This specifies that this is a directory 
		fileCheck = 0; 
		while(resourceName[j]!='\0' && j < FILESIZE) 
		{
			if(resourceName[j]=='.')	
			{
				// If it is a file set the flag 
				fileCheck=1;	
				k = 0;
					while(resourceName[j]!='\0' && j < FILESIZE)
					{
						cType[k]=resourceName[++j];
						k++;
					}
				//--------------	
				cType[k]='\0';
				break;	
				//--------------				
			}
			j++;	
		}
		if(fileCheck==0) //this indicates directory entry but no file entry
		{	
			//----------------------------------------------------
			if(fileNameSize> (FILESIZE- sstrlen(defaultFile)))
			{
				resourceName[fileNameSize]='\0';
			}
			else
			{
				strcat(resourceName,(char*)defaultFile);	
			}
						
		}	
	
		retcode = createResponse(resourceName,cType,responseHeader, &HeaderSize, &FileStartAddress, &FileSize);

		retcode = tcp.setFileParam(currenttcbrno, responseHeader, HeaderSize, FileStartAddress,
					    FileSize, currenttask);
		if(retcode != 0)
		   return retcode;

		// Call the TCP send to send the response 
		//wlst.insert(currenttask, tsk.Current_TCBRNo, 0x02000000, 2); 
		retcode = tcp.tcpSendN(currenttcbrno, currenttask);
		//wlst.insert(currenttask, tsk.Current_Tcbrno, 0x03000000, 2); 

		responseHeader[0] = '\0';

		return retcode;  	
	}
	else
	{
	    // if http version is not 1.0 or 1.1
         	//wlst.insert(currenttask, tsk.Current_Tcbrno, 0x0f000000, 2); 
	    return retcode; 
	}
	return 0;
}
//*******************************************************************************************
//method to check the version number of HTTP and returns the Version Number 
//*******************************************************************************************
int parserObj::checkVersion(char *requestMsg)
{
	int retcode=0; 
	if(requestMsg[0]!=' ')
	{
	  return -4;
	}
	// Check if the version number is 1.1 or 1.0 if so return 0 else return -1 
	if(requestMsg[1]=='H'&& 
	  	requestMsg[2]=='T'&&
	       	requestMsg[3]=='T'&&
	       	requestMsg[4]=='P'&&
	       	requestMsg[5]=='/'&&
	       	requestMsg[6]=='1'&&
               	requestMsg[7]=='.'&&
              	(requestMsg[8]=='0'||
	       	 requestMsg[8]=='1'))	
	      	{ 
	     	 	retcode=checkLineBreak(&requestMsg[9]);
			if(retcode == 0)
			{
		  	  	return 0;
			}
		  	else
		  	{		
				// no line break
				return -5;
		  	}
	      	}
		else
	    	{   
		    // version is not 1.0 or 1.1
	    	    return -6;
	       	}
	return 0;
}
//***********************************************************************************************
//-----------------------------------------------------------------------------------------------
//Its a costly operation to put a function call for checking the line break 
//instead the user can code it 
//-----------------------------------------------------------------------------------------------
//***********************************************************************************************
int parserObj::checkLineBreak(char *requestMsg)
	{
		if(requestMsg[0]==13 && requestMsg[1]==10)
	   	 	return 0; //true
		else
	    		return -1; //false
	}
//**********************************************************************************************
// This method is used to create the response to the client  
//**********************************************************************************************
int parserObj::createResponse(char *resourceName, char *cType, char *responseHeader,long *headerSize, unsigned long *fileStartAdress,unsigned long *fileSize)
	{
	FTPObj h1;	

    char TEncoding[] ="Transfer-Encoding: chunked";	
	char contentLength[28]="Content-Length: ";
	char *encoding=";charset=iso-8859-1";
	char Server[]="Server: DOSC Web Server Ver: 1.0";
	char conn[20]="Connection: close";
	char *statusCode;
	
	char fileSizeStr[10]="";
	char lineBreak[3];
	lineBreak[0]=13;
	lineBreak[1]=10;
	lineBreak[2]='\0';
	
	int retcode=0;
	int tempsize=0;

	// Copy the version of http into the http response 
	strcpy(responseHeader,httpHeader);                          
	// get the resource parameters 
	retcode = h1.getFile(resourceName, fileStartAdress, fileSize);
	// retcode is zero means the file is found 	
	if(retcode == 0)
	{
	 if((cType[0]=='b'|| cType[0]=='B') && (cType[1]=='m' || cType[1]=='M') && (cType[2]=='p'|| cType[2]=='P'))
		{
			// This will convert a long value into string 
	    		longToStr(fileSize,fileSizeStr);
		    	strcpy(contentType,"Content-Type: image/bmp");
			statusCode=(char*)OK;
			strcat(responseHeader, statusCode);	//200 OK 
			strcat(responseHeader, lineBreak);	//CRLF	
			//strcat(responseHeader, TEncoding);	//Content-Length=fileSize
			//strcat(responseHeader, lineBreak);	//CRLF		
			strcat(responseHeader,conn);		//Connection:close			
			strcat(responseHeader,lineBreak);		
			strcat(responseHeader, contentType);    //Content-Type: text/html; charset=iso-8859-1
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(contentLength,  fileSizeStr);
			strcat(responseHeader, contentLength);	//Content-Length=fileSize			
			contentLength[16] = '\0';		
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, acceptRange);	//Accept-Ranges: bytes	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, lineBreak);	//CRLF
		}
	else if	((cType[0]=='p'|| cType[0]=='P') && (cType[1]=='n' || cType[1]=='N') && (cType[2]=='g'|| cType[2]=='G'))
		{
			longToStr(fileSize,fileSizeStr);	
		    	strcpy(contentType,"Content-Type: image/png");
			statusCode=(char*)OK;
			strcat(responseHeader, statusCode);	// 200 OK 
			strcat(responseHeader, lineBreak);	// CRLF	
			//strcat(responseHeader, TEncoding);	// Transfer Type 
			//strcat(responseHeader, lineBreak);	//CRLF			
			strcat(responseHeader,conn);		//Connection:close			
			strcat(responseHeader,lineBreak);		
			strcat(responseHeader, contentType);    // Content-Type: text/html; 
								// charset=iso-8859-1
			strcat(responseHeader, lineBreak);	// CRLF
			strcat(contentLength, /*(longtostr)*/fileSizeStr);
			strcat(responseHeader, contentLength);	//Content-Length=fileSize	
			contentLength[16] = '\0';
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, acceptRange);	//Accept-Ranges: bytes
			strcat(responseHeader, lineBreak);	//CRLF	
			strcat(responseHeader, lineBreak);	//CRLF	
		}
	else if	((cType[0]=='g'|| cType[0]=='G') && (cType[1]=='i' || cType[1]=='I') && (cType[2]=='f'|| cType[2]=='F'))
		{
			longToStr(fileSize,fileSizeStr);	
		    strcpy(contentType,"Content-Type: image/gif");
			statusCode=(char*)OK;
			strcat(responseHeader, statusCode);	//200 OK 
			strcat(responseHeader, lineBreak);	//CRLF	
			//strcat(responseHeader, TEncoding);	// Transfer Type 
			//strcat(responseHeader, lineBreak);	//CRLF				
			strcat(responseHeader,conn);		//Connection:close			
			strcat(responseHeader,lineBreak);		
			strcat(responseHeader, contentType);    //Content-Type: text/html; charset=iso-8859-1
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(contentLength,  /*(longtostr)*/fileSizeStr);
			strcat(responseHeader, contentLength);	//Content-Length=fileSize
			contentLength[16] = '\0';	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, acceptRange);	//Accept-Ranges: bytes	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, lineBreak);	//CRLF	
		}	
	else if	(( (cType[0]=='j' || cType[0]=='J') && (cType[1]=='p' || cType[1]=='P') &&
		   (cType[2]=='g' || cType[2]=='G')))
		{
			longToStr(fileSize,fileSizeStr);	
		    	strcpy(contentType,"Content-Type: image/jpeg");
			statusCode=(char*)OK;
			strcat(responseHeader, statusCode);	//200 OK 
			strcat(responseHeader, lineBreak);	//CRLF	
			//strcat(responseHeader, TEncoding);	// Transfer Type 
			//strcat(responseHeader, lineBreak);	//CRLF				
			strcat(responseHeader,conn);		//Connection:close			
			strcat(responseHeader,lineBreak);		
			strcat(responseHeader, contentType);    //Content-Type: text/html; charset=iso-8859-1
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(contentLength,  /*(longtostr)*/fileSizeStr);
			strcat(responseHeader, contentLength);	//Content-Length=fileSize
			contentLength[16] = '\0';	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, acceptRange);	//Accept-Ranges: bytes	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, lineBreak);	//CRLF	
		}
	else if	((cType[0]=='d'|| cType[0]=='D') && (cType[1]=='o' || cType[1]=='O') &&
		 (cType[2]=='c'|| cType[2]=='C')) 
		{
			longToStr(fileSize,fileSizeStr);	
		    	strcpy(contentType,"Content-Type: application/msword");
			statusCode=(char*)OK;
			strcat(responseHeader, statusCode);	//200 OK 
			strcat(responseHeader, lineBreak);	//CRLF	
			//strcat(responseHeader, TEncoding);	// Transfer Type 
			//strcat(responseHeader, lineBreak);	//CRLF				
			strcat(responseHeader,conn);		//Connection:close			
			strcat(responseHeader,lineBreak);		
			strcat(responseHeader, contentType);    //Content-Type: text/html; charset=iso-8859-1
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(contentLength,  /*(longtostr)*/fileSizeStr);
			strcat(responseHeader, contentLength);	//Content-Length=fileSize
			contentLength[16] = '\0';	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, acceptRange);	//Accept-Ranges: bytes	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, lineBreak);	//CRLF	
		}
	else if	((cType[0]=='p'|| cType[0]=='P') && (cType[1]=='d' || cType[1]=='D') && (cType[2]=='f'|| cType[2]=='F'))
		{
			longToStr(fileSize,fileSizeStr);		
		    	strcpy(contentType,"Content-Type: application/pdf");
			statusCode=(char*)OK;
			strcat(responseHeader, statusCode);	//200 OK 
			strcat(responseHeader, lineBreak);	//CRLF	
			//strcat(responseHeader, TEncoding);	// Transfer Type 
			//strcat(responseHeader, lineBreak);	//CRLF				
			strcat(responseHeader,conn);		//Connection:close			
			strcat(responseHeader,lineBreak);		
			strcat(responseHeader, contentType);    //Content-Type: text/html; charset=iso-8859-1
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(contentLength,  /*(longtostr)*/fileSizeStr);
			strcat(responseHeader, contentLength);	//Content-Length=fileSize
			contentLength[16] = '\0'; 	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, acceptRange);	//Accept-Ranges: bytes	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, lineBreak);	//CRLF	
		}	
	else if	((cType[0]=='t'|| cType[0]=='T') && (cType[1]=='x'|| cType[1]=='X')&& (cType[2]=='t'|| cType[2]=='T'))
		{
			longToStr(fileSize,fileSizeStr);		
		    	strcpy(contentType,"Content-Type: text/plain");
			statusCode=(char*)OK;
			strcat(responseHeader, statusCode);	//200 OK 
			strcat(responseHeader, lineBreak);	//CRLF	
			//strcat(responseHeader, TEncoding);	// Transfer Type 
			//strcat(responseHeader, lineBreak);	//CRLF				
			strcat(responseHeader,conn);		//Connection:close			
			strcat(responseHeader,lineBreak);		
			strcat(responseHeader, contentType);    //Content-Type: text/html; charset=iso-8859-1
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(contentLength,  /*(longtostr)*/fileSizeStr);
			strcat(responseHeader, contentLength);	//Content-Length=fileSize
			contentLength[0] = '\0';	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, acceptRange);	//Accept-Ranges: bytes	
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(responseHeader, lineBreak);	//CRLF	
		}	
	else	//if page is found and its HTML or HTM or any other typr then defined above
		{	
			longToStr(fileSize,fileSizeStr);	
		    	strcpy(contentType,"Content-Type: text/html");	
		        statusCode=(char*)pageFound;
			strcat(responseHeader,statusCode);	//302 Found	
			strcat(responseHeader,lineBreak);
			//strcat(responseHeader, TEncoding);	// Transfer Type 
			//strcat(responseHeader, lineBreak);	//CRLF					
			strcat(responseHeader,Server);		//Server: AOA Web Server 1.0
			strcat(responseHeader,lineBreak);	
			strcat(responseHeader,conn);		//Connection:close			
			strcat(responseHeader,lineBreak);	
			strcat(contentType,encoding);
			strcat(responseHeader, contentType);	//Content-Type: text/html; charset=iso-8859-1
			strcat(responseHeader, lineBreak);	//CRLF
			strcat(contentLength,  /*(longtostr)*/fileSizeStr);
			strcat(responseHeader, contentLength);	//Content-Length=fileSize	
			strcat(responseHeader,lineBreak);
			strcat(responseHeader,lineBreak);	
		}
			
	}
	else 
	{	// file not found
	// if file is not found, send the page "pagenofound.html" to the client
	strcpy(resourceName,"pagenotfound.html");
	tempsize = io.AOAStrLen(resourceName);	
	resourceName[tempsize] = '\0';
	
	// get the resource parameters 
	retcode = h1.getFile(resourceName, fileStartAdress, fileSize);
	
	longToStr(fileSize,fileSizeStr);	
    strcpy(contentType,"Content-Type: text/html");	
    statusCode=(char*)pageFound;
	strcat(responseHeader,statusCode);	//302 Found	
	strcat(responseHeader,lineBreak);
	//strcat(responseHeader, TEncoding);	// Transfer Type 
	//strcat(responseHeader, lineBreak);	//CRLF					
	strcat(responseHeader,Server);		//Server: AOA Web Server 1.0
	strcat(responseHeader,lineBreak);	
	strcat(responseHeader,conn);		//Connection:close			
	strcat(responseHeader,lineBreak);	
	strcat(contentType,encoding);
	strcat(responseHeader, contentType);	//Content-Type: text/html; charset=iso-8859-1
	strcat(responseHeader, lineBreak);	//CRLF
	strcat(contentLength,  /*(longtostr)*/fileSizeStr);
	strcat(responseHeader, contentLength);	//Content-Length=fileSize	
	strcat(responseHeader,lineBreak);
	strcat(responseHeader,lineBreak);		
    	}    
	
	*headerSize=io.AOAStrLenAll(responseHeader);
	return 0;
}



//SSTRCMP
//
int parserObj::sstrcmp(char* D_Str,char* S_Str)
{
   int i=0;
   AOAProtected io;
   if(sstrlen(D_Str) != sstrlen(S_Str))
   {
       return -1;
   }
   
   while((D_Str[i]!=0x00 ||  S_Str[i]!=0x00))
   {
       if(D_Str[i]==S_Str[i])
       {
	   i++;
       }
       else if(D_Str[i]=='/')
       {
	   if(S_Str[i]!='\\');
	   	return -1;
		i++;
       }
       else if(D_Str[i]=='\\')
       {
	   if(S_Str[i]!='/')
	   	return -1;
	   i++;
	
       }
       else if(D_Str[i] != S_Str[i])
       {
	   return -1;
       }
       
   }
   if(D_Str[i]==0x00 && S_Str[i]==0x00)
   {
       return 0;
   }
   else
   {
       return -1;
   }
   return -1;
}

int parserObj::sstrcpy(char* D_Str,int D_Size,char* S_Str,int S_Size)
{
int i=0;
int D_Full_flag = 0;
  if(D_Size < 2)
   {
    if(D_Size < 1)
      return -1; 
    if(D_Size == 1)
      {
       D_Str[0] = 0x00;
       return 0;
      }       
   }    
  if(S_Size < 2)
   {
     D_Str[0] = 0x00; 
     return 0; 
   } 
 while(S_Str[i]!=0x00)
   {
     if(i<D_Size)
     {
          if(i< S_Size) 
            D_Str[i] = S_Str[i];
          else
	   { 
            D_Str[i] = 0x00; 
            return 0; 
           } 
     }
     else
     { 
       D_Str[D_Size-1] = 0x00; 
       return 0; 
     }  
     i++;
   }
   if(i<D_Size)
   {
    D_Str[i] = 0x00;
   }
   else
   {
    D_Str[D_Size-1]=0x00; 
   }
return 0;
} 

int parserObj::sstrlen(char* str)
{
	int len;
	len = 0;
	//if the char in string is not '\0' then go on until it reaches the MaxLen
	while(str[len] != 0x00)   
	{
		len++;
	}
	return len;
}
char* parserObj::strcpy(char* string1, char* string2)
{
	int i = 0;
	while(string2[i] != '\0')
	{
		string1[i] = string2[i];
		i++;
	}
	string1[i] = '\0';
	
	return string1;
}

void parserObj::strcat(char* string1, char* string2)
{
	//copy the chars in str1 into str, except '\0'
	int i = 0;
	int j = 0;
	while(string1[i] != '\0')
	{
		i++;
	}

	// i now indexes the NULL
	while(string2[j] != '\0')
	{
		string1[i] = string2[j];
		i++;
		j++;
	}
	string1[i] = string2[j];
}
/****************************************************************************************/

int parserObj::longToStr(unsigned long *input, char *output)
{

char temp[10];
unsigned long temp1=*input;
int i=0,j=0;

	while(temp1 > 9)	
	{
	temp[i++] = ((temp1%10) + 0x30);

	temp1 = temp1/10;
	}
	temp[i] = ((temp1) + 0x30);

	j=0;

	while(temp[i--]=='0');

	i=i+1;
	while(i >= 0)
	{
	 output[j++]=temp[i--];
	}
	output[j]='\0';
	return 0;
}
