# Smart Door System - Hardware Components, Pin Configuration & Wiring Guide

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

| Component         | Specification | Quantity | Notes                         |
| ----------------- | ------------- | -------- | ----------------------------- |
| Power Source      | 5V DC         | 1        | Minimum 1A (2A recommended)   |
| Voltage Regulator | 7805          | 1        | If using 9V input             |
| Capacitor         | 100 μF        | 1        | Smoothing capacitor           |
| Capacitor         | 100 μF        | 1        | Servo power supply decoupling |

### Miscellaneous

| Component          | Quantity | Notes                                  |
| ------------------ | -------- | -------------------------------------- |
| Breadboard         | 1        | Or custom PCB                          |
| Jumper Wires       | 40+      | Various colors for clear port tracking |
| PICkit3 Programmer | 1        | For programming PIC16F877A             |
| Potentiometer      | 10 kΩ    | For LCD contrast adjustment (RV1)      |
| Fuse               | 1A       | In-line fuse for +5V protection        |

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
- Component connections align with pin configuration and wiring guide below

---

# Wiring Guide - Smart Door System

## Power Distribution

### Main Power Supply

- **Input**: 5V DC (regulated)
- **Current**: Minimum 1A (2A recommended)

```
[5V Source]
├──→ PIC16F877A (Pin 11, 32)
├──→ LCD VDD
├──→ Ultrasonic Sensors VCC (both)
├──→ Servo Red wire
└──→ Keypad pull-ups

[GND]
├──→ PIC16F877A (Pin 12, 31)
├──→ LCD VSS
├──→ Ultrasonic Sensors GND (both)
├──→ Servo Brown wire
└──→ All component grounds
```

---

## Component Connections

### PIC16F877A Pinout Reference

| Pin    | Function | Connection                     |
| ------ | -------- | ------------------------------ |
| 1      | MCLR     | +5V (via 10kΩ resistor)        |
| 11, 32 | Vdd      | +5V                            |
| 12, 31 | VSS      | GND                            |
| 15     | RC0      | Outer Ultrasonic TRIG          |
| 16     | RC1      | Outer Ultrasonic ECHO          |
| 17     | RC2      | Inner Ultrasonic TRIG          |
| 18     | RC3      | Inner Ultrasonic ECHO          |
| 23     | RC4      | Servo Signal (PWM)             |
| 8      | RE0      | Green LED (+ 330Ω resistor)    |
| 9      | RE1      | Red LED (+ 330Ω resistor)      |
| 10     | RE2      | Exit Button (+ 10kΩ pull-down) |
| 21     | RD2      | LCD RS                         |
| 22     | RD3      | LCD EN                         |
| 27     | RD4      | LCD D4                         |
| 28     | RD5      | LCD D5                         |
| 29     | RD6      | LCD D6                         |
| 30     | RD7      | LCD D7                         |

### PORTB - Keypad Connections (4×4 Matrix)

```
Keypad Pin | PIC Pin | Function
-----------|---------|----------
Row 1      | RB4(37) | Input
Row 2      | RB5(38) | Input
Row 3      | RB6(39) | Input
Row 4      | RB7(40) | Input
Col 1      | RB0(33) | Output
Col 2      | RB1(34) | Output
Col 3      | RB2(35) | Output
Col 4      | RB3(36) | Output
```

---

## LCD Wiring (16x2 Character Display - 4-bit Mode)

| LCD Pin      | Function        | Connect To                           |
| ------------ | --------------- | ------------------------------------ |
| 1 (VSS)      | Ground          | GND                                  |
| 2 (VDD)      | Power           | +5V                                  |
| 3 (V0)       | Contrast        | 10kΩ pot wiper (between +5V and GND) |
| 4 (RS)       | Register Select | PIC RD2 (Pin 21)                     |
| 5 (RW)       | Read/Write      | GND (write mode only)                |
| 6 (EN)       | Enable          | PIC RD3 (Pin 22)                     |
| 7-10 (D0-D3) | Data Lines      | Not connected (4-bit mode)           |
| 11 (D4)      | Data Bit 4      | PIC RD4 (Pin 27)                     |
| 12 (D5)      | Data Bit 5      | PIC RD5 (Pin 28)                     |
| 13 (D6)      | Data Bit 6      | PIC RD6 (Pin 29)                     |
| 14 (D7)      | Data Bit 7      | PIC RD7 (Pin 30)                     |
| 15 (A)       | Backlight +     | +5V (+ 330Ω resistor)                |
| 16 (K)       | Backlight -     | GND                                  |

**Contrast Adjustment**: Turn potentiometer until characters visible

---

## Ultrasonic Sensors (HC-SR04) - Both Wired Same

### Outer Sensor (Entry Detection)

| HC-SR04 Pin | Connect To       |
| ----------- | ---------------- |
| VCC         | +5V              |
| TRIG        | PIC RC0 (Pin 15) |
| ECHO        | PIC RC1 (Pin 16) |
| GND         | GND              |

### Inner Sensor (Obstacle Detection)

| HC-SR04 Pin | Connect To       |
| ----------- | ---------------- |
| VCC         | +5V              |
| TRIG        | PIC RC2 (Pin 17) |
| ECHO        | PIC RC3 (Pin 18) |
| GND         | GND              |

**Mounting**: Sensors should face outward, 25cm above ground

---

## Servo Motor (SG90) Wiring

| Servo Wire | Color  | Connect To                     |
| ---------- | ------ | ------------------------------ |
| Power      | Red    | +5V (separate PSU if possible) |
| Ground     | Brown  | GND                            |
| Signal     | Orange | PIC RC4 (Pin 23)               |

