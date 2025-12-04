
_getDistance1:

;MyProject.c,36 :: 		unsigned int getDistance1(){
;MyProject.c,37 :: 		unsigned int t = 0;
	CLRF       getDistance1_t_L0+0
	CLRF       getDistance1_t_L0+1
;MyProject.c,39 :: 		TRIG = 1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,40 :: 		Delay_us(10);
	MOVLW      6
	MOVWF      R13+0
L_getDistance10:
	DECFSZ     R13+0, 1
	GOTO       L_getDistance10
	NOP
;MyProject.c,41 :: 		TRIG = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,43 :: 		while(!ECHO){
L_getDistance11:
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_getDistance12
;MyProject.c,44 :: 		if(t++ > 30000) return 0;
	MOVF       getDistance1_t_L0+0, 0
	MOVWF      R1+0
	MOVF       getDistance1_t_L0+1, 0
	MOVWF      R1+1
	INCF       getDistance1_t_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       getDistance1_t_L0+1, 1
	MOVF       R1+1, 0
	SUBLW      117
	BTFSS      STATUS+0, 2
	GOTO       L__getDistance133
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance133:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance13
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_getDistance1
L_getDistance13:
;MyProject.c,45 :: 		Delay_us(1);
	NOP
	NOP
;MyProject.c,46 :: 		}
	GOTO       L_getDistance11
L_getDistance12:
;MyProject.c,48 :: 		t = 0;
	CLRF       getDistance1_t_L0+0
	CLRF       getDistance1_t_L0+1
;MyProject.c,49 :: 		while(ECHO){
L_getDistance14:
	BTFSS      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_getDistance15
;MyProject.c,50 :: 		if(t++ > 30000) break;
	MOVF       getDistance1_t_L0+0, 0
	MOVWF      R1+0
	MOVF       getDistance1_t_L0+1, 0
	MOVWF      R1+1
	INCF       getDistance1_t_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       getDistance1_t_L0+1, 1
	MOVF       R1+1, 0
	SUBLW      117
	BTFSS      STATUS+0, 2
	GOTO       L__getDistance134
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance134:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance16
	GOTO       L_getDistance15
L_getDistance16:
;MyProject.c,51 :: 		Delay_us(1);
	NOP
	NOP
;MyProject.c,52 :: 		}
	GOTO       L_getDistance14
L_getDistance15:
;MyProject.c,54 :: 		return (t * 0.0343) / 2;
	MOVF       getDistance1_t_L0+0, 0
	MOVWF      R0+0
	MOVF       getDistance1_t_L0+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVLW      40
	MOVWF      R4+0
	MOVLW      126
	MOVWF      R4+1
	MOVLW      12
	MOVWF      R4+2
	MOVLW      122
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Word+0
;MyProject.c,55 :: 		}
L_end_getDistance1:
	RETURN
; end of _getDistance1

_getDistance2:

;MyProject.c,58 :: 		unsigned int getDistance2(){
;MyProject.c,59 :: 		unsigned int t = 0;
	CLRF       getDistance2_t_L0+0
	CLRF       getDistance2_t_L0+1
;MyProject.c,61 :: 		TRIG2 = 1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,62 :: 		Delay_us(10);
	MOVLW      6
	MOVWF      R13+0
L_getDistance27:
	DECFSZ     R13+0, 1
	GOTO       L_getDistance27
	NOP
;MyProject.c,63 :: 		TRIG2 = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,65 :: 		while(!ECHO2){
L_getDistance28:
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_getDistance29
;MyProject.c,66 :: 		if(t++ > 30000) return 0;
	MOVF       getDistance2_t_L0+0, 0
	MOVWF      R1+0
	MOVF       getDistance2_t_L0+1, 0
	MOVWF      R1+1
	INCF       getDistance2_t_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       getDistance2_t_L0+1, 1
	MOVF       R1+1, 0
	SUBLW      117
	BTFSS      STATUS+0, 2
	GOTO       L__getDistance236
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance236:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance210
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_getDistance2
L_getDistance210:
;MyProject.c,67 :: 		Delay_us(1);
	NOP
	NOP
;MyProject.c,68 :: 		}
	GOTO       L_getDistance28
L_getDistance29:
;MyProject.c,70 :: 		t = 0;
	CLRF       getDistance2_t_L0+0
	CLRF       getDistance2_t_L0+1
;MyProject.c,71 :: 		while(ECHO2){
L_getDistance211:
	BTFSS      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_getDistance212
;MyProject.c,72 :: 		if(t++ > 30000) break;
	MOVF       getDistance2_t_L0+0, 0
	MOVWF      R1+0
	MOVF       getDistance2_t_L0+1, 0
	MOVWF      R1+1
	INCF       getDistance2_t_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       getDistance2_t_L0+1, 1
	MOVF       R1+1, 0
	SUBLW      117
	BTFSS      STATUS+0, 2
	GOTO       L__getDistance237
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance237:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance213
	GOTO       L_getDistance212
L_getDistance213:
;MyProject.c,73 :: 		Delay_us(1);
	NOP
	NOP
;MyProject.c,74 :: 		}
	GOTO       L_getDistance211
L_getDistance212:
;MyProject.c,76 :: 		return (t * 0.0343) / 2;
	MOVF       getDistance2_t_L0+0, 0
	MOVWF      R0+0
	MOVF       getDistance2_t_L0+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVLW      40
	MOVWF      R4+0
	MOVLW      126
	MOVWF      R4+1
	MOVLW      12
	MOVWF      R4+2
	MOVLW      122
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Word+0
;MyProject.c,77 :: 		}
L_end_getDistance2:
	RETURN
