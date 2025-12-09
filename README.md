# 🚗 Smart Garage Door Control System

> Automated garage door with ultrasonic car detection, keypad password security, and safety monitoring.  
> **Built with PIC16F877A microcontroller for Embedded Systems Course**

![System Status](https://img.shields.io/badge/status-working-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## 📋 Quick Overview

This system automatically opens the garage door when a car approaches, requires password authentication, and includes safety features to prevent accidents.

**Key Features:**

- 🚗 Automatic car detection (ultrasonic sensors)
- 🔐 4-digit password security (default: 1234)
- 🛡️ Obstacle detection prevents door closing on objects
- 📟 LCD display shows status messages
- 💡 LED indicators (Red = Closed, Green = Open)
- 🚪 Manual exit button inside garage

---

## 📁 Repository Structure

<pre>
Smart_Garage/
├── docs/
│   ├── hardware/
│   └── software/
├── src/
│   ├── MyProject.c
│   └── MyProject.mcppi
├── simulation/
│   ├── proteus/
│   └── archive/
├── build/
├── tests/
├── assets/
└── README.md
</pre>

---

## 🛠️ Hardware Components

| Component         | Specification  | Quantity |
| ----------------- | -------------- | -------- |
| Microcontroller   | PIC16F877A     | 1        |
| Ultrasonic Sensor | HC-SR04        | 2        |
| LCD Display       | 16x2 Character | 1        |
| Keypad            | 4x4 Matrix     | 1        |
| Servo Motor       | SG90           | 1        |
| LEDs              | 5mm Red/Green  | 2        |
| Push Button       | Tactile Switch | 1        |

**Complete component list:** [docs/hardware/components.md](docs/hardware/components.md)

---

## 🚀 Quick Start Guide

### For Simulation (Proteus)

1. **Open the simulation:**

   - Open Proteus
   - File → Open → `simulation/proteus/Smart_Garage.pdsprj`

2. **Load the program:**

   - Double-click the PIC16F877A chip
   - Click "Program File" folder icon
   - Select `build/Smart_Garage.hex`
   - Click OK

3. **Run simulation:**
   - Press F12 (or click Play button)
   - Click the keypad buttons to test
   - Move objects near ultrasonic sensors

### For Hardware Build

1. **Wire the circuit:**

   - Follow: [docs/hardware/wiring.md](docs/hardware/wiring.md)
   - See: [docs/hardware/schematic.png](docs/hardware/schematic.png)

2. **Program the PIC:**

   - Connect PICkit3 programmer
   - Load `build/Smart_Garage.hex`
   - Program the chip

3. **Test the system:**
   - Follow: [tests/test_scenarios.md](tests/test_scenarios.md)

---

## 🎮 How to Use

### Entry Mode (Car Arriving)

1. Drive car within 25cm of garage door
2. LCD displays: **"WELCOME"**
3. LCD prompts: **"Enter Password:"**
4. Type **1234** on keypad (or your custom password)
5. LCD shows: **"Correct!"**
6. Door opens automatically
7. Drive into garage
8. Door closes after you're inside

### Exit Mode (Leaving Garage)

1. Press the **EXIT BUTTON** inside garage
2. LCD displays: **"Exit Request"**
3. Door opens (no password needed from inside)
4. Drive out of garage
5. Door closes automatically when path is clear

### Security Features

- ❌ **Wrong Password**: After 3 wrong attempts, system locks for 60 seconds
- 🛡️ **Obstacle Detection**: Door won't close if object is in the way
- ⏱️ **Timeout**: Door auto-closes after 10 seconds if no car enters/exits

---

## 🔧 Technical Details

### Pin Configuration

PIC16F877A Connections:

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

### System Specifications

- **Clock Speed**: 4 MHz (crystal oscillator)
- **Power Supply**: 5V DC
- **Detection Range**: 0-400 cm (ultrasonic sensors)
- **Door Operation**: 0° (closed) to 90° (open)
- **Password Length**: 4 digits
- **Max Attempts**: 3 (then 60s lockout)

---

## 📖 Documentation

| Document                                       | Description                  |
| ---------------------------------------------- | ---------------------------- |
| [Hardware Guide](docs/hardware/wiring.md)      | Complete wiring instructions |
| [Software Docs](docs/software/architecture.md) | Code structure explanation   |
| [User Manual](docs/user_manual.md)             | How to operate the system    |
| [Test Guide](tests/test_scenarios.md)          | Testing procedures           |

---

## 🐛 Troubleshooting

| Problem                      | Solution                                 |
| ---------------------------- | ---------------------------------------- |
| Door doesn't move            | Check servo connection to RC4 pin        |
| LCD shows garbage characters | Verify RD2-RD7 connections               |
| Keypad not responding        | Check PORTB wiring and pull-up resistors |
| Sensors read 0 distance      | Verify TRIG/ECHO pins and 5V power       |
| Password always wrong        | Check keypad matrix connections          |

**Still stuck?** Open an issue: [GitHub Issues](https://github.com/AnasMohamed7/Smart_Garage/issues)

---

## 🤝 Team Members

**Tanta University - Embedded Systems Project**

- **Anas Mohammad** - Team Lead
- **Ahmed Elwakil, Hassan Mohammad, Abdulrahman Abo Mostafa** - Hardware Design
- **Ahmed Bahnasy, Anas Mohammad, Mostafa Moheb** - Software Development
- **Ahmed M. Fayad** - Testing & Documentation

---

## 📄 License

This project is licensed under the MIT License - see LICENSE file for details.

---

## 📧 Contact

**Repository**: https://github.com/AnasMohamed7/Smart_Garage  
**Issues**: https://github.com/AnasMohamed7/Smart_Garage/issues

---

<div align="center">
  Made with ❤️ by Tanta University Engineering Students (Computer Engineering Department)
</div>
