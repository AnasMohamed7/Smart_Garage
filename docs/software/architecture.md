# Software Architecture

## System Overview

The Smart Garage system uses a **state machine** approach to handle entry/exit operations with embedded safety logic.

<pre>
                   ┌─────────────┐
                   │    IDLE     │
                   └──────┬──────┘
                          │
                          │ Car detected OR
                          │ Exit button pressed
                          ▼
               ┌──────────────────────┐
               │   ENTRY / EXIT       │
               │      DETECTED        │
               └─────────┬────────────┘
                         │
                         │ Entry → Ask for password
                         │ Exit  → Skip password
                         ▼
               ┌──────────────────────┐
               │    DOOR OPENING      │
               └─────────┬────────────┘
                         │
                         │ Servo rotates to 90°
                         ▼
               ┌──────────────────────┐
               │ WAITING FOR CAR TO   │
               │        PASS          │
               └─────────┬────────────┘
                         │
                         │ Path clear (sensors) OR timeout
                         ▼
               ┌──────────────────────┐
               │    DOOR CLOSING      │
               └─────────┬────────────┘
                         │
                         │ Servo rotates to 0°
                         ▼
                     (Back to IDLE)
</pre>

## Code Structure

### Main Components

#### 1. Hardware Abstraction Layer

- **LCD Functions**: `Lcd_Init()`, `Lcd_Out()`, `Lcd_Cmd()`
- **Keypad Functions**: `Keypad_Init()`, `Keypad_Key_Click()`
- **Sensor Functions**: `getDistance1()`, `getDistance2()`
- **Actuator Functions**: `Servo_SetAngle()`, `UpdateGarageLEDs()`

#### 2. Business Logic Layer

- **Security**: `Check_Password()`, `Get_Key_Char()`
- **Main Controller**: `Operate_Garage()`

#### 3. Main Entry Point

- **Initialization**: `main()`

---

## Function Call Tree

<pre>
main()
├── Lcd_Init()
├── Keypad_Init()
└── Operate_Garage() [infinite loop]
├── getDistance1()
├── getDistance2()
├── Check_Password()
│ ├── Lcd_Out()
│ ├── Keypad_Key_Click()
│ ├── Get_Key_Char()
│ └── strcmp()
├── Open_Door()
│ └── Servo_SetAngle()
│ └── UpdateGarageLEDs()
└── Close_Door()
└── Servo_SetAngle()
└── UpdateGarageLEDs()
</pre>

See complete call tree: [function_call_tree.txt](function_call_tree.txt)

---

## Data Flow

### Entry Scenario

<pre>
                ┌─────────────────────────────────────┐
                │   Ultrasonic Sensor 1 < 25 cm ?      │
                └───────────────────────┬─────────────┘
                                        │ YES
                                        ▼
                           ┌──────────────────────────┐
                           │ LCD: "WELCOME"           │
                           └─────────────┬────────────┘
                                         ▼
                           ┌──────────────────────────┐
                           │ Keypad → Check_Password()│
                           └─────────────┬────────────┘
                                         │ Correct
                                         ▼
                           ┌──────────────────────────┐
                           │ Servo → OPEN (90°)       │
                           └─────────────┬────────────┘
                                         ▼
                  ┌──────────────────────────────────────────┐
                  │ Wait: Ultrasonic Sensor 2 < 15 cm (inside)│
                  └───────────────────────┬───────────────────┘
                                          ▼
          ┌──────────────────────────────────────────────────────────┐
          │ Wait: Ultrasonic Sensor 1 > 25 cm (path clear outside)   │
          └────────────────────────┬──────────────────────────────────┘
                                   ▼
                         ┌──────────────────────────┐
                         │ Servo → CLOSE (0°)       │
                         └─────────────┬────────────┘
                                       ▼
                                   ┌─────────┐
                                   │  IDLE   │
                                   └─────────┘
</pre>

---

## Key Algorithms

### Password Validation

```c
1. Initialize attempts = 0
2. LOOP:
   a. Prompt for 4-digit password
   b. Read keypad input (display as ****)
   c. Compare with stored password
   d. IF match: return success
   e. ELSE:
      - Increment attempts
      - IF attempts >= 3:
        * Display lockout message
        * Countdown 60 seconds
        * Reset attempts
      - GOTO step 2
```

### Ultrasonic Distance Measurement

```c
1. Send 10µs TRIG pulse
2. Wait for ECHO to go HIGH (with timeout)
3. Measure ECHO pulse width in microseconds (t)
4. Calculate distance: (t × 0.0343) / 2 cm
5. Return distance (or 0 if timeout)
```

### Servo Control

```c
FOR 50 iterations:
    1. Set PWM pin HIGH
    2. IF angle == 0:   Delay 800µs
       IF angle == 90:  Delay 1500µs
    3. Set PWM pin LOW
    4. Delay remainder to complete 20ms period
END FOR
```

