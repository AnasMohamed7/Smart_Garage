
_getDistance1:

;MyProject.c,44 :: 		unsigned int getDistance1(){
;MyProject.c,45 :: 		unsigned int t = 0;
	CLRF       getDistance1_t_L0+0
	CLRF       getDistance1_t_L0+1
;MyProject.c,46 :: 		TRIG = 1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,47 :: 		Delay_us(10);
	MOVLW      6
	MOVWF      R13+0
L_getDistance10:
	DECFSZ     R13+0, 1
	GOTO       L_getDistance10
	NOP
;MyProject.c,48 :: 		TRIG = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,50 :: 		while(!ECHO){
L_getDistance11:
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_getDistance12
;MyProject.c,51 :: 		if(t++ > 30000) return 0;
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
	GOTO       L__getDistance172
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance172:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance13
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_getDistance1
L_getDistance13:
;MyProject.c,52 :: 		Delay_us(1);
	NOP
	NOP
;MyProject.c,53 :: 		}
	GOTO       L_getDistance11
L_getDistance12:
;MyProject.c,55 :: 		t = 0;
	CLRF       getDistance1_t_L0+0
	CLRF       getDistance1_t_L0+1
;MyProject.c,56 :: 		while(ECHO){
L_getDistance14:
	BTFSS      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_getDistance15
;MyProject.c,57 :: 		if(t++ > 30000) break;
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
	GOTO       L__getDistance173
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance173:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance16
	GOTO       L_getDistance15
L_getDistance16:
;MyProject.c,58 :: 		Delay_us(1);
	NOP
	NOP
;MyProject.c,59 :: 		}
	GOTO       L_getDistance14
L_getDistance15:
;MyProject.c,61 :: 		return (t * 0.0343) / 2;
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
;MyProject.c,62 :: 		}
L_end_getDistance1:
	RETURN
; end of _getDistance1

_getDistance2:

;MyProject.c,64 :: 		unsigned int getDistance2(){
;MyProject.c,65 :: 		unsigned int t = 0;
	CLRF       getDistance2_t_L0+0
	CLRF       getDistance2_t_L0+1
;MyProject.c,66 :: 		TRIG2 = 1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,67 :: 		Delay_us(10);
	MOVLW      6
	MOVWF      R13+0
L_getDistance27:
	DECFSZ     R13+0, 1
	GOTO       L_getDistance27
	NOP
;MyProject.c,68 :: 		TRIG2 = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,70 :: 		while(!ECHO2){
L_getDistance28:
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_getDistance29
;MyProject.c,71 :: 		if(t++ > 30000) return 0;
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
	GOTO       L__getDistance275
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance275:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance210
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_getDistance2
L_getDistance210:
;MyProject.c,72 :: 		Delay_us(1);
	NOP
	NOP
;MyProject.c,73 :: 		}
	GOTO       L_getDistance28
L_getDistance29:
;MyProject.c,75 :: 		t = 0;
	CLRF       getDistance2_t_L0+0
	CLRF       getDistance2_t_L0+1
;MyProject.c,76 :: 		while(ECHO2){
L_getDistance211:
	BTFSS      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_getDistance212
;MyProject.c,77 :: 		if(t++ > 30000) break;
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
	GOTO       L__getDistance276
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance276:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance213
	GOTO       L_getDistance212
L_getDistance213:
;MyProject.c,78 :: 		Delay_us(1);
	NOP
	NOP
;MyProject.c,79 :: 		}
	GOTO       L_getDistance211
L_getDistance212:
;MyProject.c,81 :: 		return (t * 0.0343) / 2;
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
;MyProject.c,82 :: 		}
L_end_getDistance2:
	RETURN
; end of _getDistance2

_UpdateGarageLEDs:

;MyProject.c,85 :: 		void UpdateGarageLEDs(unsigned int angle){
;MyProject.c,86 :: 		if(angle == 0){
	MOVLW      0
	XORWF      FARG_UpdateGarageLEDs_angle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UpdateGarageLEDs78
	MOVLW      0
	XORWF      FARG_UpdateGarageLEDs_angle+0, 0
L__UpdateGarageLEDs78:
	BTFSS      STATUS+0, 2
	GOTO       L_UpdateGarageLEDs14
;MyProject.c,87 :: 		LED_RED = 1;
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
;MyProject.c,88 :: 		LED_GREEN = 0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;MyProject.c,89 :: 		}
	GOTO       L_UpdateGarageLEDs15
L_UpdateGarageLEDs14:
;MyProject.c,90 :: 		else if(angle == 90){
	MOVLW      0
	XORWF      FARG_UpdateGarageLEDs_angle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UpdateGarageLEDs79
	MOVLW      90
	XORWF      FARG_UpdateGarageLEDs_angle+0, 0
L__UpdateGarageLEDs79:
	BTFSS      STATUS+0, 2
	GOTO       L_UpdateGarageLEDs16
;MyProject.c,91 :: 		LED_RED = 0;
	BCF        RA1_bit+0, BitPos(RA1_bit+0)
;MyProject.c,92 :: 		LED_GREEN = 1;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
;MyProject.c,93 :: 		}
L_UpdateGarageLEDs16:
L_UpdateGarageLEDs15:
;MyProject.c,94 :: 		}
L_end_UpdateGarageLEDs:
	RETURN
; end of _UpdateGarageLEDs

_Servo_SetAngle:

;MyProject.c,98 :: 		void Servo_SetAngle(unsigned int angle){
;MyProject.c,99 :: 		unsigned int pulse = 500 + (angle * 11);
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
;MyProject.c,102 :: 		SERVO = 1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;MyProject.c,103 :: 		for(i=0; i < pulse; i++) Delay_us(1);
	CLRF       Servo_SetAngle_i_L0+0
	CLRF       Servo_SetAngle_i_L0+1
L_Servo_SetAngle17:
	MOVF       Servo_SetAngle_pulse_L0+1, 0
	SUBWF      Servo_SetAngle_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Servo_SetAngle81
	MOVF       Servo_SetAngle_pulse_L0+0, 0
	SUBWF      Servo_SetAngle_i_L0+0, 0
L__Servo_SetAngle81:
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_SetAngle18
	NOP
	NOP
	INCF       Servo_SetAngle_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Servo_SetAngle_i_L0+1, 1
	GOTO       L_Servo_SetAngle17
L_Servo_SetAngle18:
;MyProject.c,104 :: 		SERVO = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;MyProject.c,105 :: 		for(i=0; i < (20000 - pulse); i++) Delay_us(1);
	CLRF       Servo_SetAngle_i_L0+0
	CLRF       Servo_SetAngle_i_L0+1
L_Servo_SetAngle20:
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
	GOTO       L__Servo_SetAngle82
	MOVF       R1+0, 0
	SUBWF      Servo_SetAngle_i_L0+0, 0
L__Servo_SetAngle82:
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_SetAngle21
	NOP
	NOP
	INCF       Servo_SetAngle_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Servo_SetAngle_i_L0+1, 1
	GOTO       L_Servo_SetAngle20
L_Servo_SetAngle21:
;MyProject.c,107 :: 		UpdateGarageLEDs(angle);
	MOVF       FARG_Servo_SetAngle_angle+0, 0
	MOVWF      FARG_UpdateGarageLEDs_angle+0
	MOVF       FARG_Servo_SetAngle_angle+1, 0
	MOVWF      FARG_UpdateGarageLEDs_angle+1
	CALL       _UpdateGarageLEDs+0
;MyProject.c,108 :: 		}
L_end_Servo_SetAngle:
	RETURN
; end of _Servo_SetAngle

_Turn_On_Servo:

