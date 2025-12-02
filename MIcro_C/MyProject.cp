#line 1 "D:/programming/Embedded/Smart_Garage/MIcro_C/MyProject.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


char keypadport at PORTB;


void Test_LCD() {
 LCD_CMD(_LCD_CURSOR_OFF);
 LCD_OUT(1, 1, "Test 1 sec");
 Delay_MS(1000);
}


void Test_Keypad() {
 char key = 0;

 LCD_Cmd(_LCD_CLEAR);

 while(1) {

 key = keypad_key_click();

 if(key != 0){

 switch(key){
 case 1: key = '1'; break;
 case 2: key = '2'; break;
 case 3: key = '3'; break;
 case 5: key = '4'; break;
 case 6: key = '5'; break;
 case 7: key = '6'; break;
 case 9: key = '7'; break;
 case 10: key = '8'; break;
 case 11: key = '9'; break;
 case 13: key = '*'; break;
 case 14: key = '0'; break;
 case 15: key = '#'; break;
 }

 if(key == '*' || key == '#')
 LCD_CMD(_LCD_CLEAR);
 else
 LCD_CHR_CP(key);
 }
 }
}

void main() {

 LCD_INIT();
 KEYPAD_INIT();

 Test_LCD();
 Test_Keypad();
}

void interrupt(){





}
