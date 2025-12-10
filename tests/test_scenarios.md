# Test Scenarios - Smart Garage System

## Test Environment

### Simulation
- **Tool**: Proteus 8.9
- **Project**: `simulation/proteus/Smart_Garage.pdsprj`
- **Firmware**: `build/Smart_Garage.hex`

### Hardware
- **Board**: PIC16F877A on breadboard
- **Power**: 5V DC supply
- **Programmer**: PICkit3

---

## Test Case 1: Normal Entry with Correct Password

### TC-001
**Objective**: Verify complete entry sequence with valid password

**Preconditions**:
- System powered and initialized
- Door in closed position (0°)
- Red LED ON, Green LED OFF
- LCD OFF

**Test Steps**:
1. Place object 20cm from outer sensor (US1)
2. Wait for LCD to turn on
3. Observe LCD message
4. Enter "1234" on keypad (or configured password)
5. Observe door movement
6. Move object past inner sensor (US2)
7. Clear outer sensor (US1)
8. Observe door closing

**Expected Results**:
- Step 2: LCD displays "WELCOME"
- Step 3: LCD prompts "Enter Password:"
- Step 4: LCD shows "****" as typing
- Step 4: After 4th digit, LCD shows "Correct!"
- Step 5: LCD shows "Opening Door..."
- Step 5: Servo rotates from 0° to 90°
- Step 5: Green LED ON, Red LED OFF
- Step 7: LCD shows "Closing Door..."
- Step 8: Servo rotates from 90° to 0°
- Step 8: Red LED ON, Green LED OFF
- Step 8: LCD turns OFF

**Pass Criteria**: All expected results occur in sequence

**Status**: [ ] Pass  [ ] Fail

**Notes**: ___________________________________________

---

## Test Case 2: Wrong Password - Single Attempt

### TC-002
**Objective**: Verify system handles incorrect password

**Preconditions**:
- System in IDLE state
- Door closed

**Test Steps**:
1. Trigger outer sensor (object at 20cm)
2. Wait for password prompt
3. Enter "0000" (wrong password)
4. Observe system response
5. Enter correct password "1234"
6. Verify door opens

**Expected Results**:
- Step 3: LCD shows "****" while typing
- Step 4: LCD shows "Wrong Password"
- Step 4: Red LED blinks briefly
- Step 4: System returns to password prompt
- Step 5: Door operates normally

**Pass Criteria**: System allows retry after single wrong attempt

**Status**: [ ] Pass  [ ] Fail

---

## Test Case 3: Lockout After 3 Wrong Attempts

### TC-003
**Objective**: Verify 60-second lockout after 3 failures

**Preconditions**:
- System in IDLE state

**Test Steps**:
1. Trigger entry sequence
2. Enter "1111" (wrong)
3. Enter "2222" (wrong)
4. Enter "3333" (wrong - 3rd attempt)
5. Observe lockout behavior
6. Wait for countdown to complete
7. Enter correct password

**Expected Results**:
- Steps 2-4: Each shows "Wrong Password"
- Step 4: LCD shows "Wait: 60s"
- Step 5: Counter decrements: 60→59→58...→01→00
- Step 5: Takes approximately 60 seconds total
- Step 6: System returns to password prompt
- Step 7: Door operates normally

**Pass Criteria**: Lockout enforced, counter accurate

**Status**: [ ] Pass  [ ] Fail

**Actual Lockout Time**: _______s (should be ~60s)

---

## Test Case 4: Exit Without Password

### TC-004
**Objective**: Verify exit button works without password

**Preconditions**:
- System in IDLE state
- Door closed
- No object near sensors

**Test Steps**:
1. Press EXIT button (RE2)
2. Observe LCD and door
3. Place object at outer sensor briefly
4. Remove object (clear both sensors)
5. Observe door closing

**Expected Results**:
- Step 1: LCD displays "Exit Request"
- Step 2: LCD shows "Opening Door..."
- Step 2: Door opens to 90° (no password asked)
- Step 2: Green LED ON
- Step 5: LCD shows "Closing Door..."
- Step 5: Door closes to 0°
- Step 5: Red LED ON

**Pass Criteria**: Door opens without password prompt

**Status**: [ ] Pass  [ ] Fail

---

## Test Case 5: Obstacle Detection During Closing

### TC-005
**Objective**: Verify door won't close if object in path

