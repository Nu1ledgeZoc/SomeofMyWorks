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
//设计控制模式：
//////////
//模式1：按下按钮程序开始，默认进入到温度显示功能，再按一下按钮，程序退出
//模式2：检测到按钮二按下，进入报警温度设置，按键加减 超过温度时，蜂鸣器报警，再按下，确认温度回退到模式一
//模式3：静默模式下，只收发信息，显示点表示在运行，不报警
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
 		//每次程序周期初始化几个变量：
		//1.温度的采样码
		//2.温度的显示码
		//3.选择的模式
		Ds18b20ReadTemp();
		GETtempDISP();
		smgdisp(mode);
		testmode();
		
		//接收到手机端信息，开始执行信息分析
		if(flag)
		{
			flag=0;
			if(receive[0]=='+'&&receive[1]=='I'&&receive[2]=='P'&&receive[3]=='D')
			{
				switch(receive[9])//第十位为标志
				{
        
					case 'T': //获取温度 T
					{
							EA=1;
							ES=0;
							TI=1;
						//开TI，使用printf发送温度信息
							sprintf(s,"temperature is :%.3f\r\n",tempS);
							printf("AT+CIPSEND=0,%d\r\n",strlen(s)+2);
							delay_10ms();
							printf("%s\r\n",s);
							delay_10ms();
							TI=0;
							ES=1;
						//关闭
            break;//点亮led1
          }
					case '2': //设置alarm 2=XX
					{						
						if(receive[10]=='=')
						{
							RECalarm=10*(receive[11]-'0')+receive[12]-'0';
							alarm=RECalarm;
						}
						break;//关闭led1
					}
					case '3': //3为静默模式
          {	
            mode=3;
            s2flag=0;
            break;
          }
          
					case '1': //1为显示温度模式
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
		if(mode==1) //只有在1模式下会报警
		if ((unsigned int)(tempS*1)> alarm) 
		{
			baojing=0;
			//baojing=1;
		}
		else
		{baojing=1;}

	if(P1==0x77 && s2flag==0) mode=1;//只有1按下，2未有按下，模式一
	
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
	P1=0x7f;//消除此次检测导致的状态改变，等待下一次检测
}
