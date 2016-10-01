//******************************************************
// This is a intexception.cpp file
//  All interrupts are run as an ISR not as tasks 
//******************************************************
#include"intexception.h"
#include"aoatask.h"
#include"../ethernet/EtherObj.h"
//****************************************************************************************
IntException::IntException()
 {
 };

//****************************************************************************************
// This initialization will initialize all function addresses to ISR 
//   and set up IDT entries so that when an interrrupt comes, appropriate 
//   ISR will be invoked 
//****************************************************************************************
void IntException::IntExceptionInit()
 {
  	int i; 
	pmfd1 Function_Ptr_X1 = 0;          //pmfd type  
	int INTSELBASE = 42;               //hardcoded value GDT entry for int exceptions 
	//when ever GDT entries are modified, this may change, watch it!
	//
	
	Function_Address_Array1 = &l100; 
	Function_Address_Array1 = (long*)(INT_PTRS - ADDR_OFFSET); //store it in memory 

	//Each class requires a different pointer to computer their Function addresses 
	//pmfd1 and Funcion_Ptr_X1 are used for IntException class 
	Function_Ptr_X1 = &IntException::IntException000;         //initialize the ptr with a function 
	Function_Address_Array1[0] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException001;         //initialize the ptr with a function 
	Function_Address_Array1[1] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException002;         //initialize the ptr with a function 
	Function_Address_Array1[2] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException003;         //initialize the ptr with a function 
	Function_Address_Array1[3] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException004;         //initialize the ptr with a function 
	Function_Address_Array1[4] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException005;         //initialize the ptr with a function 
	Function_Address_Array1[5] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException006;         //initialize the ptr with a function 
	Function_Address_Array1[6] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException007;         //initialize the ptr with a function 
	Function_Address_Array1[7] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException010;         //initialize the ptr with a function 
	Function_Address_Array1[10] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException011;         //initialize the ptr with a function 
	Function_Address_Array1[11] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException012;         //initialize the ptr with a function 
	Function_Address_Array1[12] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException013;         //initialize the ptr with a function 
	Function_Address_Array1[13] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException016;         //initialize the ptr with a function 
	Function_Address_Array1[16] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException017;         //initialize the ptr with a function 
	Function_Address_Array1[17] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException018;         //initialize the ptr with a function 
	Function_Address_Array1[18] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException019;         //initialize the ptr with a function 
	Function_Address_Array1[19] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException020;         //initialize the ptr with a function 
	Function_Address_Array1[20] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException021;         //initialize the ptr with a function 
	Function_Address_Array1[21] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException022;         //initialize the ptr with a function 
	Function_Address_Array1[22] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException023;         //initialize the ptr with a function 
	Function_Address_Array1[23] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException024;         //initialize the ptr with a function 
	Function_Address_Array1[24] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException025;         //initialize the ptr with a function 
	Function_Address_Array1[25] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException026;         //initialize the ptr with a function 
	Function_Address_Array1[26] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException027;         //initialize the ptr with a function 
	Function_Address_Array1[27] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException028;         //initialize the ptr with a function 
	Function_Address_Array1[28] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException029;         //initialize the ptr with a function 
	Function_Address_Array1[29] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException030;         //initialize the ptr with a function 
	Function_Address_Array1[30] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException031;         //initialize the ptr with a function 
	Function_Address_Array1[31] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException032;         //initialize the ptr with a function 
	Function_Address_Array1[32] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException033;         //initialize the ptr with a function 
	Function_Address_Array1[33] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException034;         //initialize the ptr with a function 
	Function_Address_Array1[34] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException035;         //initialize the ptr with a function 
	Function_Address_Array1[35] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException036;         //initialize the ptr with a function 
	Function_Address_Array1[36] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException037;         //initialize the ptr with a function 
	Function_Address_Array1[37] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException038;         //initialize the ptr with a function 
	Function_Address_Array1[38] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException039;         //initialize the ptr with a function 
	Function_Address_Array1[39] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException040;         //initialize the ptr with a function 
	Function_Address_Array1[40] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException041;         //initialize the ptr with a function 
	Function_Address_Array1[41] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException042;         //initialize the ptr with a function 
	Function_Address_Array1[42] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException043;         //initialize the ptr with a function 
	Function_Address_Array1[43] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException044;         //initialize the ptr with a function 
	Function_Address_Array1[44] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException045;         //initialize the ptr with a function 
	Function_Address_Array1[45] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException046;         //initialize the ptr with a function 
	Function_Address_Array1[46] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException047;         //initialize the ptr with a function 
	Function_Address_Array1[47] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException048;         //initialize the ptr with a function 
	Function_Address_Array1[48] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException049;         //initialize the ptr with a function 
	Function_Address_Array1[49] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException050;         //initialize the ptr with a function 
	Function_Address_Array1[50] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException051;         //initialize the ptr with a function 
	Function_Address_Array1[51] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException052;         //initialize the ptr with a function 
	Function_Address_Array1[52] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException053;         //initialize the ptr with a function 
	Function_Address_Array1[53] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException054;         //initialize the ptr with a function 
	Function_Address_Array1[54] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException055;         //initialize the ptr with a function 
	Function_Address_Array1[55] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException056;         //initialize the ptr with a function 
	Function_Address_Array1[56] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException057;         //initialize the ptr with a function 
	Function_Address_Array1[57] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException058;         //initialize the ptr with a function 
	Function_Address_Array1[58] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException059;         //initialize the ptr with a function 
	Function_Address_Array1[59] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException060;         //initialize the ptr with a function 
	Function_Address_Array1[60] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException061;         //initialize the ptr with a function 
	Function_Address_Array1[61] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException062;         //initialize the ptr with a function 
	Function_Address_Array1[62] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException063;         //initialize the ptr with a function 
	Function_Address_Array1[63] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException064;         //initialize the ptr with a function 
	Function_Address_Array1[64] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException065;         //initialize the ptr with a function 
	Function_Address_Array1[65] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException066;         //initialize the ptr with a function 
	Function_Address_Array1[66] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException067;         //initialize the ptr with a function 
	Function_Address_Array1[67] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException068;         //initialize the ptr with a function 
	Function_Address_Array1[68] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException069;         //initialize the ptr with a function 
	Function_Address_Array1[69] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException070;         //initialize the ptr with a function 
	Function_Address_Array1[70] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException071;         //initialize the ptr with a function 
	Function_Address_Array1[71] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException072;         //initialize the ptr with a function 
	Function_Address_Array1[72] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException073;         //initialize the ptr with a function 
	Function_Address_Array1[73] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException074;         //initialize the ptr with a function 
	Function_Address_Array1[74] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException075;         //initialize the ptr with a function 
	Function_Address_Array1[75] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException076;         //initialize the ptr with a function 
	Function_Address_Array1[76] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException077;         //initialize the ptr with a function 
	Function_Address_Array1[77] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException078;         //initialize the ptr with a function 
	Function_Address_Array1[78] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException079;         //initialize the ptr with a function 
	Function_Address_Array1[79] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException080;         //initialize the ptr with a function 
	Function_Address_Array1[80] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException081;         //initialize the ptr with a function 
	Function_Address_Array1[81] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException082;         //initialize the ptr with a function 
	Function_Address_Array1[82] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException083;         //initialize the ptr with a function 
	Function_Address_Array1[83] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException084;         //initialize the ptr with a function 
	Function_Address_Array1[84] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException085;         //initialize the ptr with a function 
	Function_Address_Array1[85] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException086;         //initialize the ptr with a function 
	Function_Address_Array1[86] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException087;         //initialize the ptr with a function 
	Function_Address_Array1[87] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException088;         //initialize the ptr with a function 
	Function_Address_Array1[88] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException089;         //initialize the ptr with a function 
	Function_Address_Array1[89] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException090;         //initialize the ptr with a function 
	Function_Address_Array1[90] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException091;         //initialize the ptr with a function 
	Function_Address_Array1[91] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException092;         //initialize the ptr with a function 
	Function_Address_Array1[92] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException093;         //initialize the ptr with a function 
	Function_Address_Array1[93] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException094;         //initialize the ptr with a function 
	Function_Address_Array1[94] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException095;         //initialize the ptr with a function 
	Function_Address_Array1[95] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException096;         //initialize the ptr with a function 
	Function_Address_Array1[96] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException097;         //initialize the ptr with a function 
	Function_Address_Array1[97] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException098;         //initialize the ptr with a function 
	Function_Address_Array1[98] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException099;         //initialize the ptr with a function 
	Function_Address_Array1[99] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException100;         //initialize the ptr with a function 
	Function_Address_Array1[100] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException101;         //initialize the ptr with a function 
	Function_Address_Array1[101] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException102;         //initialize the ptr with a function 
	Function_Address_Array1[102] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException103;         //initialize the ptr with a function 
	Function_Address_Array1[103] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException104;         //initialize the ptr with a function 
	Function_Address_Array1[104] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException105;         //initialize the ptr with a function 
	Function_Address_Array1[105] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException106;         //initialize the ptr with a function 
	Function_Address_Array1[106] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException107;         //initialize the ptr with a function 
	Function_Address_Array1[107] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException108;         //initialize the ptr with a function 
	Function_Address_Array1[108] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException109;         //initialize the ptr with a function 
	Function_Address_Array1[109] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException110;         //initialize the ptr with a function 
	Function_Address_Array1[110] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException111;         //initialize the ptr with a function 
	Function_Address_Array1[111] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException112;         //initialize the ptr with a function 
	Function_Address_Array1[112] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException113;         //initialize the ptr with a function 
	Function_Address_Array1[113] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException114;         //initialize the ptr with a function 
	Function_Address_Array1[114] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException115;         //initialize the ptr with a function 
	Function_Address_Array1[115] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException116;         //initialize the ptr with a function 
	Function_Address_Array1[116] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException117;         //initialize the ptr with a function 
	Function_Address_Array1[117] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException118;         //initialize the ptr with a function 
	Function_Address_Array1[118] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException120;         //initialize the ptr with a function 
	Function_Address_Array1[120] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException121;         //initialize the ptr with a function 
	Function_Address_Array1[121] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException122;         //initialize the ptr with a function 
	Function_Address_Array1[122] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException123;         //initialize the ptr with a function 
	Function_Address_Array1[123] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException124;         //initialize the ptr with a function 
	Function_Address_Array1[124] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException125;         //initialize the ptr with a function 
	Function_Address_Array1[125] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException126;         //initialize the ptr with a function 
	Function_Address_Array1[126] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException127;         //initialize the ptr with a function 
	Function_Address_Array1[127] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException128;         //initialize the ptr with a function 
	Function_Address_Array1[128] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException129;         //initialize the ptr with a function 
	Function_Address_Array1[129] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException130;         //initialize the ptr with a function 
	Function_Address_Array1[130] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException131;         //initialize the ptr with a function 
	Function_Address_Array1[131] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException132;         //initialize the ptr with a function 
	Function_Address_Array1[132] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException133;         //initialize the ptr with a function 
	Function_Address_Array1[133] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException134;         //initialize the ptr with a function 
	Function_Address_Array1[134] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException135;         //initialize the ptr with a function 
	Function_Address_Array1[135] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException136;         //initialize the ptr with a function 
	Function_Address_Array1[136] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException137;         //initialize the ptr with a function 
	Function_Address_Array1[137] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException138;         //initialize the ptr with a function 
	Function_Address_Array1[138] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException139;         //initialize the ptr with a function 
	Function_Address_Array1[139] = (long)getFunctionPtr(Function_Ptr_X1); 	

	Function_Ptr_X1 = &IntException::IntException140;         //initialize the ptr with a function 
	Function_Address_Array1[140] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException141;         //initialize the ptr with a function 
	Function_Address_Array1[141] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException142;         //initialize the ptr with a function 
	Function_Address_Array1[142] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException143;         //initialize the ptr with a function 
	Function_Address_Array1[143] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException144;         //initialize the ptr with a function 
	Function_Address_Array1[144] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException145;         //initialize the ptr with a function 
	Function_Address_Array1[145] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException146;         //initialize the ptr with a function 
	Function_Address_Array1[146] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException147;         //initialize the ptr with a function 
	Function_Address_Array1[147] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException148;         //initialize the ptr with a function 
	Function_Address_Array1[148] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException149;         //initialize the ptr with a function 
	Function_Address_Array1[149] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException150;         //initialize the ptr with a function 
	Function_Address_Array1[150] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException151;         //initialize the ptr with a function 
	Function_Address_Array1[151] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException152;         //initialize the ptr with a function 
	Function_Address_Array1[152] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException153;         //initialize the ptr with a function 
	Function_Address_Array1[153] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException154;         //initialize the ptr with a function 
	Function_Address_Array1[154] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException155;         //initialize the ptr with a function 
	Function_Address_Array1[155] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException156;         //initialize the ptr with a function 
	Function_Address_Array1[156] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException157;         //initialize the ptr with a function 
	Function_Address_Array1[157] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException158;         //initialize the ptr with a function 
	Function_Address_Array1[158] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException159;         //initialize the ptr with a function 
	Function_Address_Array1[159] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException160;         //initialize the ptr with a function 
	Function_Address_Array1[160] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException161;         //initialize the ptr with a function 
	Function_Address_Array1[161] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException162;         //initialize the ptr with a function 
	Function_Address_Array1[162] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException163;         //initialize the ptr with a function 
	Function_Address_Array1[163] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException164;         //initialize the ptr with a function 
	Function_Address_Array1[164] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException165;         //initialize the ptr with a function 
	Function_Address_Array1[165] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException166;         //initialize the ptr with a function 
	Function_Address_Array1[166] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException167;         //initialize the ptr with a function 
	Function_Address_Array1[167] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException168;         //initialize the ptr with a function 
	Function_Address_Array1[168] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException169;         //initialize the ptr with a function 
	Function_Address_Array1[169] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException170;         //initialize the ptr with a function 
	Function_Address_Array1[170] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException171;         //initialize the ptr with a function 
	Function_Address_Array1[171] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException172;         //initialize the ptr with a function 
	Function_Address_Array1[172] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException173;         //initialize the ptr with a function 
	Function_Address_Array1[173] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException174;         //initialize the ptr with a function 
	Function_Address_Array1[174] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException175;         //initialize the ptr with a function 
	Function_Address_Array1[175] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException176;         //initialize the ptr with a function 
	Function_Address_Array1[176] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException177;         //initialize the ptr with a function 
	Function_Address_Array1[177] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException178;         //initialize the ptr with a function 
	Function_Address_Array1[178] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException179;         //initialize the ptr with a function 
	Function_Address_Array1[179] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException180;         //initialize the ptr with a function 
	Function_Address_Array1[180] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException181;         //initialize the ptr with a function 
	Function_Address_Array1[181] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException182;         //initialize the ptr with a function 
	Function_Address_Array1[182] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException183;         //initialize the ptr with a function 
	Function_Address_Array1[183] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException184;         //initialize the ptr with a function 
	Function_Address_Array1[184] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException185;         //initialize the ptr with a function 
	Function_Address_Array1[185] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException186;         //initialize the ptr with a function 
	Function_Address_Array1[186] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException187;         //initialize the ptr with a function 
	Function_Address_Array1[187] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException188;         //initialize the ptr with a function 
	Function_Address_Array1[188] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException189;         //initialize the ptr with a function 
	Function_Address_Array1[189] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException190;         //initialize the ptr with a function 
	Function_Address_Array1[190] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException191;         //initialize the ptr with a function 
	Function_Address_Array1[191] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException192;         //initialize the ptr with a function 
	Function_Address_Array1[192] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException193;         //initialize the ptr with a function 
	Function_Address_Array1[193] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException194;         //initialize the ptr with a function 
	Function_Address_Array1[194] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException195;         //initialize the ptr with a function 
	Function_Address_Array1[195] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException196;         //initialize the ptr with a function 
	Function_Address_Array1[196] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException197;         //initialize the ptr with a function 
	Function_Address_Array1[197] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException198;         //initialize the ptr with a function 
	Function_Address_Array1[198] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException199;         //initialize the ptr with a function 
	Function_Address_Array1[199] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException200;         //initialize the ptr with a function 
	Function_Address_Array1[200] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException201;         //initialize the ptr with a function 
	Function_Address_Array1[201] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException202;         //initialize the ptr with a function 
	Function_Address_Array1[202] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException203;         //initialize the ptr with a function 
	Function_Address_Array1[203] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException204;         //initialize the ptr with a function 
	Function_Address_Array1[204] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException205;         //initialize the ptr with a function 
	Function_Address_Array1[205] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException206;         //initialize the ptr with a function 
	Function_Address_Array1[206] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException207;         //initialize the ptr with a function 
	Function_Address_Array1[207] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException208;         //initialize the ptr with a function 
	Function_Address_Array1[208] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException209;         //initialize the ptr with a function 
	Function_Address_Array1[209] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException210;         //initialize the ptr with a function 
	Function_Address_Array1[210] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException211;         //initialize the ptr with a function 
	Function_Address_Array1[211] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException212;         //initialize the ptr with a function 
	Function_Address_Array1[212] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException213;         //initialize the ptr with a function 
	Function_Address_Array1[213] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException214;         //initialize the ptr with a function 
	Function_Address_Array1[214] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException215;         //initialize the ptr with a function 
	Function_Address_Array1[215] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException216;         //initialize the ptr with a function 
	Function_Address_Array1[216] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException217;         //initialize the ptr with a function 
	Function_Address_Array1[217] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException218;         //initialize the ptr with a function 
	Function_Address_Array1[218] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException219;         //initialize the ptr with a function 
	Function_Address_Array1[219] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException220;         //initialize the ptr with a function 
	Function_Address_Array1[220] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException221;         //initialize the ptr with a function 
	Function_Address_Array1[221] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException222;         //initialize the ptr with a function 
	Function_Address_Array1[222] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException223;         //initialize the ptr with a function 
	Function_Address_Array1[223] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException224;         //initialize the ptr with a function 
	Function_Address_Array1[224] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException225;         //initialize the ptr with a function 
	Function_Address_Array1[225] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException226;         //initialize the ptr with a function 
	Function_Address_Array1[226] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException227;         //initialize the ptr with a function 
	Function_Address_Array1[227] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException228;         //initialize the ptr with a function 
	Function_Address_Array1[228] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException229;         //initialize the ptr with a function 
	Function_Address_Array1[229] = (long)getFunctionPtr(Function_Ptr_X1); 	
	
	Function_Ptr_X1 = &IntException::IntException230;         //initialize the ptr with a function 
	Function_Address_Array1[230] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException231;         //initialize the ptr with a function 
	Function_Address_Array1[231] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException232;         //initialize the ptr with a function 
	Function_Address_Array1[232] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException233;         //initialize the ptr with a function 
	Function_Address_Array1[233] = (long)getFunctionPtr(Function_Ptr_X1); 	
	Function_Ptr_X1 = &IntException::IntException234;         //initialize the ptr with a function 
	Function_Address_Array1[234] = (long)getFunctionPtr(Function_Ptr_X1); 	

	//---------------------------------------------------------------------------
	// Initialize the Interrupt Service Routines for interrupt exceptions 

	for (i = 0; i <= 7; i++)  //eight entries 
	 {
	io.AOAsetISR(INTSELBASE, i,(unsigned long)Function_Address_Array1[i]);
	 }
	for (i = 10; i <= 12; i++)  //four entries  
	 {
	  io.AOAsetISR(INTSELBASE, i,(unsigned long)Function_Address_Array1[i]);
	 }
	// exception 13 is implemented in PRCYCLE 
	for (i = 16; i <= 114; i++) //102 entries  
	 {
	  io.AOAsetISR(INTSELBASE, i,(unsigned long)Function_Address_Array1[i]);
	 }
	for (i = 116; i <= 119; i++) //102 entries  
	 {
	  io.AOAsetISR(INTSELBASE, i,(unsigned long)Function_Address_Array1[i]);
	 }
	for (i = 120; i <= 234; i++) //115 entries  
	 {
	  io.AOAsetISR(INTSELBASE, i,(unsigned long)Function_Address_Array1[i]);
	 }
	//---------------------------------------------------------------------------
 }
