
_Test_LCD:

;MyProject.c,21 :: 		void Test_LCD() {
;MyProject.c,22 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,23 :: 		LCD_OUT(1, 1, "Test 1 sec");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,24 :: 		Delay_MS(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Test_LCD0:
	DECFSZ     R13+0, 1
	GOTO       L_Test_LCD0
	DECFSZ     R12+0, 1
	GOTO       L_Test_LCD0
	DECFSZ     R11+0, 1
	GOTO       L_Test_LCD0
	NOP
	NOP
;MyProject.c,25 :: 		}
L_end_Test_LCD:
	RETURN
; end of _Test_LCD

_Test_Keypad:

;MyProject.c,28 :: 		void Test_Keypad() {
;MyProject.c,29 :: 		char key = 0;
	CLRF       Test_Keypad_key_L0+0
;MyProject.c,31 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,33 :: 		while(1) {
L_Test_Keypad1:
;MyProject.c,35 :: 		key = keypad_key_click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      Test_Keypad_key_L0+0
;MyProject.c,37 :: 		if(key != 0){
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad3
;MyProject.c,39 :: 		switch(key){
	GOTO       L_Test_Keypad4
;MyProject.c,40 :: 		case 1: key = '1'; break;
L_Test_Keypad6:
	MOVLW      49
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,41 :: 		case 2: key = '2'; break;
L_Test_Keypad7:
	MOVLW      50
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,42 :: 		case 3: key = '3'; break;
L_Test_Keypad8:
	MOVLW      51
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,43 :: 		case 5: key = '4'; break;
L_Test_Keypad9:
	MOVLW      52
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,44 :: 		case 6: key = '5'; break;
L_Test_Keypad10:
	MOVLW      53
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,45 :: 		case 7: key = '6'; break;
L_Test_Keypad11:
	MOVLW      54
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,46 :: 		case 9: key = '7'; break;
L_Test_Keypad12:
	MOVLW      55
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,47 :: 		case 10: key = '8'; break;
L_Test_Keypad13:
	MOVLW      56
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,48 :: 		case 11: key = '9'; break;
L_Test_Keypad14:
	MOVLW      57
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,49 :: 		case 13: key = '*'; break;
L_Test_Keypad15:
	MOVLW      42
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,50 :: 		case 14: key = '0'; break;
L_Test_Keypad16:
	MOVLW      48
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,51 :: 		case 15: key = '#'; break;
L_Test_Keypad17:
	MOVLW      35
	MOVWF      Test_Keypad_key_L0+0
	GOTO       L_Test_Keypad5
;MyProject.c,52 :: 		}
L_Test_Keypad4:
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad6
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad7
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad8
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad9
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad10
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad11
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad12
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad13
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad14
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad15
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad16
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad17
L_Test_Keypad5:
;MyProject.c,54 :: 		if(key == '*' || key == '#')
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      42
	BTFSC      STATUS+0, 2
	GOTO       L__Test_Keypad22
	MOVF       Test_Keypad_key_L0+0, 0
	XORLW      35
	BTFSC      STATUS+0, 2
	GOTO       L__Test_Keypad22
	GOTO       L_Test_Keypad20
L__Test_Keypad22:
;MyProject.c,55 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	GOTO       L_Test_Keypad21
L_Test_Keypad20:
;MyProject.c,57 :: 		LCD_CHR_CP(key);
	MOVF       Test_Keypad_key_L0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
L_Test_Keypad21:
;MyProject.c,58 :: 		}
L_Test_Keypad3:
;MyProject.c,59 :: 		}
	GOTO       L_Test_Keypad1
;MyProject.c,60 :: 		}
L_end_Test_Keypad:
	RETURN
; end of _Test_Keypad

_main:

;MyProject.c,62 :: 		void main() {
;MyProject.c,64 :: 		LCD_INIT();
	CALL       _Lcd_Init+0
;MyProject.c,65 :: 		KEYPAD_INIT();
	CALL       _Keypad_Init+0
;MyProject.c,67 :: 		Test_LCD();
	CALL       _Test_LCD+0
;MyProject.c,68 :: 		Test_Keypad();
	CALL       _Test_Keypad+0
;MyProject.c,69 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,71 :: 		void interrupt(){
;MyProject.c,77 :: 		}
L_end_interrupt:
L__interrupt27:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
