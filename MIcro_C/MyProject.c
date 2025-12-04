// ===== LCD ??????? ???? ??? =====
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

// ===== Keypad PORT =====
char keypadport at PORTB;

// ===== Ultrasonic 1 =====
sbit TRIG  at RC0_bit;
sbit ECHO  at RC1_bit;
sbit TRIG_Direction  at TRISC0_bit;
sbit ECHO_Direction  at TRISC1_bit;

// ===== Ultrasonic 2 =====
sbit TRIG2 at RC2_bit;
sbit ECHO2 at RC3_bit;
sbit TRIG2_Direction at TRISC2_bit;
sbit ECHO2_Direction at TRISC3_bit;

// ===== Servo =====
sbit SERVO at RC4_bit;
sbit SERVO_Direction at TRISC4_bit;

// ===== Ultrasonic sensor 1 =====
unsigned int getDistance1(){

}

// ===== Ultrasonic sensor 2 =====
unsigned int getDistance2(){

}


void Servo_SetAngle(unsigned int angle){

}





void main(){



    LCD_Init();
    Keypad_Init();




}


void interrupt(){
}