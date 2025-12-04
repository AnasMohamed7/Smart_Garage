#line 1 "C:/Users/Administrator/OneDrive/Desktop/Embedded Project/Smart_Garage/MIcro_C/MyProject.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


char keypadport at PORTB;


sbit TRIG at RC0_bit;
sbit ECHO at RC1_bit;
sbit TRIG_Direction at TRISC0_bit;
sbit ECHO_Direction at TRISC1_bit;


sbit TRIG2 at RC2_bit;
sbit ECHO2 at RC3_bit;
sbit TRIG2_Direction at TRISC2_bit;
sbit ECHO2_Direction at TRISC3_bit;


sbit SERVO at RC4_bit;
sbit SERVO_Direction at TRISC4_bit;


unsigned int getDistance1(){
 unsigned int t = 0;

 TRIG = 1;
 Delay_us(10);
 TRIG = 0;

 while(!ECHO){
 if(t++ > 30000) return 0;
 Delay_us(1);
 }

 t = 0;
 while(ECHO){
 if(t++ > 30000) break;
 Delay_us(1);
 }

 return (t * 0.0343) / 2;
}


unsigned int getDistance2(){
 unsigned int t = 0;

 TRIG2 = 1;
 Delay_us(10);
 TRIG2 = 0;

 while(!ECHO2){
 if(t++ > 30000) return 0;
 Delay_us(1);
 }

 t = 0;
 while(ECHO2){
 if(t++ > 30000) break;
 Delay_us(1);
 }

 return (t * 0.0343) / 2;
}


void Servo_SetAngle(unsigned int angle){
 unsigned int pulse = 500 + (angle * 11);
 unsigned int i;

 SERVO = 1;
 for(i=0; i < pulse; i++) Delay_us(1);
 SERVO = 0;
 for(i=0; i < (20000 - pulse); i++) Delay_us(1);
}


void Test_Servo(){
 int i;
 for(i=0;i<40;i++) Servo_SetAngle(90);
}


void Test_LCD(){
 LCD_Cmd(_LCD_CLEAR);
 LCD_Out(1,1,"LCD Working OK");
 Delay_ms(1000);
}


void Test_Keypad(){
 char key;
 LCD_Cmd(_LCD_CLEAR);
 LCD_Out(1,1,"Press a Key:");

 while(1){
 key = Keypad_Key_Click();
 if(key){
 LCD_Cmd(_LCD_CLEAR);
 LCD_Out(1,1,"You Pressed:");
 LCD_Chr(2,1, key + 48);
 Delay_ms(1000);
 break;
 }
 }
}


void Test_Ultrasonic(){
 unsigned int d1, d2;
 char text[7];

 LCD_Cmd(_LCD_CLEAR);
 LCD_Out(1,1,"Testing Sensors");

 Delay_ms(800);

 d1 = getDistance1();
 d2 = getDistance2();

 WordToStr(d1, text);
 LCD_Out(1,1,"S1:");
 LCD_Out(1,4,text);

 WordToStr(d2, text);
 LCD_Out(2,1,"S2:");
 LCD_Out(2,4,text);

 Delay_ms(1200);
}


void main(){


 TRIG_Direction = 0;
 ECHO_Direction = 1;
 TRIG2_Direction = 0;
 ECHO2_Direction = 1;
 SERVO_Direction = 0;

 LCD_Init();
 Keypad_Init();

 Test_LCD();
 Test_Keypad();
 Test_Ultrasonic();
 Test_Servo();


 LCD_Cmd(_LCD_CLEAR);
 LCD_Out(1,1,"All Parts OK ?");

 while(1);
}


void interrupt(){
}
