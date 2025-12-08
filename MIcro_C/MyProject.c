// ================= LCD Pins =================
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

// ================= Keypad =================
char keypadport at PORTB;

// ================= Ultrasonic Sensor 1 =================
sbit TRIG  at RC0_bit;
sbit ECHO  at RC1_bit;
sbit TRIG_Direction  at TRISC0_bit;
sbit ECHO_Direction  at TRISC1_bit;

// ================= Ultrasonic Sensor 2 =================
sbit TRIG2 at RC2_bit;
sbit ECHO2 at RC3_bit;
sbit TRIG2_Direction at TRISC2_bit;
sbit ECHO2_Direction at TRISC3_bit;

// ================= Servo =================
sbit SERVO at RC4_bit;
sbit SERVO_Direction at TRISC4_bit;

// ================= LEDs =================
sbit LED_RED   at RE1_bit;
sbit LED_GREEN at RE0_bit;
sbit LED_RED_Direction   at TRISE1_bit;
sbit LED_GREEN_Direction at TRISE0_bit;

// ================= Button =================
sbit InButton at RE2_bit;
sbit InButton_Direction at TRISE2_bit;


unsigned int MotorCurrentAngle = 0;
char password[5] = "1234";
char entered_pass[5];


// =====================================================
// ================ ULTRASONIC HELPER ==================
// =====================================================

float getDistance1(){   //outer ultrasonic
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
float getDistance2(){    //inner ultrasonic
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


// =====================================================
// ==================== SERVO + LEDs ====================
// =====================================================
void UpdateGarageLEDs(unsigned int angle){
    LED_RED   = (angle == 0);
    LED_GREEN = (angle == 90);
}


void Servo_SetAngle(unsigned int angle){
    unsigned short i;
    MotorCurrentAngle = angle;
    
     if(angle==0)
     {
        for(i = 0; i < 50; i++)
          {
             UpdateGarageLEDs(angle);
             SERVO =1;
             Delay_us(800); // pulse of 1500us
             Servo = 0;
             Delay_us(19200);
          }
     }
          
    if(angle == 90)
      {
        for(i = 0; i < 50; i++)
          {
            UpdateGarageLEDs(angle);
            SERVO =1;
            Delay_us(1500); // pulse of 800us
            Servo = 0;
            Delay_us(18500);
           }
      }
      
     
}


void Open_Door(){  Servo_SetAngle(90); }

void Close_Door(){ Servo_SetAngle(0); }


// =====================================================
// =================== KEYPAD MAPPING ===================
// =====================================================
const char keyMap[17] = "123A456B789C*0#D";

char Get_Key_Char(char key){
    if(key >= 1 && key <= 16) return keyMap[key - 1];
    return 0;
}


// =====================================================
// =================== PASSWORD CHECK ===================
// =====================================================
int Check_Password(){
    char key;
    char k_char; // Temp variable to hold the converted char
    int i = 0;
    int attempts = 0;
    int cnt = 0;

    // Clear the array initially to be safe
    memset(entered_pass, 0, 5);

    while(1){
        LCD_Cmd(_LCD_CLEAR);
        LCD_Out(1,1,"Enter Password:");
        i = 0;

        // Read 4 characters
        while(i < 4){
            key = 0;
            while(key == 0) key = Keypad_Key_Click();

            k_char = Get_Key_Char(key);

            //  Only accept the key if it is a valid character (not 0)
            if (k_char != 0) {
                entered_pass[i] = k_char;
                LCD_Chr(2, i+1, '*');
                i++;
                Delay_ms(200);
            }
        }
        entered_pass[4] = '\0'; // Null terminate safely

        // Check Password
        if(strcmp(entered_pass, password) == 0){
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"Correct!");
            return 0; // Success
        } else {
            attempts++;
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"Wrong Password");
            LED_RED = 1; // Explicitly ensure RED is ON
            LED_GREEN = 0;
            Delay_ms(1000);

            if(attempts >= 3){
                LCD_Cmd(_LCD_CLEAR);
                LCD_Out(1,1,"Wait: ");
                LCD_Out(1,10,"s");

                for(cnt = 60; cnt > 0; cnt--){
                    // --- MANUALLY PRINT DIGITS (Saves Memory) ---
                    LCD_Chr(1, 7, (cnt / 10) + 48);    //48 to convert number(1-9) into char("1"-"9")
                    LCD_Chr(1, 8, (cnt % 10) + 48);
                    Delay_ms(480);
                }

                attempts = 0;
            }
        }
    }
}


// =====================================================
// ==================== MAIN LOGIC ======================
// =====================================================
void Operate_Garage (){
    float d1, d2;
    int DoorIsClosed;
    unsigned int timer_counter; // Variable for the timeout logic

    // Initialize door state
    if(MotorCurrentAngle == 0) DoorIsClosed=1; else DoorIsClosed=0;

    while(1){
        d1 = getDistance1();
        d2 = getDistance2();
        Delay_ms(200); // Reduced delay for better responsiveness

        // Update status based on current angle
        if(MotorCurrentAngle == 0) DoorIsClosed=1; else DoorIsClosed=0;

        // ================= ENTRY CASE =================
        if(d1 <= 25 && DoorIsClosed ){
            LCD_CMD(_LCD_TURN_ON);
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"....WELCOME.....");
            Delay_ms(500);

            Check_Password(); // Blocks here until correct password
            delay_ms(500);
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"Opening Door...");
            Open_Door();

            // --- SAFETY LOGIC FOR ENTRY ---
            timer_counter = 0;
            while(getDistance2() > 15) {
               Delay_ms(100);
               timer_counter++;
               if(timer_counter > 100) break; // 10 Sec Timeout waiting for entry
            }


            while(getDistance1() <= 25) {
                Delay_ms(100);
                // No timeout here strictly, or a very long one?
                // Safety priority: checking if blocked.
                // If blocked, wait.
            }
            // ---------------------------------------------------

            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"Closing Door...");
            Close_Door();
            LCD_CMD(_LCD_TURN_OFF);
            DoorIsClosed=1;
        }

        // ================= EXIT CASE =================
        if(InButton==1 && DoorIsClosed){
            LCD_Cmd(_LCD_TURN_ON);
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"Exit Request");
            Delay_ms(300);

            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"Opening Door...");
            Open_Door();

            // --- SAFETY LOGIC FOR EXIT ---
            timer_counter = 0;
            while(getDistance1() > 25) {
                Delay_ms(100);
                timer_counter++;
                if(timer_counter > 100) break; // 10 Sec timeout
            }

            while(getDistance1() <= 25 || getDistance2() <= 15) {
                Delay_ms(100);
                // Wait until path is clear
            }
            // ---------------------------------------------------

            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1,1,"Closing Door...");
            Close_Door();
            LCD_CMD(_LCD_TURN_OFF);
            DoorIsClosed=1;
        }
    }
}



// =====================================================
// ======================== MAIN ========================
// =====================================================
void main(){
    ADCON1 = 0x06;
    SERVO_Direction = 0;
    LED_RED_Direction = 0;
    LED_GREEN_Direction = 0;
    InButton_Direction = 1;
    TRIG_Direction  = 0;
    ECHO_Direction  = 1;
    TRIG2_Direction = 0;
    ECHO2_Direction = 1;

    LED_RED = 0;
    LED_GREEN = 0;

    LCD_Init();
    LCD_cmd(_LCD_Cursor_off);

    Keypad_Init();
    Operate_Garage();






}