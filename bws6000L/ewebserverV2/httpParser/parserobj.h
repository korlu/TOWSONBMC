#ifndef __parserObj__
#define __parserObj__


#include "../INTERFACES/aoaprotected.h"
#include "../webserver/apptask.h"
#include "../webserver/wlist.h"

#define LINE0 0
#define LINE1 160
#define LINE2 320
#define LINE3 480
#define LINE4 640
#define LINE5 800
#define LINE6 960
#define LINE7 1120
#define LINE8 1280
#define LINE9 1440
#define LINE10 1600
#define LINE11 1760
#define LINE12 1920
#define LINE13 2080
#define LINE14 2240
#define LINE15 2400
#define LINE16 2560
#define LINE17 2720
#define LINE18 2880
#define LINE19 3040

class parserObj 
{

private:

    AOAProtected io;

public:
	int processRequest(int currenttcbrno, int currenttask);
	apptask tsk; 
	WList   wlst; 

private:
	char* strcpy(char* string1, char* string2);	
	void strcat(char* string1, char* string2);	
	int sstrcpy(char* D_Str,int D_Size,char* S_Str,int S_Size);
	int sstrcmp(char* D_Str,char* S_Str);
	int sstrlen(char* str);	
	int methodGET(char *requestMsg, int currenttcbrno,  int currenttask);	
	int checkVersion(char *);
	int checkLineBreak(char *);
	int checkMIME(char *);			//NOT IMPLEMENTED YET
	int checkLanguage(char *);		//	""
	int checkEncoding(char *);		//	""
	int checkModification(char *);		//	""
	int userAgent(char *);			//	""
	int checkHost(char *);			//	""
	int connectionStatus(char *);		//	""
	int checkCookie(char *);		//	""
	int notImplemnted(int flag);		//	""
	int pagenotFound(int flag);		//	""
	int createResponse(char *resourceName, char *cType, char *responseHeader, long *headerSize,unsigned long *fileStartAdress, unsigned long *fileSize);
	int longToStr(unsigned long *input, char *output);
};	
#endif
