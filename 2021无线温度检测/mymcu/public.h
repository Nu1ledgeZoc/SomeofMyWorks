#ifndef _PUBLIC_
#define _PUBLIC_
#include<reg52.h>
#include<intrins.h>
#include<string.h>
//��Ϊ������ģ�鹫�ó���ģ�飬����������ʱ��ds18b20��ʱ��������Ϣ��ʱ
typedef unsigned char u8;
typedef unsigned int  u16;
void DelayYus(unsigned int y);
void delay(void) ;  //��� -0.000000000227us
void delay_10ms();
void delay_ms(unsigned int x);
#endif