//-------------------------------------------------
// Local Function to Compute Address
//-------------------------------------------------
long* IntException::getFunctionPtr(pmfd1 abc2)
{
//this approach uses xyz as a stack pointer to locate where the 
//  address of the function is stored 
AOAProtected io;
long v2;
long *ab1;
long *xyz;
pmfd1 abc1;                            //instance of a member ptr 
IntException first;                        //instance of a class 
xyz = (long *)&first;
abc1 = abc2;                  //initialize the ptr with a function 
xyz--;
ab1= (long*)*xyz;
return (long *)ab1;
};
//**************************************************************************************
void IntException::IntException000(long value)
{
	   _asm {
		cli
	        }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!

	   io.AOAPrintText ("Divide by Zero Exception: 000", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException001(long value)
{
   AOATask task; 
   int i; 

	   _asm {
		cli
	        }
           io.AOAcliTimer();   //turn off timer so that no task can be run 

	   io.AOAPrintText ("Debug Exception:              001", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 

	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException002(long value)
{
	   _asm {
		cli
	        }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("NMI Interrupt: 002", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};

//-----------------------------------------------
void IntException::IntException003(long value)
{
	   _asm {
		cli
	        }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Breakpoint Exception: 003", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException004(long value)
{
	   _asm {
		cli
	        }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Overflow Exception: 004", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException005(long value)
{

	   _asm {
		cli
	        }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Bound Range Exceeded Exception: 005", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException006(long value)
{
  int k; 
  long data1; 
	   _asm {
		cli
	        }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Invalid Opcode Exception: 006", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   	   //for (k = 0; k < 72; k++) //24 entries of stack are printed  
				   
		      //{
		      //currently it is using the App1Stack_SEL, App1Code_SEL and so on 
		      // we need to change this to a stack where the a task generated error 
		      //data1 = io.AOAgetStackPOP(k*4); 
		      //io.AOAprintHex (data1, Line10 + k*20); 
		      //}

	   _asm {sti}
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException007(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Divide not available exception: 007", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException010(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Invalid TSS Exception: 010", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   //a = io.AOAgetCharacter(); 
	   //io.AOAISRExit();  //special exit for ISR does not work properly
};
//-----------------------------------------------
void IntException::IntException011(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Segment Not Present Exception: 011", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException012(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Stack Fault Exception: 012", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException013(long value)
{
 //we get this error due to: 
 // if task switch occurs during the execution of iretd 
 //  we do not have any solution to stop task switching during this 
 //  small window 
 // The stack has error code and the instruction address and selector 
 //  of the instruction which caused this exception. Thus, when it is 
 //  returned, the stack should be adjusted to its original value before 
 //  the exception, or the task should be restarted...
	   _asm{ cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("General Protection Exception: 013", Line23); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException016(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Floating point Error Exception: 016", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException017(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Alignment Check Exception: 017", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException018(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Machine Check Exception: 018", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException019(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("SIMD Floating Point Exception: 019", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException020(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 020", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException021(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 021", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException022(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 022", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException023(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 023", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException024(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 024", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException025(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 025", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException026(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 026", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException027(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 027", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException028(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 028", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException029(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 029", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException030(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 030", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException031(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 031", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException032(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 032", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException033(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 033", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException034(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 034", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException035(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 035", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException036(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 036", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException037(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 037", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException038(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 038", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException039(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 039", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException040(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 040", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException041(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 041", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException042(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 042", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException043(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 043", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException044(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 044", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException045(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 045", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException046(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 046", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException047(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 047", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException048(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 048", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException049(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 049", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException050(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 050", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException051(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 051", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException052(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 052", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException053(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 053", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException054(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 054", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException055(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 055", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException056(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 056", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException057(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 057", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException058(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 058", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException059(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 059", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException060(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 060", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException061(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 061", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException062(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 062", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException063(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 063", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException064(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 064", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException065(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 065", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException066(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 066", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException067(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 067", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException068(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 068", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException069(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 069", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException070(long value)
{
	   _asm { cli }
           io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 070", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException071(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 071", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException072(long value)
//-----------------------------------------------
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 072", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException073(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 073", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException074(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 074", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException075(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 075", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException076(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 076", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException077(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 077", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException078(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 078", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException079(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 079", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException080(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 080", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException081(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 081", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException082(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 082", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException083(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 083", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException084(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 084", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException085(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 085", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException086(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 086", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException087(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 087", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException088(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 088", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException089(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 089", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException090(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 090", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException091(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 091", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException092(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 092", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException093(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 093", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException094(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 0r4", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException095(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 095", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException096(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 096", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException097(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 097", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException098(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 098", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException099(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 099", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException100(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 100", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException101(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 101", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException102(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 102", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException103(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 103", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException104(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 104", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException105(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 105", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException106(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 106", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException107(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 107", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException108(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 108", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException109(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 109", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException110(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 110", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException111(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 111", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException112(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("Real Time Clock Interrupt: 112", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   io.AOAPrintText (" OKKKK : 112", Line6,1+80); 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException113(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 113", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException114(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 114", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException115(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 115", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
//	   EtherObj EO;
//	   int retcode;
//  	   retcode = EO.getTransmitStatus();
//	   io.AOAprintHex(retcode, 3200);
//	   retcode = EO.getTransmitFree();
//	   io.AOAprintHex(retcode, 3220);
//   	   retcode = EO.getIntStatus();
//	   io.AOAprintHex(retcode, 3240);
//	   retcode = EO.getFifoDiag();
//	   io.AOAprintHex(retcode, 3260);
	
//	EO.ackNICInt(0x10);  //acknowledge the interrupt IR
//	EO.ackNICInt(0x01);  //acknowledge the interrupt RC
//	io.AOAackPICCntlr(2); //reset the interrupt chip IRQ15 on second chip 
	
//	retcode =EO.ackNICInt(4);
//	io.AOAprintHex(retcode, 3280);
	
//	a = io.AOAgetCharacter(); 
	  
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException116(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 116", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException117(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 117", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException118(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 118", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException120(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 120", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException121(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 121", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException122(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 122", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException123(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 123", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException124(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 124", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException125(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 125", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException126(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 126", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException127(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 127", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException128(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 128", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException129(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 129", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException130(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 130", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException131(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 131", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException132(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 132", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException133(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 133", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException134(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 134", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException135(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 135", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException136(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 136", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException137(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 137", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException138(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 138", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException139(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 139", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException140(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 140", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException141(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 141", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException142(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 142", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException143(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 143", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException144(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 144", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException145(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 145", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException146(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 146", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException147(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 147", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException148(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 148", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException149(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 149", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException150(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 150", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException151(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 151", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException152(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 152", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException153(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 153", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException154(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 154", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException155(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 155", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException156(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 156", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException157(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 157", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException158(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 158", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException159(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 159", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException160(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 160", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException161(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 161", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException162(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 162", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException163(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 163", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException164(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 164", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException165(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 165", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException166(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 166", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException167(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 167", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException168(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 168", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException169(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 169", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException170(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 170", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException171(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 171", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException172(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 172", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException173(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 173", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException174(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 174", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException175(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 175", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException176(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 176", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException177(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 177", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException178(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 178", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException179(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 179", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException180(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 180", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException181(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 181", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException182(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 182", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException183(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 183", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException184(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 184", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException185(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 185", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException186(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 186", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException187(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 187", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException188(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 188", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException189(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 189", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException190(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 190", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException191(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 191", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException192(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 192", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException193(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 193", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException194(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 194", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException195(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 195", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException196(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 196", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException197(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 197", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException198(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 198", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException199(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 199", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException200(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 200", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException201(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 201", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException202(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 202", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException203(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 203", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException204(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 204", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException205(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 205", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException206(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 206", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException207(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 207", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException208(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 208", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException209(long value)
{
	    _asm { cli }
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 209", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException210(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 210", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException211(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 211", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException212(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 212", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException213(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 213", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException214(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 214", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException215(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 215", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException216(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 216", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException217(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 217", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException218(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 218", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException219(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 219", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException220(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 220", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException221(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 221", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException222(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 222", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException223(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 223", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException224(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 224", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException225(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 225", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException226(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 226", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException227(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 227", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException228(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 228", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException229(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 229", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException230(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 230", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException231(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 231", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException232(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 232", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException233(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 233", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
void IntException::IntException234(long value)
{
	    _asm { cli } 
	   io.AOAcliTimer();  //if this timer is not there, the system will reboot!!!
	   io.AOAPrintText ("This is in InterruptException ISR: 234", Line6,1); 
	   io.AOAsetSharedMem (0x18, 1);  //set the error flag 
	   _asm {int 08h}                  //call the timer, from there error rtn 
	   a = io.AOAgetCharacter(); 
	   io.AOAISRExit();  //special exit for ISR 
};
//-----------------------------------------------
