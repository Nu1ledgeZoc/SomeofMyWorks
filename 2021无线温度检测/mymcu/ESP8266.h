#ifndef _ESP8266_H_
#define _ESP8266_H_
#include "public.h"
#include "stdio.h"
extern unsigned char receive[20];
extern unsigned char flag;
sbit baojing=P2^7;
void sendstr(const char *p);
void initESP();
void UART_SendByte(u8 dat);
#endif