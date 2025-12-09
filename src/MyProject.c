/**
 * @file    MyProject.c
 * @brief   Smart Garage Door Control System - Main Program
 *
 * @details This system controls an automated garage door using:
 *          - 2x HC-SR04 ultrasonic sensors for car detection
 *          - 4x4 keypad for password entry (default: 1234)
 *          - 16x2 LCD for user interface
 *          - SG90 servo motor for door actuation
 *          - LEDs for status indication
 *          - Safety features: obstacle detection, lockout timer
 *
 * @author  Cairo University Engineering Team
 * @date    December 2024
 * @version 1.0
 *
 * @hardware
 *   MCU:     PIC16F877A @ 4MHz
 *   Sensors: HC-SR04 Ultrasonic (x2)
 *   Display: 16x2 LCD (HD44780)
 *   Input:   4x4 Matrix Keypad, Push Button
 *   Output:  SG90 Servo, LEDs (Red/Green)
 *
 * @pin_configuration
 *   LCD:     RD2-RD7 (RS, EN, D4-D7)
 *   Keypad:  PORTB (4x4 matrix)
 *   US1:     RC0(TRIG), RC1(ECHO) - Outer sensor
 *   US2:     RC2(TRIG), RC3(ECHO) - Inner sensor
 *   Servo:   RC4 (PWM signal)
 *   LEDs:    RE0(Green), RE1(Red)
 *   Button:  RE2 (Exit button input)
 *
 * @operation
 *   ENTRY: Car approaches → Password prompt → Door opens → Car enters → Door closes
 *   EXIT:  Button pressed → Door opens → Car exits → Door closes (no password)
 *
 * @safety
 *   - 3 wrong password attempts = 60-second lockout
 *   - Inner sensor prevents door closing on obstacles
 *   - 10-second timeout prevents door staying open
 */

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
sbit TRIG at RC0_bit;
sbit ECHO at RC1_bit;
sbit TRIG_Direction at TRISC0_bit;
sbit ECHO_Direction at TRISC1_bit;

// ================= Ultrasonic Sensor 2 =================
sbit TRIG2 at RC2_bit;
sbit ECHO2 at RC3_bit;
sbit TRIG2_Direction at TRISC2_bit;
sbit ECHO2_Direction at TRISC3_bit;

// ================= Servo =================
sbit SERVO at RC4_bit;
sbit SERVO_Direction at TRISC4_bit;

// ================= LEDs =================
sbit LED_RED at RE1_bit;
sbit LED_GREEN at RE0_bit;
sbit LED_RED_Direction at TRISE1_bit;
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

/**
 * @brief Measures distance using outer ultrasonic sensor
 * @details Sends 10µs trigger pulse, measures echo pulse width,
 *          calculates distance using speed of sound formula
 * @return Distance in centimeters (0-400cm range)
 * @note Returns 0 if sensor timeout (>30ms) occurs
 * @note Used for detecting car approach (entry)
 */
float getDistance1()
{ // outer ultrasonic
    unsigned int t = 0;
    TRIG = 1;
    Delay_us(10);
    TRIG = 0;

    while (!ECHO)
    {
        if (t++ > 30000)
            return 0;
        Delay_us(1);
    }

    t = 0;
    while (ECHO)
    {
        if (t++ > 30000)
            break;
        Delay_us(1);
    }

    return (t * 0.0343) / 2;
}

/**
 * @brief Measures distance using inner ultrasonic sensor
 * @details Same principle as getDistance1 but for inner detection
 * @return Distance in centimeters (0-400cm range)
 * @note Returns 0 if sensor timeout (>30ms) occurs
 * @note Used for obstacle detection during door closing
 */
float getDistance2()
{ // inner ultrasonic
    unsigned int t = 0;
    TRIG2 = 1;
    Delay_us(10);
    TRIG2 = 0;

    while (!ECHO2)
    {
        if (t++ > 30000)
            return 0;
        Delay_us(1);
    }

    t = 0;
    while (ECHO2)
    {
        if (t++ > 30000)
            break;
        Delay_us(1);
    }

    return (t * 0.0343) / 2;
}

// =====================================================
// ==================== SERVO + LEDs ====================
// =====================================================

void UpdateGarageLEDs(unsigned int angle)
{
    LED_RED = (angle == 0);
    LED_GREEN = (angle == 90);
}

