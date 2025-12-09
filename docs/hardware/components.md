# Smart Door System - Hardware Components & Pin Configuration

## Pin Configuration

### Port Allocations

**PORTB - Keypad Interface (4×4 Matrix)**

- RB0 → Column 1 (Output)
- RB1 → Column 2 (Output)
- RB2 → Column 3 (Output)
- RB4 → Row A (Input)
- RB5 → Row B (Input)
- RB6/PGC → Row C (Input)
- RB7/PGD → Row D (Input)

**PORTC - Ultrasonic Sensors & Control**

- RC0/T1OSO → Outer Ultrasonic TRIG (Output)
- RC1/T1OSI/CCP2 → Outer Ultrasonic ECHO (Input)
- RC2/CCP1 → Inner Ultrasonic TRIG (Output)
- RC3/SCK/SCL → Inner Ultrasonic ECHO (Input)
- RC4/SDI/SDA → Servo Motor PWM (Output)
- RC5/SDO → (Reserved)
- RC6/TX/CK → (Reserved)
- RC7/RX/DT → (Reserved)

**PORTD - LCD Data Bus (4-bit Mode)**

- RD0/PSP0 → (Reserved)
- RD1/PSP1 → (Reserved)
- RD2/PSP2 → RS (Register Select)
- RD3/PSP3 → E/EN (Enable)
- RD4/PSP4 → LCD D4 (Data Bit 4)
- RD5/PSP5 → LCD D5 (Data Bit 5)
- RD6/PSP6 → LCD D6 (Data Bit 6)
- RD7/PSP7 → LCD D7 (Data Bit 7)

**PORTE - LCD Control & Status Indicators**

- RE0/AN5/RD → Green LED (Door Open Indicator)
- RE1/AN6/WR → Red LED (Door Closed Indicator)
- RE2/AN7/CS → Push Button (Exit/Manual Override)

### Additional Control Lines

**LCD Control Signals** (via PORTD/PORTE)

- RS (Register Select) → RD2/PSP2
- E/EN (Enable) → RD3/PSP3

**Clock & Power**

- Pin 1 (Vdd) → +5V
- Pins 8, 17 (VSS) → GND
- Pin 18 (Vdd) → +5V
- Oscillator: X1 (CRYSTAL) with C1, C2 (22pF each)

### Resistor Values

- R1 (Pull-up/MCLR) → 10kΩ to Vdd
- R2 (Green LED) → 330Ω
- R3 (Red LED) → 330Ω
- R4 (Push Button) → 10kΩ Pull-down
- RV1 (LCD Contrast) → 10kΩ Potentiometer
- RV2, RV3 (Sensor Reference) → 10kΩ

### Summary Table

| Device            | Port | Pin(s)  | Type         |
| ----------------- | ---- | ------- | ------------ |
| Keypad (Rows)     | RB   | 4,5,6,7 | Input        |
| Keypad (Cols)     | RB   | 1,2,3   | Output       |
| Outer Sensor TRIG | RC   | 0       | Output       |
| Outer Sensor ECHO | RC   | 1       | Input        |
| Inner Sensor TRIG | RC   | 2       | Output       |
| Inner Sensor ECHO | RC   | 3       | Input        |
| Servo Motor       | RC   | 4       | Output (PWM) |
| LCD Data          | RD   | 4,5,6,7 | Output       |
| LCD RS            | RD   | 2       | Output       |
| LCD EN            | RD   | 3       | Output       |
| Green LED         | RE   | 0       | Output       |
| Red LED           | RE   | 1       | Output       |
| Push Button       | RE   | 2       | Input        |

---

# Hardware Components List

## Bill of Materials (BOM)

### Microcontroller

| Component          | Part Number | Quantity | Notes                     |
| ------------------ | ----------- | -------- | ------------------------- |
| Microcontroller    | PIC16F877A  | 1        | 40-pin DIP, 8-bit         |
| Crystal Oscillator | 4 MHz       | 1        | For system clock          |
| Capacitors         | 22 pF       | 2        | For crystal stabilization |
| Capacitor          | 100 nF      | 1        | Decoupling capacitor      |

### Sensors

| Component         | Part Number | Quantity | Notes                            |
| ----------------- | ----------- | -------- | -------------------------------- |
| Ultrasonic Sensor | HC-SR04     | 2        | Outer (entry) and Inner (safety) |
| Distance Range    | 2-400 cm    | -        | Both sensors                     |

### Display & Input

| Component          | Part Number              | Quantity | Notes                                         |
| ------------------ | ------------------------ | -------- | --------------------------------------------- |
| LCD Display        | 16x2 Character (HD44780) | 1        | 4-bit mode, connected to PORTD/PORTE          |
| Keypad             | 4x4 Matrix               | 1        | 16 keys (0-9, A-D, \*, #), connected to PORTB |
| Push Button        | Tactile Switch           | 1        | For exit request, connected to RE2            |
| Resistors (Button) | 10 kΩ                    | 1        | Pull-down resistor for RE2                    |

### Actuators & Indicators

| Component        | Part Number | Quantity | Notes                                                 |
| ---------------- | ----------- | -------- | ----------------------------------------------------- |
| Servo Motor      | SG90        | 1        | 180° rotation, door mechanism, connected to RC4 (PWM) |
| LED Red          | 5mm         | 1        | Door closed indicator, connected to RE1               |
| LED Green        | 5mm         | 1        | Door open indicator, connected to RE0                 |
| Resistors (LEDs) | 330 Ω       | 2        | Current limiting resistors                            |

### Power Supply

| Component         | Specification | Quantity | Notes                        |
| ----------------- | ------------- | -------- | ---------------------------- |
| Power Source      | 5V DC         | 1        | Can use USB power or adapter |
| Voltage Regulator | 7805          | 1        | If using 9V input            |
| Capacitor         | 100 μF        | 1        | Smoothing capacitor          |

### Miscellaneous

| Component          | Quantity | Notes                                  |
| ------------------ | -------- | -------------------------------------- |
| Breadboard         | 1        | Or custom PCB                          |
| Jumper Wires       | 40+      | Various colors for clear port tracking |
| PICkit3 Programmer | 1        | For programming PIC16F877A             |
| Potentiometer      | 10 kΩ    | For LCD contrast adjustment (RV1)      |

## Total Cost Estimate

- **Budget**: ~$30-40 USD
- **Time to Assemble**: 2-3 hours

## Where to Buy

- **Local**: Electronics component shops in Cairo
- **Online**:
  - Amazon
  - AliExpress
  - Local online stores (Egypt)

## Notes

- All components readily available
- Some components may be salvaged from old electronics
- Proteus simulation available if hardware unavailable
- Component connections align with pin configuration table above