;MyProject.c,111 :: 		void Turn_On_Servo(){
;MyProject.c,113 :: 		for(i=0;i<40;i++) Servo_SetAngle(90);
	CLRF       Turn_On_Servo_i_L0+0
	CLRF       Turn_On_Servo_i_L0+1
L_Turn_On_Servo23:
	MOVLW      128
	XORWF      Turn_On_Servo_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Turn_On_Servo84
	MOVLW      40
	SUBWF      Turn_On_Servo_i_L0+0, 0
L__Turn_On_Servo84:
	BTFSC      STATUS+0, 0
	GOTO       L_Turn_On_Servo24
	MOVLW      90
	MOVWF      FARG_Servo_SetAngle_angle+0
	MOVLW      0
	MOVWF      FARG_Servo_SetAngle_angle+1
	CALL       _Servo_SetAngle+0
	INCF       Turn_On_Servo_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Turn_On_Servo_i_L0+1, 1
	GOTO       L_Turn_On_Servo23
L_Turn_On_Servo24:
;MyProject.c,114 :: 		}
L_end_Turn_On_Servo:
	RETURN
; end of _Turn_On_Servo

_Turn_On_LCD:

;MyProject.c,117 :: 		void Turn_On_LCD(){
;MyProject.c,118 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,119 :: 		LCD_Out(1,1,"LCD Working OK");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,120 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Turn_On_LCD26:
	DECFSZ     R13+0, 1
	GOTO       L_Turn_On_LCD26
	DECFSZ     R12+0, 1
	GOTO       L_Turn_On_LCD26
	DECFSZ     R11+0, 1
	GOTO       L_Turn_On_LCD26
	NOP
	NOP
;MyProject.c,121 :: 		}
L_end_Turn_On_LCD:
	RETURN
; end of _Turn_On_LCD

_Turn_On_Keypad:

;MyProject.c,124 :: 		void Turn_On_Keypad(){
;MyProject.c,126 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,127 :: 		LCD_Out(1,1,"Press a Key:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,129 :: 		while(1){
L_Turn_On_Keypad27:
;MyProject.c,130 :: 		key = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      Turn_On_Keypad_key_L0+0
;MyProject.c,131 :: 		if(key){
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Turn_On_Keypad29
;MyProject.c,132 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,133 :: 		LCD_Out(1,1,"You Pressed:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,134 :: 		LCD_Chr(2,1, key + 48); // Display key value
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      Turn_On_Keypad_key_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,135 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Turn_On_Keypad30:
	DECFSZ     R13+0, 1
	GOTO       L_Turn_On_Keypad30
	DECFSZ     R12+0, 1
	GOTO       L_Turn_On_Keypad30
	DECFSZ     R11+0, 1
	GOTO       L_Turn_On_Keypad30
	NOP
	NOP
;MyProject.c,136 :: 		break;
	GOTO       L_Turn_On_Keypad28
;MyProject.c,137 :: 		}
L_Turn_On_Keypad29:
;MyProject.c,138 :: 		}
	GOTO       L_Turn_On_Keypad27
L_Turn_On_Keypad28:
;MyProject.c,139 :: 		}
L_end_Turn_On_Keypad:
	RETURN
; end of _Turn_On_Keypad

_Turn_On_Ultrasonic:

;MyProject.c,142 :: 		void Turn_On_Ultrasonic(){
;MyProject.c,146 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,147 :: 		LCD_Out(1,1,"Testing Sensors");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,149 :: 		Delay_ms(800);
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_Turn_On_Ultrasonic31:
	DECFSZ     R13+0, 1
	GOTO       L_Turn_On_Ultrasonic31
	DECFSZ     R12+0, 1
	GOTO       L_Turn_On_Ultrasonic31
	DECFSZ     R11+0, 1
	GOTO       L_Turn_On_Ultrasonic31
	NOP
;MyProject.c,151 :: 		d1 = getDistance1();     // Read sensor 1
	CALL       _getDistance1+0
	MOVF       R0+0, 0
	MOVWF      Turn_On_Ultrasonic_d1_L0+0
	MOVF       R0+1, 0
	MOVWF      Turn_On_Ultrasonic_d1_L0+1
;MyProject.c,152 :: 		d2 = getDistance2();   // Read sensor 2
	CALL       _getDistance2+0
	MOVF       R0+0, 0
	MOVWF      Turn_On_Ultrasonic_d2_L0+0
	MOVF       R0+1, 0
	MOVWF      Turn_On_Ultrasonic_d2_L0+1
;MyProject.c,154 :: 		WordToStr(d1, text);
	MOVF       Turn_On_Ultrasonic_d1_L0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       Turn_On_Ultrasonic_d1_L0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      Turn_On_Ultrasonic_text_L0+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,155 :: 		LCD_Out(1,1,"S1:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,156 :: 		LCD_Out(1,4,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Turn_On_Ultrasonic_text_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,158 :: 		WordToStr(d2, text);
	MOVF       Turn_On_Ultrasonic_d2_L0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       Turn_On_Ultrasonic_d2_L0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      Turn_On_Ultrasonic_text_L0+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,159 :: 		LCD_Out(2,1,"S2:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,160 :: 		LCD_Out(2,4,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Turn_On_Ultrasonic_text_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,162 :: 		Delay_ms(1200);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      45
	MOVWF      R12+0
	MOVLW      215
	MOVWF      R13+0
L_Turn_On_Ultrasonic32:
	DECFSZ     R13+0, 1
	GOTO       L_Turn_On_Ultrasonic32
	DECFSZ     R12+0, 1
	GOTO       L_Turn_On_Ultrasonic32
	DECFSZ     R11+0, 1
	GOTO       L_Turn_On_Ultrasonic32
	NOP
	NOP
;MyProject.c,163 :: 		}
L_end_Turn_On_Ultrasonic:
	RETURN
; end of _Turn_On_Ultrasonic

_Get_Key_Char:

;MyProject.c,166 :: 		char Get_Key_Char(char key){
;MyProject.c,167 :: 		switch(key){
	GOTO       L_Get_Key_Char33
;MyProject.c,168 :: 		case 1:  return '1';
L_Get_Key_Char35:
	MOVLW      49
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,169 :: 		case 2:  return '2';
L_Get_Key_Char36:
	MOVLW      50
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,170 :: 		case 3:  return '3';
L_Get_Key_Char37:
	MOVLW      51
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,171 :: 		case 4:  return 'A';
L_Get_Key_Char38:
	MOVLW      65
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,172 :: 		case 5:  return '4';
L_Get_Key_Char39:
	MOVLW      52
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,173 :: 		case 6:  return '5';
L_Get_Key_Char40:
	MOVLW      53
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,174 :: 		case 7:  return '6';
L_Get_Key_Char41:
	MOVLW      54
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,175 :: 		case 8:  return 'B';
L_Get_Key_Char42:
	MOVLW      66
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,176 :: 		case 9:  return '7';
L_Get_Key_Char43:
	MOVLW      55
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,177 :: 		case 10: return '8';
L_Get_Key_Char44:
	MOVLW      56
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,178 :: 		case 11: return '9';
L_Get_Key_Char45:
	MOVLW      57
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,179 :: 		case 12: return 'C';
L_Get_Key_Char46:
	MOVLW      67
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,180 :: 		case 13: return '*';
L_Get_Key_Char47:
	MOVLW      42
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,181 :: 		case 14: return '0';
L_Get_Key_Char48:
	MOVLW      48
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,182 :: 		case 15: return '#';
L_Get_Key_Char49:
	MOVLW      35
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,183 :: 		case 16: return 'D';
L_Get_Key_Char50:
	MOVLW      68
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,184 :: 		default: return 0;
L_Get_Key_Char51:
	CLRF       R0+0
	GOTO       L_end_Get_Key_Char
;MyProject.c,185 :: 		}
L_Get_Key_Char33:
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char35
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char36
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char37
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char38
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char39
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char40
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char41
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char42
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char43
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char44
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char45
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char46
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char47
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char48
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char49
	MOVF       FARG_Get_Key_Char_key+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key_Char50
	GOTO       L_Get_Key_Char51
;MyProject.c,186 :: 		}
L_end_Get_Key_Char:
	RETURN
; end of _Get_Key_Char

_Check_Password:

;MyProject.c,189 :: 		void Check_Password(){
;MyProject.c,190 :: 		char password[5] = "1234";
	MOVLW      49
	MOVWF      Check_Password_password_L0+0
	MOVLW      50
	MOVWF      Check_Password_password_L0+1
	MOVLW      51
	MOVWF      Check_Password_password_L0+2
	MOVLW      52
	MOVWF      Check_Password_password_L0+3
	CLRF       Check_Password_password_L0+4
	CLRF       Check_Password_i_L0+0
	CLRF       Check_Password_i_L0+1
	CLRF       Check_Password_attempts_L0+0
	CLRF       Check_Password_attempts_L0+1
	CLRF       Check_Password_cnt_L0+0
	CLRF       Check_Password_cnt_L0+1
;MyProject.c,198 :: 		while(1){
L_Check_Password52:
;MyProject.c,199 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,200 :: 		LCD_Out(1,1,"Enter Password:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,201 :: 		i = 0;
	CLRF       Check_Password_i_L0+0
	CLRF       Check_Password_i_L0+1
;MyProject.c,204 :: 		while(i < 4){
L_Check_Password54:
	MOVLW      128
	XORWF      Check_Password_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Password90
	MOVLW      4
	SUBWF      Check_Password_i_L0+0, 0
L__Check_Password90:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Password55
;MyProject.c,205 :: 		key = 0;
	CLRF       Check_Password_key_L0+0
;MyProject.c,206 :: 		while(key == 0) key = Keypad_Key_Click();
L_Check_Password56:
	MOVF       Check_Password_key_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Check_Password57
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      Check_Password_key_L0+0
	GOTO       L_Check_Password56
L_Check_Password57:
;MyProject.c,208 :: 		entered_pass[i] = Get_Key_Char(key);
	MOVF       Check_Password_i_L0+0, 0
	ADDLW      Check_Password_entered_pass_L0+0
	MOVWF      FLOC__Check_Password+0
	MOVF       Check_Password_key_L0+0, 0
	MOVWF      FARG_Get_Key_Char_key+0
	CALL       _Get_Key_Char+0
	MOVF       FLOC__Check_Password+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;MyProject.c,209 :: 		LCD_Chr(2, i+1, '*'); // Display asterisk
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       Check_Password_i_L0+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,210 :: 		i++;
	INCF       Check_Password_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Check_Password_i_L0+1, 1
;MyProject.c,211 :: 		Delay_ms(200); // Debounce/Wait
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_Check_Password58:
	DECFSZ     R13+0, 1
	GOTO       L_Check_Password58
	DECFSZ     R12+0, 1
	GOTO       L_Check_Password58
	DECFSZ     R11+0, 1
	GOTO       L_Check_Password58
;MyProject.c,212 :: 		}
	GOTO       L_Check_Password54
L_Check_Password55:
;MyProject.c,213 :: 		entered_pass[4] = '\0'; // Null terminate
	CLRF       Check_Password_entered_pass_L0+4
;MyProject.c,216 :: 		if(strcmp(entered_pass, password) == 0){
	MOVLW      Check_Password_entered_pass_L0+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      Check_Password_password_L0+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Password91
	MOVLW      0
	XORWF      R0+0, 0
L__Check_Password91:
	BTFSS      STATUS+0, 2
	GOTO       L_Check_Password59
;MyProject.c,217 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,218 :: 		LCD_Out(1,1,"Correct!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,219 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Check_Password60:
	DECFSZ     R13+0, 1
	GOTO       L_Check_Password60
	DECFSZ     R12+0, 1
	GOTO       L_Check_Password60
	DECFSZ     R11+0, 1
	GOTO       L_Check_Password60
	NOP
	NOP
;MyProject.c,220 :: 		Turn_On_Servo();               // Open Garage
	CALL       _Turn_On_Servo+0
;MyProject.c,221 :: 		attempts = 0;                  // Reset attempts on success
	CLRF       Check_Password_attempts_L0+0
	CLRF       Check_Password_attempts_L0+1
;MyProject.c,222 :: 		} else {
	GOTO       L_Check_Password61
L_Check_Password59:
;MyProject.c,223 :: 		attempts++;
	INCF       Check_Password_attempts_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Check_Password_attempts_L0+1, 1
;MyProject.c,224 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,225 :: 		LCD_Out(1,1,"Wrong Password");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,226 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Check_Password62:
	DECFSZ     R13+0, 1
	GOTO       L_Check_Password62
	DECFSZ     R12+0, 1
	GOTO       L_Check_Password62
	DECFSZ     R11+0, 1
	GOTO       L_Check_Password62
	NOP
	NOP
;MyProject.c,228 :: 		if(attempts >= 3){
	MOVLW      128
	XORWF      Check_Password_attempts_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Password92
	MOVLW      3
	SUBWF      Check_Password_attempts_L0+0, 0
L__Check_Password92:
	BTFSS      STATUS+0, 0
	GOTO       L_Check_Password63
;MyProject.c,230 :: 		for(cnt = 60; cnt > 0; cnt--){
	MOVLW      60
	MOVWF      Check_Password_cnt_L0+0
	MOVLW      0
	MOVWF      Check_Password_cnt_L0+1
L_Check_Password64:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      Check_Password_cnt_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Password93
	MOVF       Check_Password_cnt_L0+0, 0
	SUBLW      0
L__Check_Password93:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Password65
;MyProject.c,231 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,232 :: 		LCD_Out(1,1,"Wait: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,233 :: 		IntToStr(cnt, cnt_txt);
	MOVF       Check_Password_cnt_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       Check_Password_cnt_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      Check_Password_cnt_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,234 :: 		LCD_Out(1,7,cnt_txt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Check_Password_cnt_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,235 :: 		LCD_Out(1,13,"s");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,236 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_Check_Password67:
	DECFSZ     R13+0, 1
	GOTO       L_Check_Password67
	DECFSZ     R12+0, 1
	GOTO       L_Check_Password67
	DECFSZ     R11+0, 1
	GOTO       L_Check_Password67
	NOP
	NOP
;MyProject.c,230 :: 		for(cnt = 60; cnt > 0; cnt--){
	MOVLW      1
	SUBWF      Check_Password_cnt_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       Check_Password_cnt_L0+1, 1
;MyProject.c,237 :: 		}
	GOTO       L_Check_Password64
L_Check_Password65:
;MyProject.c,238 :: 		attempts = 0; // Reset attempts after wait
	CLRF       Check_Password_attempts_L0+0
	CLRF       Check_Password_attempts_L0+1
;MyProject.c,239 :: 		}
L_Check_Password63:
;MyProject.c,240 :: 		}
L_Check_Password61:
;MyProject.c,241 :: 		}
	GOTO       L_Check_Password52
;MyProject.c,242 :: 		}
L_end_Check_Password:
	RETURN
; end of _Check_Password

_main:

;MyProject.c,245 :: 		void main(){
;MyProject.c,246 :: 		ADCON1 = 0x06;   // Configure analog pins as digital = >without it leds not operate
	MOVLW      6
	MOVWF      ADCON1+0
;MyProject.c,249 :: 		TRIG_Direction  = 0;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;MyProject.c,250 :: 		ECHO_Direction  = 1;
	BSF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;MyProject.c,251 :: 		TRIG2_Direction = 0;
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;MyProject.c,252 :: 		ECHO2_Direction = 1;
	BSF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;MyProject.c,253 :: 		SERVO_Direction = 0;
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;MyProject.c,254 :: 		LED_RED_Direction = 0;
	BCF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;MyProject.c,255 :: 		LED_GREEN_Direction = 0;
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;MyProject.c,257 :: 		LED_RED = 1;
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
;MyProject.c,258 :: 		LED_GREEN = 0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;MyProject.c,260 :: 		LCD_Init();
	CALL       _Lcd_Init+0
;MyProject.c,261 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;MyProject.c,267 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main68:
	DECFSZ     R13+0, 1
	GOTO       L_main68
	DECFSZ     R12+0, 1
	GOTO       L_main68
	DECFSZ     R11+0, 1
	GOTO       L_main68
	NOP
	NOP
;MyProject.c,269 :: 		Check_Password(); // Start Password System
	CALL       _Check_Password+0
;MyProject.c,271 :: 		while(1);
L_main69:
	GOTO       L_main69
;MyProject.c,272 :: 		}
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

;MyProject.c,275 :: 		void interrupt(){
;MyProject.c,276 :: 		}
L_end_interrupt:
L__interrupt96:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
