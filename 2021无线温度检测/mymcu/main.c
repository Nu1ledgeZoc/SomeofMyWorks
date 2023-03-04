#include "smg.h"
#include "temp.h"
#include "ESP8266.h"
u8 mode=1;
u8 s2flag=0;
sbit s1=P1^3;
sbit s2=P1^2;
sbit s3=P1^1;
sbit s4=P1^0;
sbit led1=P2^6;
sbit beep=P1^5;
void testmode();
//��ƿ���ģʽ��
//////////
//ģʽ1�����°�ť����ʼ��Ĭ�Ͻ��뵽�¶���ʾ���ܣ��ٰ�һ�°�ť�������˳�
//ģʽ2����⵽��ť�����£����뱨���¶����ã������Ӽ� �����¶�ʱ���������������ٰ��£�ȷ���¶Ȼ��˵�ģʽһ
//ģʽ3����Ĭģʽ�£�ֻ�շ���Ϣ����ʾ���ʾ�����У�������
void main()
{
	u8 RECalarm=0;
	char s[30]="\0";
	u8 len=0;
	P1=0x7f;
	initESP();
	ES=1;
	while(1)
	{	
 		//ÿ�γ������ڳ�ʼ������������
		//1.�¶ȵĲ�����
		//2.�¶ȵ���ʾ��
		//3.ѡ���ģʽ
		Ds18b20ReadTemp();
		GETtempDISP();
		smgdisp(mode);
		testmode();
		
		//���յ��ֻ�����Ϣ����ʼִ����Ϣ����
		if(flag)
		{
			flag=0;
			if(receive[0]=='+'&&receive[1]=='I'&&receive[2]=='P'&&receive[3]=='D')
			{
				switch(receive[9])//��ʮλΪ��־
				{
        
					case 'T': //��ȡ�¶� T
					{
							EA=1;
							ES=0;
							TI=1;
						//��TI��ʹ��printf�����¶���Ϣ
							sprintf(s,"temperature is :%.3f\r\n",tempS);
							printf("AT+CIPSEND=0,%d\r\n",strlen(s)+2);
							delay_10ms();
							printf("%s\r\n",s);
							delay_10ms();
							TI=0;
							ES=1;
						//�ر�
            break;//����led1
          }
					case '2': //����alarm 2=XX
					{						
						if(receive[10]=='=')
						{
							RECalarm=10*(receive[11]-'0')+receive[12]-'0';
							alarm=RECalarm;
						}
						break;//�ر�led1
					}
					case '3': //3Ϊ��Ĭģʽ
          {	
            mode=3;
            s2flag=0;
            break;
          }
          
					case '1': //1Ϊ��ʾ�¶�ģʽ
          {
						mode=1;
						s2flag=0;
						break;//
          }
        } 
			}
		}
	}
}
void Usart() interrupt 4
{
	static u16 i=0;
	if(RI)
  { 
    RI=0;
		
    receive[i]=SBUF;    
    i++;
    if(receive[i-1]=='\n')
    {
      flag=1;
      receive[i]='\0';
      i=0;
    }  
  }
}
void testmode() 
{
		if(mode==1) //ֻ����1ģʽ�»ᱨ��
		if ((unsigned int)(tempS*1)> alarm) 
		{
			baojing=0;
			//baojing=1;
		}
		else
		{baojing=1;}

	if(P1==0x77 && s2flag==0) mode=1;//ֻ��1���£�2δ�а��£�ģʽһ
	
	if(P1==0x7B) 
	{
			while(P1==0x7B)
			{P1=0x7F;}

		s2flag++;
		if(s2flag == 2)
		{
			mode=1;
			s2flag=0;
		}
		else
		{mode=2;}
	}	
	if(mode==2)
	{
		switch(P1)
		{
			case 0x7D: 
				alarm++;
			while(P1==0x7D)
			{P1=0x7F;}
			break;
			case 0x7E: 
				if(alarm > 0) alarm--;
			while(P1==0x7E)
			{P1=0x7F;}
			break;
		}
		
	}
	
	if(P1==0x7D && s2flag==0)
	{
		mode=3;
	}
	P1=0x7f;//�����˴μ�⵼�µ�״̬�ı䣬�ȴ���һ�μ��
}
