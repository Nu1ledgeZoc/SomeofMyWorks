#ifndef _temp_H_
#define _temp_H_
#include "public.h"
extern double tempS;//��ʼ���¶�ֵ�����¶�ֵΪ���������¶�*0.0625
sbit DSPORT=P3^7;//ds18b20��������
void Delay1ms(unsigned int );
unsigned char Ds18b20Init();
void Ds18b20WriteByte(unsigned char com);
unsigned char Ds18b20ReadByte();
void  Ds18b20ChangTemp();
void  Ds18b20ReadTempCom();
void  Ds18b20ReadTemp();
#endif
