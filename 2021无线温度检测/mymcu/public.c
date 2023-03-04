#include"public.h"
void DelayYus(unsigned int y)
{
	for(y;y>0;y--)
		_nop_();
}
void delay_10ms()
{
	  unsigned char a,b;
    for(b=221;b>0;b--)
        for(a=207;a>0;a--);
}
void delay(void)   //Îó²î -0.000000000227us
{
    unsigned char a,b,c;
    for(c=13;c>0;c--)
        for(b=247;b>0;b--)
            for(a=142;a>0;a--);
    _nop_();  //if Keil,require use intrins.h
}

void delay_ms(unsigned int x)
{
	unsigned char a,b;
	for(x;x>0;x--)
	{
		for(b=102;b>0;b--)
		 {
			 for(a=3;a>0;a--);
		 } 
	}
	
}