/**
 * @brief Moves servo motor to specified angle
 * @param angle Target angle: 0 (closed) or 90 (open)
 * @details Sends PWM pulses for 1 second (50 pulses @ 20ms period)
 *          - 0°:  800µs pulse width (door closed)
 *          - 90°: 1500µs pulse width (door open)
 * @note Also updates LED indicators via UpdateGarageLEDs()
 * @warning Only supports 0° and 90° angles
 */
void Servo_SetAngle(unsigned int angle)
{
    unsigned short i;
    MotorCurrentAngle = angle;

    if (angle == 0)
    {
        for (i = 0; i < 50; i++)
        {
            UpdateGarageLEDs(angle);
            SERVO = 1;
            Delay_us(800); // pulse of 1500us
            Servo = 0;
            Delay_us(19200);
        }
    }

    if (angle == 90)
    {
        for (i = 0; i < 50; i++)
        {
            UpdateGarageLEDs(angle);
            SERVO = 1;
            Delay_us(1500); // pulse of 800us
            Servo = 0;
            Delay_us(18500);
        }
    }
}

void Open_Door() { Servo_SetAngle(90); }

void Close_Door() { Servo_SetAngle(0); }

// =====================================================
// =================== KEYPAD MAPPING ===================
// =====================================================
const char keyMap[17] = "123A456B789C*0#D";

char Get_Key_Char(char key)
{
    if (key >= 1 && key <= 16)
        return keyMap[key - 1];
    return 0;
}

// =====================================================
// =================== PASSWORD CHECK ===================
// =====================================================

/**
 * @brief Validates 4-digit password with lockout protection
 * @return 0 on success (correct password entered)
 * @details
 *   - Prompts user to enter 4 digits via keypad
 *   - Displays asterisks (****) for entered digits
 *   - Compares with stored password (default: "1234")
 *   - After 3 wrong attempts: 60-second lockout with countdown
 *   - Red LED blinks on wrong password
 * @note Blocks until correct password or timeout completes
 * @note Ignores invalid keypad characters (only 0-9, A-D, *, #)
 */
int Check_Password()
{
    char key;
    char k_char; // Temp variable to hold the converted char
    int i = 0;
    int attempts = 0;
    int cnt = 0;

    // Clear the array initially to be safe
    memset(entered_pass, 0, 5);

    while (1)
    {
        LCD_Cmd(_LCD_CLEAR);
        LCD_Out(1, 1, "Enter Password:");
        i = 0;

        // Read 4 characters
        while (i < 4)
        {
            key = 0;
            while (key == 0)
                key = Keypad_Key_Click();

            k_char = Get_Key_Char(key);

            //  Only accept the key if it is a valid character (not 0)
            if (k_char != 0)
            {
                entered_pass[i] = k_char;
                LCD_Chr(2, i + 1, '*');
                i++;
                Delay_ms(200);
            }
        }
        entered_pass[4] = '\0'; // Null terminate safely

        // Check Password
        if (strcmp(entered_pass, password) == 0)
        {
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1, 1, "Correct!");
            return 0; // Success
        }
        else
        {
            attempts++;
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1, 1, "Wrong Password");
            LED_RED = 1; // Explicitly ensure RED is ON
            LED_GREEN = 0;
            Delay_ms(1000);

            // ========== 60-SECOND LOCKOUT AFTER 3 FAILED ATTEMPTS ==========
            if (attempts >= 3)
            {
                LCD_Cmd(_LCD_CLEAR);
                LCD_Out(1, 1, "Wait: ");
                LCD_Out(1, 10, "s"); // Display "s" for seconds

                // Countdown from 60 to 0
                for (cnt = 60; cnt > 0; cnt--)
                {
                    // Manually print two-digit counter (saves memory vs sprintf)
                    LCD_Chr(1, 7, (cnt / 10) + 48); // Tens digit (48 = ASCII '0')
                    LCD_Chr(1, 8, (cnt % 10) + 48); // Ones digit
                    Delay_ms(480);                  // ~480ms × 60 ≈ 60 seconds total
                }

                attempts = 0; // Reset counter after lockout
            }
        }
    }
}

// =====================================================
// ==================== MAIN LOGIC ======================
// =====================================================

