Skip to content
Navigation Menu
Ahmed-M-Fayad
REFsYard

Type / to search
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
REFsYard
/
README.md
in
main

Edit

Preview
Indent mode

Spaces
Indent size

2
Line wrap mode

Soft wrap
Editing README.md file contents
Selection deleted
361
362
363
364
365
366
367
368
369
370
371
372
373
374
375
376
377
378
379
380
381
382
383
384
385
386
387
388
389
390
391
392
393
394
395
396
397
398
399
400
401
402
403
404
405
406
407
408
409
410
411
412
413
414
415
416
417
418
419
420
421
422
423
424
425
426
427
428
429
430
431
432
433
434
435

**Non-Working Keys**: **************\_**************

---

## Test Case 12: Power Cycle Recovery

### TC-012

**Objective**: Verify system initializes correctly after power loss

**Test Steps**:

1. Operate system normally
2. Leave door in OPEN position
3. Remove power
4. Wait 10 seconds
5. Restore power
6. Observe initialization
7. Test normal operation

**Expected Results**:

- Step 6: LCD initializes (may show garbage briefly)
- Step 6: System goes to IDLE state
- Step 6: Door position depends on servo (may drift)
- Step 7: System operates normally regardless of door position

**Pass Criteria**: Clean initialization, no errors

**Status**: [ ] Pass [ ] Fail

---

## Test Summary Template

| TC# | Test Name          | Status | Notes |
| --- | ------------------ | ------ | ----- |
| 001 | Normal Entry       | [ ]    |       |
| 002 | Wrong Password     | [ ]    |       |
| 003 | Lockout            | [ ]    |       |
| 004 | Exit No Password   | [ ]    |       |
| 005 | Obstacle Detection | [ ]    |       |
| 006 | Entry Timeout      | [ ]    |       |
| 007 | Sensor Failure     | [ ]    |       |
| 008 | LCD Messages       | [ ]    |       |
| 009 | LED Indicators     | [ ]    |       |
| 010 | Servo Smooth       | [ ]    |       |
| 011 | Keypad             | [ ]    |       |
| 012 | Power Cycle        | [ ]    |       |

**Pass Rate**: **\_** / 12 (\_\_\_%)

**Critical Issues**: ****************\_\_\_****************

**Tested By**: ******\_\_****** **Date**: ****\_\_****

---

## Regression Testing Checklist

**After any code changes, verify:**

- [ ] TC-001 (Basic entry still works)
- [ ] TC-005 (Safety features still work)
- [ ] TC-009 (LEDs still correct)
- [ ] TC-011 (Keypad still responsive)

---

## Performance Metrics

| Metric              | Target     | Actual   | Pass? |
| ------------------- | ---------- | -------- | ----- |
| Entry cycle time    | < 30s      | \_\_\_s  | [ ]   |
| Exit cycle time     | < 20s      | \_\_\_s  | [ ]   |
| Lockout duration    | 60s ± 2s   | \_\_\_s  | [ ]   |
| Timeout duration    | 10s ± 1s   | \_\_\_s  | [ ]   |
| Sensor range        | 2-400cm    | \_\_\_cm | [ ]   |
| Detection threshold | 25cm ± 2cm | \_\_\_cm | [ ]   |

Use Control + Shift + m to toggle the tab key moving focus. Alternatively, use esc then tab to move to the next interactive element on the page.
No file chosen
Attach files by dragging & dropping, selecting or pasting them.
