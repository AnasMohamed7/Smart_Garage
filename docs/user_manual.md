# Smart Garage - User Manual

## Safety Warnings ⚠️

- Never stand directly under the door while it's moving
- Keep hands and objects clear of moving parts
- Door will stop if obstacle detected, but do not rely on this as primary safety
- Children should be supervised near the system

---

## Installation

### Step 1: Physical Setup

1. Mount ultrasonic sensors:
   - **Outer sensor**: 25cm above ground, facing outward
   - **Inner sensor**: 25cm above ground, facing inward
2. Install LCD and keypad at convenient height (chest level)
3. Mount servo motor on door mechanism
4. Install LEDs visible from both inside and outside
5. Place exit button inside garage at convenient location

### Step 2: Power Connection

1. Connect 5V power supply to PIC circuit
2. Verify all components light up briefly on power-on
3. LCD should show initialization

### Step 3: Password Setup (Optional)

To change from default password "1234":

1. Open `src/MyProject.c` in text editor
2. Find line: `char password[5] = "1234";`
3. Change "1234" to your 4-digit code
4. Recompile and reprogram PIC

---

## Daily Operation

### Opening Garage (Entry)

**What You Do:**

1. Drive car toward garage door
2. Stop when LCD lights up

**What System Does:**

1. Detects car at 25cm
2. LCD shows: **"WELCOME"**
3. LCD prompts: **"Enter Password:"**

**What You Do:** 4. Type your 4-digit password on keypad 5. LCD shows **\*\*\*\*** as you type

**What System Does:** 6. If correct: LCD shows **"Correct!"** 7. LCD shows **"Opening Door..."** 8. Green LED turns ON 9. Door opens to 90°

**What You Do:** 10. Drive through when fully open 11. Clear both sensors

**What System Does:** 12. LCD shows **"Closing Door..."** 13. Door closes to 0° 14. Red LED turns ON 15. LCD turns off

**Time**: About 20-30 seconds total

### Leaving Garage (Exit)

**What You Do:**

1. Press **EXIT BUTTON** inside garage

**What System Does:** 2. LCD shows **"Exit Request"** 3. LCD shows **"Opening Door..."** 4. Green LED turns ON 5. Door opens to 90°

**What You Do:** 6. Drive out of garage 7. Clear both sensors

**What System Does:** 8. LCD shows **"Closing Door..."** 9. Door closes to 0° 10. Red LED turns ON 11. LCD turns off

**Note**: No password needed for exit (safety feature)

---

## Security Features

### Wrong Password Protection

**What Happens:**

- Enter wrong password: LCD shows **"Wrong Password"**
- Red LED flashes briefly
- Try again (up to 3 attempts)

**After 3 Wrong Attempts:**

- LCD shows: **"Wait: 60s"**
- System locks for 60 seconds
- Counter counts down on LCD
- After timeout, you can try again

**Tips:**

- Enter digits carefully
- LCD shows \* as you type (can't see actual numbers)
- If you forget password, reprogram PIC with new code

### Obstacle Safety

**Scenario**: Door is closing but object is in path

**What System Does:**

- Inner sensor detects object (< 15cm)
- Door STOPS closing
- Door remains open
- Waits for path to clear
- Closes only when safe

**Important**: This is backup safety - do not rely on this as primary protection!

### Timeout Protection

**Entry Mode:**

- Door opens for entry
- Waits 10 seconds for car to enter
- If no car detected, door closes automatically
- Prevents door staying open indefinitely

**Exit Mode:**

- Same 10-second timeout
- Ensures door doesn't stay open if you change your mind

---

## Troubleshooting

### "LCD shows nothing"

**Possible Causes:**

- No power to system
- LCD contrast not adjusted
- Loose wiring

**Solutions:**

1. Check 5V power supply connected
2. Adjust LCD contrast potentiometer (small screw on LCD)
3. Verify RD2-RD7 connections to PIC

---

### "Door opens but won't close"

**Possible Causes:**

- Object blocking inner sensor
- Car still too close
- Sensor malfunction

**Solutions:**

1. Clear area in front of inner sensor
2. Move car completely inside (past inner sensor)
3. Wait 5 seconds and try exit button to reset
4. If persists, check sensor connections

---

### "Keypad doesn't respond"

**Possible Causes:**

- Loose keypad connection
- Wrong keys being pressed
- System locked (after 3 wrong attempts)

**Solutions:**

1. Press keys firmly in center
2. Check if LCD shows **"Wait: XXs"** (locked out)
3. Wait for lockout to end
4. Verify keypad connections to PORTB

---

### "System says password wrong but I entered correctly"

**Possible Causes:**

- Keypad mapping issue
- Wrong password in system

**Solutions:**

1. Check keypad mapping: ![keypad](../../assets/keypad_mapping.png)
2. Verify password in code hasn't been changed
3. Try reprogramming with known password

---

### "Sensors read 0 distance always"

**Possible Causes:**

- No power to sensors
- Wrong TRIG/ECHO connections
- Sensor facing wrong direction

**Solutions:**

1. Verify sensors have 5V power
2. Check TRIG and ECHO pins not swapped
3. Ensure sensors face outward (not at walls)
4. Test sensors individually in Proteus first

---

### "Door moves but very slowly or jittery"

**Possible Causes:**

- Insufficient power to servo
- Mechanical resistance
- Servo PWM signal issue

**Solutions:**

1. Use separate 5V supply for servo (if possible)
2. Check door mechanism moves freely
3. Verify RC4 connection to servo signal wire
4. Try different servo motor

---

## Maintenance

### Daily

- Visual inspection of moving parts
- Check LED indicators work

### Weekly

- Clean ultrasonic sensor lenses (dust affects accuracy)
- Test password entry
- Test exit button
- Verify door opens/closes smoothly

### Monthly

- Check all wire connections
- Test emergency scenarios
- Verify obstacle detection works
- Update password if desired

### Yearly

- Replace batteries (if battery-powered)
- Service servo motor
- Check for corrosion on circuit board

---

## Emergency Procedures

### "Door won't open and I need to leave"

1. Press and hold EXIT button for 5 seconds
2. If still doesn't work: Power cycle system (turn off/on)
3. Last resort: Manual override (if you have one installed)

### "Door is stuck halfway"

1. DO NOT force it
2. Power cycle system
3. Remove any obstacles
4. Test with exit button

### "System completely unresponsive"

1. Check main power connection
2. Check PIC has program loaded
3. Verify all connections secure
4. Reprogram PIC if needed

---

## Specifications

| Parameter                  | Value      |
| -------------------------- | ---------- |
| Detection Range            | 2-400 cm   |
| Entry Detection Threshold  | 25 cm      |
| Safety Detection Threshold | 15 cm      |
| Door Opening Time          | ~5 seconds |
| Door Closing Time          | ~5 seconds |
| Password Length            | 4 digits   |
| Lockout Time               | 60 seconds |
| Timeout Period             | 10 seconds |
| Operating Voltage          | 5V DC      |
| Operating Temperature      | 0-50°C     |

---

## Support

**For Technical Issues:**

- Check troubleshooting section above
- Open issue: https://github.com/AnasMohamed7/Smart_Garage/issues
- Contact team: [your email]

**For Hardware Problems:**

- See: `docs/hardware/wiring.md`
- Check component connections

**For Software Updates:**

- Latest version: https://github.com/AnasMohamed7/Smart_Garage/releases