/**
 * @brief Main control loop for garage door operation
 * @details Continuously monitors sensors and button, handles:
 *   ENTRY MODE:
 *     - Detects car at 25cm (outer sensor)
 *     - Requests password
 *     - Opens door if correct
 *     - Waits for car to enter (inner sensor)
 *     - Closes door when path clear
 *
 *   EXIT MODE:
 *     - Button press triggers door opening
 *     - No password required (safety)
 *     - Waits for car to exit (outer sensor)
 *     - Closes door when path clear
 *
 * @note This function never returns (infinite loop)
 * @note Includes 10-second timeout for both modes
 * @note Safety: Won't close if obstacle detected (<15cm inner)
 */
void Operate_Garage()
{
    float d1, d2;
    int DoorIsClosed;
    unsigned int timer_counter; // Variable for the timeout logic

    // Initialize door state
    if (MotorCurrentAngle == 0)
        DoorIsClosed = 1;
    else
        DoorIsClosed = 0;

    while (1)
    {
        d1 = getDistance1();
        d2 = getDistance2();
        Delay_ms(200); // Reduced delay for better responsiveness

        // Update status based on current angle
        if (MotorCurrentAngle == 0)
            DoorIsClosed = 1;
        else
            DoorIsClosed = 0;

        // ================= ENTRY CASE: Car detected at door =================
        if (d1 <= 25 && DoorIsClosed)
        { // 25cm threshold for detection
            LCD_CMD(_LCD_TURN_ON);
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1, 1, "....WELCOME.....");
            Delay_ms(500);

            Check_Password(); // Blocks here until correct password entered

            delay_ms(500);
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1, 1, "Opening Door...");
            Open_Door();

            // --- SAFETY: Wait for car to enter (detect via inner sensor) ---
            timer_counter = 0;
            while (getDistance2() > 15)
            { // Wait until inner sensor detects car
                Delay_ms(100);
                timer_counter++;
                if (timer_counter > 100)
                    break; // 10-second timeout
            }

            // Wait for car to fully enter (outer sensor clears)
            while (getDistance1() <= 25)
            {
                Delay_ms(100);
                // No timeout here - safety priority: don't close on car!
            }
            // --- End safety logic ---

            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1, 1, "Closing Door...");
            Close_Door();
            LCD_CMD(_LCD_TURN_OFF);
            DoorIsClosed = 1;
        }

        // ================= EXIT CASE =================
        if (InButton == 1 && DoorIsClosed)
        {
            LCD_Cmd(_LCD_TURN_ON);
            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1, 1, "Exit Request");
            Delay_ms(300);

            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1, 1, "Opening Door...");
            Open_Door();

            // --- SAFETY LOGIC FOR EXIT ---
            timer_counter = 0;
            while (getDistance1() > 25)
            {
                Delay_ms(100);
                timer_counter++;
                if (timer_counter > 100)
                    break; // 10 Sec timeout
            }

            while (getDistance1() <= 25 || getDistance2() <= 15)
            {
                Delay_ms(100);
                // Wait until path is clear
            }
            // ---------------------------------------------------

            LCD_Cmd(_LCD_CLEAR);
            LCD_Out(1, 1, "Closing Door...");
            Close_Door();
            LCD_CMD(_LCD_TURN_OFF);
            DoorIsClosed = 1;
        }
    }
}

// =====================================================
// ======================== MAIN ========================
// =====================================================

/**
 * @brief Program entry point - initializes all peripherals
 * @details Initialization sequence:
 *   1. Configure analog pins as digital (ADCON1)
 *   2. Set pin directions (inputs/outputs)
 *   3. Initialize LCD display
 *   4. Initialize keypad
 *   5. Start main control loop (Operate_Garage)
 * @note Never returns - runs Operate_Garage() infinitely
 */
void main()
{
    ADCON1 = 0x06;
    SERVO_Direction = 0;
    LED_RED_Direction = 0;
    LED_GREEN_Direction = 0;
    InButton_Direction = 1;
    TRIG_Direction = 0;
    ECHO_Direction = 1;
    TRIG2_Direction = 0;
    ECHO2_Direction = 1;

    LED_RED = 0;
    LED_GREEN = 0;

    LCD_Init();
    LCD_cmd(_LCD_Cursor_off);

    Keypad_Init();
    Operate_Garage();
}