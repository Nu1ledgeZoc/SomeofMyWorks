#ifndef _SMG_H_
#define _SMG_H_
#include"public.h"
sbit LSA=P2^2;
sbit LSB=P2^3;
sbit LSC=P2^4;
extern u8 code smgduan[16];//0-F +0x80点亮小数点
extern u8 smgdispTEMP[];
extern u8 code DU;
extern u8 code dp;
extern unsigned int alarm;
void smgdisp(u8);
void GETtempDISP();
	
#endif