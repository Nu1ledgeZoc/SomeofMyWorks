#ifndef _PUBLIC_
#define _PUBLIC_
#include<reg52.h>
#include<intrins.h>
#include<string.h>
//此为各个子模块公用程序模块，包含基本延时，ds18b20延时，发送信息延时
typedef unsigned char u8;
typedef unsigned int  u16;
void DelayYus(unsigned int y);
void delay(void) ;  //误差 -0.000000000227us
void delay_10ms();
void delay_ms(unsigned int x);
#endif