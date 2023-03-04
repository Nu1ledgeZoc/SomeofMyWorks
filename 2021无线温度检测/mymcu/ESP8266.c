#include "ESP8266.h"
#include "temp.h"
unsigned char receive[20]="\0";
unsigned char flag=0;
void sendstr(char *p)
{
	u8 i=0,a;

	while(p[i]!='\0')
	{		
			UART_SendByte(p[i]);
		 for(a=3;a>0;a--);
		i++;
	}
	delay_10ms();
}
void UART_SendByte(u8 dat)
{
	ES=0; //�رմ����ж�
	TI=0; //�巢������ж������־λ
	SBUF=dat; //����
	while(TI==0); //�ȴ��������
	TI=0; //�巢������ж������־λ
	ES=1; //�������ж�
}
//������ַ192.168.4.1
void initESP()
{
	//��ʼ������
	TMOD = 0x20;
  SCON = 0x50;
  TH1 = 0xFD;//9600bit/s
  TL1 = TH1;
  PCON = 0x00;
  EA = 0;
  ES = 0;
  TR1 = 1;
	//��ʼ��esp8266��ÿ���ͳɹ�һ��ָ�D6���л�һ��״̬
	sendstr("AT+CWMODE_DEF=2\r\n");
	delay_ms(100);
  baojing=~baojing;
  sendstr("AT+CWSAP_DEF=\"Z_ESP8266\",\"zwczwczwc\",11,3\r\n");
  delay_ms(100);
  baojing=~baojing;
	sendstr("AT+CIPAP=\"192.168.4.1\"\r\n");
  delay_ms(100);
  baojing=~baojing;
	sendstr("AT+CIPMUX=1\r\n");
  delay_ms(100);
  baojing=~baojing;
  sendstr("AT+CIPSERVER=1,8080\r\n");
	delay_ms(100);
  baojing=~baojing;
  baojing=1;
	EA=1;
	ES=1;
}