; end of _getDistance2

_Servo_SetAngle:

;MyProject.c,80 :: 		void Servo_SetAngle(unsigned int angle){
;MyProject.c,81 :: 		unsigned int pulse = 500 + (angle * 11);
	MOVF       FARG_Servo_SetAngle_angle+0, 0
	MOVWF      R0+0
	MOVF       FARG_Servo_SetAngle_angle+1, 0
	MOVWF      R0+1
	MOVLW      11
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	ADDLW      244
	MOVWF      Servo_SetAngle_pulse_L0+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      Servo_SetAngle_pulse_L0+1
;MyProject.c,84 :: 		SERVO = 1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;MyProject.c,85 :: 		for(i=0; i < pulse; i++) Delay_us(1);
	CLRF       Servo_SetAngle_i_L0+0
	CLRF       Servo_SetAngle_i_L0+1
L_Servo_SetAngle14:
	MOVF       Servo_SetAngle_pulse_L0+1, 0
	SUBWF      Servo_SetAngle_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Servo_SetAngle39
	MOVF       Servo_SetAngle_pulse_L0+0, 0
	SUBWF      Servo_SetAngle_i_L0+0, 0
L__Servo_SetAngle39:
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_SetAngle15
	NOP
	NOP
	INCF       Servo_SetAngle_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Servo_SetAngle_i_L0+1, 1
	GOTO       L_Servo_SetAngle14
L_Servo_SetAngle15:
;MyProject.c,86 :: 		SERVO = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;MyProject.c,87 :: 		for(i=0; i < (20000 - pulse); i++) Delay_us(1);
	CLRF       Servo_SetAngle_i_L0+0
	CLRF       Servo_SetAngle_i_L0+1
L_Servo_SetAngle17:
	MOVF       Servo_SetAngle_pulse_L0+0, 0
	SUBLW      32
	MOVWF      R1+0
	MOVF       Servo_SetAngle_pulse_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      78
	MOVWF      R1+1
	MOVF       R1+1, 0
	SUBWF      Servo_SetAngle_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Servo_SetAngle40
	MOVF       R1+0, 0
	SUBWF      Servo_SetAngle_i_L0+0, 0
L__Servo_SetAngle40:
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_SetAngle18
	NOP
	NOP
	INCF       Servo_SetAngle_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Servo_SetAngle_i_L0+1, 1
	GOTO       L_Servo_SetAngle17
L_Servo_SetAngle18:
;MyProject.c,88 :: 		}
L_end_Servo_SetAngle:
	RETURN
; end of _Servo_SetAngle

_Test_Servo:

;MyProject.c,91 :: 		void Test_Servo(){
;MyProject.c,93 :: 		for(i=0;i<40;i++) Servo_SetAngle(90);
	CLRF       Test_Servo_i_L0+0
	CLRF       Test_Servo_i_L0+1
L_Test_Servo20:
	MOVLW      128
	XORWF      Test_Servo_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Test_Servo42
	MOVLW      40
	SUBWF      Test_Servo_i_L0+0, 0
L__Test_Servo42:
	BTFSC      STATUS+0, 0
	GOTO       L_Test_Servo21
	MOVLW      90
	MOVWF      FARG_Servo_SetAngle_angle+0
	MOVLW      0
	MOVWF      FARG_Servo_SetAngle_angle+1
	CALL       _Servo_SetAngle+0
	INCF       Test_Servo_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Test_Servo_i_L0+1, 1
	GOTO       L_Test_Servo20
L_Test_Servo21:
;MyProject.c,94 :: 		}
L_end_Test_Servo:
	RETURN
; end of _Test_Servo

_Test_LCD:

;MyProject.c,97 :: 		void Test_LCD(){
;MyProject.c,98 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,99 :: 		LCD_Out(1,1,"LCD Working OK");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,100 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Test_LCD23:
	DECFSZ     R13+0, 1
	GOTO       L_Test_LCD23
	DECFSZ     R12+0, 1
	GOTO       L_Test_LCD23
	DECFSZ     R11+0, 1
	GOTO       L_Test_LCD23
	NOP
	NOP
;MyProject.c,101 :: 		}
L_end_Test_LCD:
	RETURN
; end of _Test_LCD

_Test_Keypad:

