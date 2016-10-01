//intexception.h filename
#ifndef __IntExecetion
#define __IntException__
//*******************************************************************
//Towson University Copyright 2004
//Coded by R.K.Karne, Dated March 30, 2005
// All the interrupt exceptions are written in this file 
//*******************************************************************
#include "../INTERFACES/AOAProtected.h"

class IntException
{
    private:
	AOAProtected io;  

    public:
	char a; 

	typedef void (IntException::*pmfd1)(long);  //typedef for a member ptr 	

	long *getFunctionPtr(pmfd1);
	long *Function_Address_Array1;
	long l100; 

	IntException(); 	
	void IntExceptionInit(); 
	void IntException000(long); 
	void IntException001(long); 
	void IntException002(long); 
	void IntException003(long); 
	void IntException004(long); 
	void IntException005(long); 
	void IntException006(long); 
	void IntException007(long); 

	void IntException010(long); 
	void IntException011(long); 
	void IntException012(long); 
	void IntException013(long); 

	void IntException016(long); 
	void IntException017(long); 
	void IntException018(long); 
	void IntException019(long); 

	void IntException020(long); 
	void IntException021(long); 
	void IntException022(long); 
	void IntException023(long); 
	void IntException024(long); 
	void IntException025(long); 
	void IntException026(long); 
	void IntException027(long); 
	void IntException028(long); 
	void IntException029(long); 

	void IntException030(long); 
	void IntException031(long); 
	void IntException032(long); 
	void IntException033(long); 
	void IntException034(long); 
	void IntException035(long); 
	void IntException036(long); 
	void IntException037(long); 
	void IntException038(long); 
	void IntException039(long); 

	void IntException040(long); 
	void IntException041(long); 
	void IntException042(long); 
	void IntException043(long); 
	void IntException044(long); 
	void IntException045(long); 
	void IntException046(long); 
	void IntException047(long); 
	void IntException048(long); 
	void IntException049(long); 

	void IntException050(long); 
	void IntException051(long); 
	void IntException052(long); 
	void IntException053(long); 
	void IntException054(long); 
	void IntException055(long); 
	void IntException056(long); 
	void IntException057(long); 
	void IntException058(long); 
	void IntException059(long); 

	void IntException060(long); 
	void IntException061(long); 
	void IntException062(long); 
	void IntException063(long); 
	void IntException064(long); 
	void IntException065(long); 
	void IntException066(long); 
	void IntException067(long); 
	void IntException068(long); 
	void IntException069(long); 

	void IntException070(long); 
	void IntException071(long); 
	void IntException072(long); 
	void IntException073(long); 
	void IntException074(long); 
	void IntException075(long); 
	void IntException076(long); 
	void IntException077(long); 
	void IntException078(long); 
	void IntException079(long); 

	void IntException080(long); 
	void IntException081(long); 
	void IntException082(long); 
	void IntException083(long); 
	void IntException084(long); 
	void IntException085(long); 
	void IntException086(long); 
	void IntException087(long); 
	void IntException088(long); 
	void IntException089(long); 

	void IntException090(long); 
	void IntException091(long); 
	void IntException092(long); 
	void IntException093(long); 
	void IntException094(long); 
	void IntException095(long); 
	void IntException096(long); 
	void IntException097(long); 
	void IntException098(long); 
	void IntException099(long); 

	void IntException100(long); 
	void IntException101(long); 
	void IntException102(long); 
	void IntException103(long); 
	void IntException104(long); 
	void IntException105(long); 
	void IntException106(long); 
	void IntException107(long); 
	void IntException108(long); 
	void IntException109(long); 

	void IntException110(long); 
	void IntException111(long); 
	void IntException112(long); 
	void IntException113(long); 
	void IntException114(long); 
	void IntException115(long); 
	void IntException116(long); 
	void IntException117(long); 
	void IntException118(long); 

	void IntException120(long); 
	void IntException121(long); 
	void IntException122(long); 
	void IntException123(long); 
	void IntException124(long); 
	void IntException125(long); 
	void IntException126(long); 
	void IntException127(long); 
	void IntException128(long); 
	void IntException129(long); 

	void IntException130(long); 
	void IntException131(long); 
	void IntException132(long); 
	void IntException133(long); 
	void IntException134(long); 
	void IntException135(long); 
	void IntException136(long); 
	void IntException137(long); 
	void IntException138(long); 
	void IntException139(long); 

	void IntException140(long); 
	void IntException141(long); 
	void IntException142(long); 
	void IntException143(long); 
	void IntException144(long); 
	void IntException145(long); 
	void IntException146(long); 
	void IntException147(long); 
	void IntException148(long); 
	void IntException149(long); 

	void IntException150(long); 
	void IntException151(long); 
	void IntException152(long); 
	void IntException153(long); 
	void IntException154(long); 
	void IntException155(long); 
	void IntException156(long); 
	void IntException157(long); 
	void IntException158(long); 
	void IntException159(long); 

	void IntException160(long); 
	void IntException161(long); 
	void IntException162(long); 
	void IntException163(long); 
	void IntException164(long); 
	void IntException165(long); 
	void IntException166(long); 
	void IntException167(long); 
	void IntException168(long); 
	void IntException169(long); 

	void IntException170(long); 
	void IntException171(long); 
	void IntException172(long); 
	void IntException173(long); 
	void IntException174(long); 
	void IntException175(long); 
	void IntException176(long); 
	void IntException177(long); 
	void IntException178(long); 
	void IntException179(long); 

	void IntException180(long); 
	void IntException181(long); 
	void IntException182(long); 
	void IntException183(long); 
	void IntException184(long); 
	void IntException185(long); 
	void IntException186(long); 
	void IntException187(long); 
	void IntException188(long); 
	void IntException189(long); 

	void IntException190(long); 
	void IntException191(long); 
	void IntException192(long); 
	void IntException193(long); 
	void IntException194(long); 
	void IntException195(long); 
	void IntException196(long); 
	void IntException197(long); 
	void IntException198(long); 
	void IntException199(long); 

	void IntException200(long); 
	void IntException201(long); 
	void IntException202(long); 
	void IntException203(long); 
	void IntException204(long); 
	void IntException205(long); 
	void IntException206(long); 
	void IntException207(long); 
	void IntException208(long); 
	void IntException209(long); 

	void IntException210(long); 
	void IntException211(long); 
	void IntException212(long); 
	void IntException213(long); 
	void IntException214(long); 
	void IntException215(long); 
	void IntException216(long); 
	void IntException217(long); 
	void IntException218(long); 
	void IntException219(long); 

	void IntException220(long); 
	void IntException221(long); 
	void IntException222(long); 
	void IntException223(long); 
	void IntException224(long); 
	void IntException225(long); 
	void IntException226(long); 
	void IntException227(long); 
	void IntException228(long); 
	void IntException229(long); 

	void IntException230(long); 
	void IntException231(long); 
	void IntException232(long); 
	void IntException233(long); 
	void IntException234(long); 

};
#endif