---

## Memory Usage

From compilation log:

- **RAM Used**: 184 bytes (52% of 352 bytes available)
- **ROM Used**: 2541 program words (31% of 8192 available)

### RAM Breakdown (Approximate)

- Global variables: ~20 bytes
  - `MotorCurrentAngle`: 2 bytes
  - `password`: 5 bytes
  - `entered_pass`: 5 bytes
- Function local variables: ~30 bytes
- Stack: ~50 bytes
- Library buffers (LCD, Keypad): ~80 bytes

---

## Timing Constraints

| Operation              | Duration   | Notes                   |
| ---------------------- | ---------- | ----------------------- |
| Ultrasonic measurement | 10-30ms    | Per sensor reading      |
| Servo movement         | ~5 seconds | 0° to 90° or vice versa |
| LCD update             | ~5ms       | Per command             |
| Keypad scan            | ~10ms      | Per key press           |
| Password lockout       | 60 seconds | After 3 failed attempts |
| Entry/Exit timeout     | 10 seconds | Auto-close timeout      |

**Total Entry Cycle**: ~20-30 seconds (including password entry)  
**Total Exit Cycle**: ~15-20 seconds

---

## Safety Features

### 1. Obstacle Detection

```c
// During closing, check inner sensor
if (getDistance2() <= 15) {
    // Object detected, keep door open
    // Wait for path to clear
}
```

### 2. Timeout Protection

```c
timer_counter = 0;
while (condition) {
    Delay_ms(100);
    timer_counter++;
    if (timer_counter > 100) break;  // 10-second timeout
}
```

### 3. Lockout System

```c
if (attempts >= 3) {
    // Display countdown
    for (cnt = 60; cnt > 0; cnt--) {
        // Update LCD every second
        Delay_ms(1000);
    }
    attempts = 0;  // Reset
}
```

---

## Power Consumption

### Active Mode (Door Operating)

- PIC16F877A: ~50mA
- LCD: ~10mA
- Ultrasonic sensors: ~30mA (both)
- Servo motor: ~100-500mA (peak during movement)
- LEDs: ~20mA (both)
- **Total**: ~200-600mA @ 5V

### Idle Mode (Door Closed, LCD Off)

- PIC16F877A: ~50mA
- Ultrasonic sensors: ~15mA (polling)
- LEDs: ~10mA (only red on)
- **Total**: ~75mA @ 5V

---

## Error Handling

### Sensor Timeout

```c
if (t > 30000) {
    return 0;  // Indicate error
}
```

**Recovery**: System treats 0 as "no object detected"

### Password Entry Errors

- Invalid characters: Ignored (no action)
- Timeout: None (waits indefinitely for correct password)
- Wrong password: Counted toward lockout

### Servo Jamming

- **Detection**: None in current implementation
- **Future**: Add current sensing

---

## Configuration Parameters

Located in main code (top section):

```c
// Detection thresholds
#define ENTRY_DETECT_DISTANCE 25  // cm
#define SAFETY_DETECT_DISTANCE 15 // cm

// Timing
#define LOCKOUT_TIME 60           // seconds
#define TIMEOUT_ITERATIONS 100    // × 100ms = 10 seconds

// Password
char password[5] = "1234";        // Change here
```

---

## Future Enhancements

1. **Multiple Users**: Store array of passwords
2. **RFID**: Add card-based authentication
3. **Remote Control**: Bluetooth/Wi-Fi module
4. **Logging**: SD card for entry/exit timestamps
5. **Voice Alerts**: Speaker for audio feedback
6. **Mobile App**: Control and monitor via smartphone

---

## Debugging Tips

### Enable Debug Output

(Future): Add UART printf for debugging

```c
// Add to functions:
printf("Distance: %f cm\n", distance);
```

### Proteus Debugging

- Use breakpoints (click line numbers)
- Watch variables (right-click → Add to Watch)
- Step through code (F7 for step into, F8 for step over)

### Common Issues

1. **Door jerky**: Reduce PWM pulse variations
2. **LCD garbled**: Check timing delays in Lcd_Cmd
3. **Sensors inconsistent**: Add averaging (read 3 times)

---

## References

- [PIC16F877A Datasheet](http://ww1.microchip.com/downloads/en/DeviceDoc/39582b.pdf)
- [HC-SR04 Ultrasonic Sensor](https://cdn.sparkfun.com/datasheets/Sensors/Proximity/HCSR04.pdf)
- [HD44780 LCD Controller](https://www.sparkfun.com/datasheets/LCD/HD44780.pdf)
- [SG90 Servo Motor Specs](http://www.ee.ic.ac.uk/pcheung/teaching/DE1_EE/stores/sg90_datasheet.pdf)