;MyProject.c,104 :: 		void Test_Keypad(){
;MyProject.c,106 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,107 :: 		LCD_Out(1,1,"Press a Key:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,109 :: 		while(1){
L_Test_Keypad24:
;MyProject.c,110 :: 		key = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      Test_Keypad_key_L0+0
;MyProject.c,111 :: 		if(key){
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Test_Keypad26
;MyProject.c,112 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,113 :: 		LCD_Out(1,1,"You Pressed:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,114 :: 		LCD_Chr(2,1, key + 48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      Test_Keypad_key_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,115 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Test_Keypad27:
	DECFSZ     R13+0, 1
	GOTO       L_Test_Keypad27
	DECFSZ     R12+0, 1
	GOTO       L_Test_Keypad27
	DECFSZ     R11+0, 1
	GOTO       L_Test_Keypad27
	NOP
	NOP
;MyProject.c,116 :: 		break;
	GOTO       L_Test_Keypad25
;MyProject.c,117 :: 		}
L_Test_Keypad26:
;MyProject.c,118 :: 		}
	GOTO       L_Test_Keypad24
L_Test_Keypad25:
;MyProject.c,119 :: 		}
L_end_Test_Keypad:
	RETURN
; end of _Test_Keypad

_Test_Ultrasonic:

;MyProject.c,122 :: 		void Test_Ultrasonic(){
;MyProject.c,126 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,127 :: 		LCD_Out(1,1,"Testing Sensors");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,129 :: 		Delay_ms(800);
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_Test_Ultrasonic28:
	DECFSZ     R13+0, 1
	GOTO       L_Test_Ultrasonic28
	DECFSZ     R12+0, 1
	GOTO       L_Test_Ultrasonic28
	DECFSZ     R11+0, 1
	GOTO       L_Test_Ultrasonic28
	NOP
;MyProject.c,131 :: 		d1 = getDistance1();
	CALL       _getDistance1+0
	MOVF       R0+0, 0
	MOVWF      Test_Ultrasonic_d1_L0+0
	MOVF       R0+1, 0
	MOVWF      Test_Ultrasonic_d1_L0+1
;MyProject.c,132 :: 		d2 = getDistance2();
	CALL       _getDistance2+0
	MOVF       R0+0, 0
	MOVWF      Test_Ultrasonic_d2_L0+0
	MOVF       R0+1, 0
	MOVWF      Test_Ultrasonic_d2_L0+1
;MyProject.c,134 :: 		WordToStr(d1, text);
	MOVF       Test_Ultrasonic_d1_L0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       Test_Ultrasonic_d1_L0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      Test_Ultrasonic_text_L0+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,135 :: 		LCD_Out(1,1,"S1:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,136 :: 		LCD_Out(1,4,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Test_Ultrasonic_text_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,138 :: 		WordToStr(d2, text);
	MOVF       Test_Ultrasonic_d2_L0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       Test_Ultrasonic_d2_L0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      Test_Ultrasonic_text_L0+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,139 :: 		LCD_Out(2,1,"S2:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,140 :: 		LCD_Out(2,4,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Test_Ultrasonic_text_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,142 :: 		Delay_ms(1200);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      45
	MOVWF      R12+0
	MOVLW      215
	MOVWF      R13+0
L_Test_Ultrasonic29:
	DECFSZ     R13+0, 1
	GOTO       L_Test_Ultrasonic29
	DECFSZ     R12+0, 1
	GOTO       L_Test_Ultrasonic29
	DECFSZ     R11+0, 1
	GOTO       L_Test_Ultrasonic29
	NOP
	NOP
;MyProject.c,143 :: 		}
L_end_Test_Ultrasonic:
	RETURN
; end of _Test_Ultrasonic

_main:

;MyProject.c,146 :: 		void main(){
;MyProject.c,149 :: 		TRIG_Direction  = 0;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;MyProject.c,150 :: 		ECHO_Direction  = 1;
	BSF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;MyProject.c,151 :: 		TRIG2_Direction = 0;
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;MyProject.c,152 :: 		ECHO2_Direction = 1;
	BSF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;MyProject.c,153 :: 		SERVO_Direction = 0;
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;MyProject.c,155 :: 		LCD_Init();
	CALL       _Lcd_Init+0
;MyProject.c,156 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;MyProject.c,158 :: 		Test_LCD();        // 1- ??? ??????
	CALL       _Test_LCD+0
;MyProject.c,159 :: 		Test_Keypad();     // 2- ??? ???????
	CALL       _Test_Keypad+0
;MyProject.c,160 :: 		Test_Ultrasonic(); // 3- ??? ????????
	CALL       _Test_Ultrasonic+0
;MyProject.c,161 :: 		Test_Servo();      // 4- ??? ???????
	CALL       _Test_Servo+0
;MyProject.c,164 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,165 :: 		LCD_Out(1,1,"All Parts OK ?");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,167 :: 		while(1);
L_main30:
	GOTO       L_main30
;MyProject.c,168 :: 		}
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

;MyProject.c,171 :: 		void interrupt(){
;MyProject.c,172 :: 		}
L_end_interrupt:
L__interrupt48:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