**Important**: Servo can draw 500mA peak current. Add 100µF capacitor across servo power pins for stable operation. Use adequate power supply (2A minimum).

---

## LED Connections with Current-Limiting Resistors

### Green LED (Door Open Indicator)

```
PIC RE0 (Pin 8) ──┬─── 330Ω resistor ──┬─── LED Anode (+, longer leg)
                   │                       │
                   └───────────────────────┴─── LED Cathode (-, shorter leg) ─── GND
```

### Red LED (Door Closed Indicator)

```
PIC RE1 (Pin 9) ──┬─── 330Ω resistor ──┬─── LED Anode (+, longer leg)
                   │                       │
                   └───────────────────────┴─── LED Cathode (-, shorter leg) ─── GND
```

---

## Exit Button with Pull-Down Configuration

```
        +5V
         │
         ├─── 10kΩ resistor ────┬─── PIC RE2 (Pin 10)
         │                       │
      [Button]                   │
         │                       │
        GND ────────────────────┘
```

**Operation**:

- Normal state: RE2 reads LOW (0V via pull-down)
- Button pressed: RE2 reads HIGH (+5V through pull-up from Vdd)

---

## Programming Header (ICSP) - PICkit3 Connection

| PICkit3 Pin | Signal | PIC Connection                 |
| ----------- | ------ | ------------------------------ |
| 1           | MCLR   | Pin 1 (MCLR/VPP) + 10kΩ to +5V |
| 2           | VDD    | Pin 11 or 32 (+5V)             |
| 3           | VSS    | Pin 12 or 31 (GND)             |
| 4           | PGD    | Pin 40 (RB7/PGD)               |
| 5           | PGC    | Pin 39 (RB6/PGC)               |

**Programming Mode**:

- Connect PICkit3 to header
- Power circuit externally (5V)
- Load .hex file in mikroC or MPLAB
- Program device

---

## Complete Wiring Checklist

### Before Powering On:

- [ ] All power connections correct (no reversed polarity)
- [ ] All ground connections made
- [ ] No shorts between +5V and GND
- [ ] LCD contrast pot installed
- [ ] Servo wired correctly (red to +5V, brown to GND)
- [ ] 100µF capacitor across servo power pins
- [ ] LED polarity correct (longer leg to resistor)
- [ ] Button pull-down resistor installed
- [ ] Ultrasonic sensors facing correct direction
- [ ] PIC programmed with .hex file
- [ ] 1A fuse in series with +5V

### First Power-On Test:

1. Apply power (5V)
2. Check PIC gets power (measure Pin 11: should be 5V)
3. Check LCD lights up (adjust contrast if needed)
4. Check LEDs (red should be ON if door closed)
5. Press keys on keypad (should feel mechanical click)
6. Wave hand near sensors (should detect movement)
7. Check servo responds to control signals

---

## Troubleshooting Wiring Issues

### LCD Shows Nothing

- Check power (VDD = 5V, VSS = GND)
- Adjust contrast potentiometer
- Verify RD2-RD7 connections
- Check EN and RS signals on oscilloscope

### LCD Shows Garbage

- Check EN and RS connections (RD2, RD3)
- Verify 4-bit data lines (RD4-RD7)
- Check for loose connections
- Ensure data lines not floating

### Keypad Not Responding

- Verify all 8 wires connected to PORTB
- Check for shorts between rows/columns
- Test individual keys with multimeter
- Verify correct row/column mapping

### Sensors Always Read 0

- Check TRIG and ECHO not swapped
- Verify 5V power to sensor
- Ensure sensor faces open space (not wall)
- Measure ECHO pin voltage during trigger

### Servo Doesn't Move

- Check signal wire to RC4
- Verify servo has power (red to +5V)
- Test servo separately with known-good signal
- Check 100µF capacitor is connected
- Verify servo power supply can deliver 500mA

### LEDs Don't Light

- Check polarity (longer leg to resistor)
- Verify 330Ω resistors installed
- Test LEDs directly with 5V (through resistor)
- Check PIC pin is configured as output
- Verify connection to RE0 and RE1

### PIC Won't Program

- Check ICSP header connections
- Verify MCLR pull-up resistor (10kΩ)
- Test power supply voltage (5V)
- Try different USB port for PICkit3

---

## Breadboard Layout Tips

1. **Power Rails**: Use breadboard power rails for +5V and GND distribution
2. **IC Placement**: Place PIC across center gap of breadboard
3. **Component Grouping**:
   - LCD on one side
   - Keypad on opposite side
   - Sensors at edges
   - Servo separate (due to current draw)
4. **Wire Management**: Use different colors:
   - Red: +5V
   - Black: GND
   - Yellow: Signals
   - Green: Inputs
   - Blue: Outputs

---

## Safety Notes

⚠️ **IMPORTANT**:

- Never connect/disconnect components while powered
- Double-check polarity before applying power
- Use current-limited power supply (prevents damage)
- Add 1A fuse in series with +5V for protection
- Servo can draw high current (500mA peak) - use adequate power supply
- Keep drinks and liquids away from electronics
- Allow cooling time if components get hot
- Wear grounding strap when handling PIC to prevent ESD damage

---

## Power Supply Recommendations

**Minimum Requirements**:

- 5V DC, 1A minimum
- 2A recommended for reliable servo operation

**Suitable Options**:

- USB Power adapter (5V/2A)
- Laboratory power supply
- 9V battery with 7805 voltage regulator
- Phone charger (5V/2A+)

**Avoid**:

- Weak/old batteries
- Unregulated power supplies
- USB ports without external adapter (may not deliver enough current)