**Preconditions**:
- Door in OPEN position (90°)
- System waiting to close

**Test Steps**:
1. Initiate exit sequence (button press)
2. Door opens fully
3. Place object 10cm from inner sensor (US2)
4. Keep object there (simulate blocked path)
5. Wait 30 seconds
6. Remove object
7. Observe door behavior

**Expected Results**:
- Step 3: Door remains OPEN (does not close)
- Step 3: System waits
- Step 5: Door still OPEN (not forced)
- Step 7: Door closes only after object removed
- Step 7: Door closes smoothly to 0°

**Pass Criteria**: Door never attempts to close while blocked

**Status**: [ ] Pass  [ ] Fail

**Notes**: Critical safety feature!

---

## Test Case 6: Entry Timeout

### TC-006
**Objective**: Verify door closes if car doesn't enter

**Preconditions**:
- System in IDLE state

**Test Steps**:
1. Trigger entry (object at outer sensor)
2. Enter correct password
3. Door opens
4. Do NOT move object past inner sensor
5. Wait 15 seconds (beyond 10s timeout)
6. Observe door behavior

**Expected Results**:
- Step 3: Door opens normally
- Step 4: System waits for car to enter
- Step 5: After ~10 seconds, door closes automatically
- Step 5: LCD shows "Closing Door..."
- Step 5: Door returns to 0°

**Pass Criteria**: Timeout occurs at ~10 seconds

**Status**: [ ] Pass  [ ] Fail

**Actual Timeout**: _______s

---

## Test Case 7: Sensor Failure - Timeout

### TC-007
**Objective**: Verify system handles sensor disconnection

**Preconditions**:
- System initialized

**Test Steps**:
1. Disconnect ECHO wire from outer sensor (US1)
2. Trigger entry by pressing keypad '1'
3. Observe system behavior
4. Reconnect sensor
5. Test normal operation

**Expected Results**:
- Step 2: System may not detect distance properly
- Step 3: getDistance1() returns 0 (timeout)
- Step 3: System treats as "no object"
- Step 5: Normal operation resumes

**Pass Criteria**: No system crash, graceful handling

**Status**: [ ] Pass  [ ] Fail

---

## Test Case 8: LCD Display Messages

### TC-008
**Objective**: Verify all LCD messages display correctly

**Test Messages to Check**:
1. "WELCOME"
2. "Enter Password:"
3. "****" (password masking)
4. "Correct!"
5. "Wrong Password"
6. "Wait: XXs" (lockout counter)
7. "Opening Door..."
8. "Closing Door..."
9. "Exit Request"

**Test Steps**:
For each message:
1. Trigger scenario that displays message
2. Read LCD carefully
3. Check spelling, spacing, position

**Expected Results**:
- All messages spelled correctly
- Text centered or left-aligned appropriately
- No garbage characters
- Clear and readable

**Pass Criteria**: All 9 messages verified correct

**Status**: [ ] Pass  [ ] Fail

**Issues Found**: _________________________________

---

## Test Case 9: LED Indicators

### TC-009
**Objective**: Verify LED states match door position

**Test Steps**:
1. System at rest (door closed)
2. Open door (any method)
3. Close door
4. Repeat 5 times

**Expected LED States**:
- Door Closed (0°): RED ON, GREEN OFF
- Door Open (90°): RED OFF, GREEN ON
- No state where both ON or both OFF

**Pass Criteria**: LED states always correct

**Status**: [ ] Pass  [ ] Fail

**Observations**: _________________________________

---

## Test Case 10: Servo Movement Smoothness

### TC-010
**Objective**: Verify servo operates smoothly

**Test Steps**:
1. Observe door opening 10 times
2. Observe door closing 10 times
3. Listen for unusual sounds
4. Check for jerky movements

**Expected Results**:
- Smooth rotation (no stuttering)
- Consistent speed each time
- Reaches full 0° and 90° positions
- No grinding or clicking sounds
- Movement takes ~5 seconds

**Pass Criteria**: All movements smooth

**Status**: [ ] Pass  [ ] Fail

**Issues**: _______________________________________

---

## Test Case 11: Keypad Responsiveness

### TC-011
**Objective**: Verify all keypad buttons work

**Test Steps**:
1. Trigger password prompt
2. Press each key: 0-9, A-D, *, #
3. Observe LCD response for each key

**Expected Key Mapping** (see assets/keypad_mapping.png):
