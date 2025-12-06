#define _XTAL_FREQ 8000000 // 8MHz crystal frequency
// LCD control and data pins
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

// LCD direction pins
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

// ===== Keypad Definitions =====
char keypadport at PORTB;

// ===== Ultrasonic Sensor 1 =====
sbit TRIG  at RC0_bit;
sbit ECHO  at RC1_bit;
sbit TRIG_Direction  at TRISC0_bit;
sbit ECHO_Direction  at TRISC1_bit;

// ===== Ultrasonic Sensor 2 =====
sbit TRIG2 at RC2_bit;
sbit ECHO2 at RC3_bit;
sbit TRIG2_Direction at TRISC2_bit;
sbit ECHO2_Direction at TRISC3_bit;

// ===== Servo Definitions =====
sbit SERVO at RC4_bit;
sbit SERVO_Direction at TRISC4_bit;

// ===== LED Definitions =====
sbit LED_RED   at RA1_bit;
sbit LED_GREEN at RA0_bit;
sbit LED_RED_Direction   at TRISA1_bit;
sbit LED_GREEN_Direction at TRISA0_bit;

// ===== Function to read Ultrasonic sensor =====
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

// ===== Update Garage LEDs based on servo angle =====
void UpdateGarageLEDs(unsigned int angle){
    if(angle == 0){
        LED_RED = 1;
        LED_GREEN = 0;
    }
    else if(angle == 90){
        LED_RED = 0;
        LED_GREEN = 1;
    }
}

// ===== Servo PWM Function =====
// Sends pulse to servo to move to desired angle
void Servo_SetAngle(unsigned int angle){
    unsigned int pulse = 500 + (angle * 11);
    unsigned int i;

    SERVO = 1;
    for(i=0; i < pulse; i++) Delay_us(1);
    SERVO = 0;
    for(i=0; i < (20000 - pulse); i++) Delay_us(1);

    UpdateGarageLEDs(angle);
}

// ===== Test servo to open garage =====
void Turn_On_Servo(){
    int i;
    for(i=0;i<40;i++) Servo_SetAngle(90);
}

// ===== LCD Test Function =====
void Turn_On_LCD(){
    LCD_Cmd(_LCD_CLEAR);
    LCD_Out(1,1,"LCD Working OK");
    Delay_ms(1000);
}

// ===== Keypad Test Function =====
void Turn_On_Keypad(){
    char key;
    LCD_Cmd(_LCD_CLEAR);
    LCD_Out(1,1,"Press a Key:");

    while(1){
        key = Keypad_Key_Click();
        if(key){
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"You Pressed:");
            LCD_Chr(2,1, key + 48); // Display key value
            Delay_ms(1000);
            break;
        }
    }
}

// ===== Ultrasonic Test Function =====
void Turn_On_Ultrasonic(){
    unsigned int d1, d2;
    char text[7];

    LCD_Cmd(_LCD_CLEAR);
    LCD_Out(1,1,"Testing Sensors");

    Delay_ms(800);

    d1 = getDistance1();     // Read sensor 1
    d2 = getDistance2();   // Read sensor 2

    WordToStr(d1, text);
    LCD_Out(1,1,"S1:");
    LCD_Out(1,4,text);

    WordToStr(d2, text);
    LCD_Out(2,1,"S2:");
    LCD_Out(2,4,text);

    Delay_ms(1200);
}

// ===== Keypad Map Function =====
char Get_Key_Char(char key){
    switch(key){
        case 1:  return '1';
        case 2:  return '2';
        case 3:  return '3';
        case 4:  return 'A';
        case 5:  return '4';
        case 6:  return '5';
        case 7:  return '6';
        case 8:  return 'B';
        case 9:  return '7';
        case 10: return '8';
        case 11: return '9';
        case 12: return 'C';
        case 13: return '*';
        case 14: return '0';
        case 15: return '#';
        case 16: return 'D';
        default: return 0;
    }
}

// ===== Password Check Function =====
void Check_Password(){
    char password[5] = "1234";
    char entered_pass[5];
    char key;
    int i = 0;
    int attempts = 0;
    int cnt = 0;
    char cnt_txt[7];

    while(1){
        LCD_Cmd(_LCD_CLEAR);
        LCD_Out(1,1,"Enter Password:");
        i = 0;

        // Read 4 characters
        while(i < 4){
            key = 0;
            while(key == 0) key = Keypad_Key_Click();

            entered_pass[i] = Get_Key_Char(key);
            LCD_Chr(2, i+1, '*'); // Display asterisk
            i++;
            Delay_ms(200); // Debounce/Wait
        }
        entered_pass[4] = '\0'; // Null terminate

        // Check Password
        if(strcmp(entered_pass, password) == 0){
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"Correct!");
            Delay_ms(1000);
            Turn_On_Servo();               // Open Garage
            attempts = 0;                  // Reset attempts on success
        } else {
            attempts++;
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"Wrong Password");
            Delay_ms(1000);

            if(attempts >= 3){
                // 60-second lockout with countdown
                for(cnt = 60; cnt > 0; cnt--){
                    LCD_Cmd(_LCD_CLEAR);
                    LCD_Out(1,1,"Wait: ");
                    IntToStr(cnt, cnt_txt);
                    LCD_Out(1,7,cnt_txt);
                    LCD_Out(1,13,"s");
                    Delay_ms(250);
                }
                attempts = 0; // Reset attempts after wait
            }
        }
    }
}

// ===== Main Function =====
void main(){
    ADCON1 = 0x06;   // Configure analog pins as digital = >without it leds not operate

    // Set directions
    TRIG_Direction  = 0;
    ECHO_Direction  = 1;
    TRIG2_Direction = 0;
    ECHO2_Direction = 1;
    SERVO_Direction = 0;
    LED_RED_Direction = 0;
    LED_GREEN_Direction = 0;

    LED_RED = 1;
    LED_GREEN = 0;

    LCD_Init();
    Keypad_Init();

    // Turn_On_LCD();
    // Turn_On_Keypad();
    // Turn_On_Ultrasonic();

    Delay_ms(500);

    Check_Password(); // Start Password System

    while(1);
}

// ===== Interrupt Handler (empty for now) =====
void interrupt(){
}