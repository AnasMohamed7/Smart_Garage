
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
	GOTO       L__getDistance137
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance137:
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
	GOTO       L__getDistance138
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance138:
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
	GOTO       L__getDistance240
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance240:
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
	GOTO       L__getDistance241
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance241:
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

;MyProject.c,86 :: 		void UpdateGarageLEDs(unsigned int angle){
;MyProject.c,87 :: 		if(angle == 0){
	MOVLW      0
	XORWF      FARG_UpdateGarageLEDs_angle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UpdateGarageLEDs43
	MOVLW      0
	XORWF      FARG_UpdateGarageLEDs_angle+0, 0
L__UpdateGarageLEDs43:
	BTFSS      STATUS+0, 2
	GOTO       L_UpdateGarageLEDs14
;MyProject.c,88 :: 		LED_RED = 1;
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
;MyProject.c,89 :: 		LED_GREEN = 0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;MyProject.c,90 :: 		}
	GOTO       L_UpdateGarageLEDs15
L_UpdateGarageLEDs14:
;MyProject.c,91 :: 		else if(angle == 90){
	MOVLW      0
	XORWF      FARG_UpdateGarageLEDs_angle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UpdateGarageLEDs44
	MOVLW      90
	XORWF      FARG_UpdateGarageLEDs_angle+0, 0
L__UpdateGarageLEDs44:
	BTFSS      STATUS+0, 2
	GOTO       L_UpdateGarageLEDs16
;MyProject.c,92 :: 		LED_RED = 0;
	BCF        RA1_bit+0, BitPos(RA1_bit+0)
;MyProject.c,93 :: 		LED_GREEN = 1;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
;MyProject.c,94 :: 		}
L_UpdateGarageLEDs16:
L_UpdateGarageLEDs15:
;MyProject.c,95 :: 		}
L_end_UpdateGarageLEDs:
	RETURN
; end of _UpdateGarageLEDs

_Servo_SetAngle:

;MyProject.c,99 :: 		void Servo_SetAngle(unsigned int angle){
;MyProject.c,100 :: 		unsigned int pulse = 500 + (angle * 11);
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
;MyProject.c,103 :: 		SERVO = 1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;MyProject.c,104 :: 		for(i=0; i < pulse; i++) Delay_us(1);
	CLRF       Servo_SetAngle_i_L0+0
	CLRF       Servo_SetAngle_i_L0+1
L_Servo_SetAngle17:
	MOVF       Servo_SetAngle_pulse_L0+1, 0
	SUBWF      Servo_SetAngle_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Servo_SetAngle46
	MOVF       Servo_SetAngle_pulse_L0+0, 0
	SUBWF      Servo_SetAngle_i_L0+0, 0
L__Servo_SetAngle46:
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_SetAngle18
	NOP
	NOP
	INCF       Servo_SetAngle_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Servo_SetAngle_i_L0+1, 1
	GOTO       L_Servo_SetAngle17
L_Servo_SetAngle18:
;MyProject.c,105 :: 		SERVO = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;MyProject.c,106 :: 		for(i=0; i < (20000 - pulse); i++) Delay_us(1);
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
	GOTO       L__Servo_SetAngle47
	MOVF       R1+0, 0
	SUBWF      Servo_SetAngle_i_L0+0, 0
L__Servo_SetAngle47:
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_SetAngle21
	NOP
	NOP
	INCF       Servo_SetAngle_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Servo_SetAngle_i_L0+1, 1
	GOTO       L_Servo_SetAngle20
L_Servo_SetAngle21:
;MyProject.c,108 :: 		UpdateGarageLEDs(angle);
	MOVF       FARG_Servo_SetAngle_angle+0, 0
	MOVWF      FARG_UpdateGarageLEDs_angle+0
	MOVF       FARG_Servo_SetAngle_angle+1, 0
	MOVWF      FARG_UpdateGarageLEDs_angle+1
	CALL       _UpdateGarageLEDs+0
;MyProject.c,109 :: 		}
L_end_Servo_SetAngle:
	RETURN
; end of _Servo_SetAngle

_Turn_On_Servo:

;MyProject.c,112 :: 		void Turn_On_Servo(){
;MyProject.c,114 :: 		for(i=0;i<40;i++) Servo_SetAngle(90);
	CLRF       Turn_On_Servo_i_L0+0
	CLRF       Turn_On_Servo_i_L0+1
L_Turn_On_Servo23:
	MOVLW      128
	XORWF      Turn_On_Servo_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Turn_On_Servo49
	MOVLW      40
	SUBWF      Turn_On_Servo_i_L0+0, 0
L__Turn_On_Servo49:
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
;MyProject.c,115 :: 		}
L_end_Turn_On_Servo:
	RETURN
; end of _Turn_On_Servo

_Turn_On_LCD:

;MyProject.c,118 :: 		void Turn_On_LCD(){
;MyProject.c,119 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,120 :: 		LCD_Out(1,1,"LCD Working OK");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,121 :: 		Delay_ms(1000);
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
;MyProject.c,122 :: 		}
L_end_Turn_On_LCD:
	RETURN
; end of _Turn_On_LCD

_Turn_On_Keypad:

;MyProject.c,125 :: 		void Turn_On_Keypad(){
;MyProject.c,127 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,128 :: 		LCD_Out(1,1,"Press a Key:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,130 :: 		while(1){
L_Turn_On_Keypad27:
;MyProject.c,131 :: 		key = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      Turn_On_Keypad_key_L0+0
;MyProject.c,132 :: 		if(key){
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Turn_On_Keypad29
;MyProject.c,133 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,134 :: 		LCD_Out(1,1,"You Pressed:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,135 :: 		LCD_Chr(2,1, key + 48); // Display key value
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      Turn_On_Keypad_key_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,136 :: 		Delay_ms(1000);
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
;MyProject.c,137 :: 		break;
	GOTO       L_Turn_On_Keypad28
;MyProject.c,138 :: 		}
L_Turn_On_Keypad29:
;MyProject.c,139 :: 		}
	GOTO       L_Turn_On_Keypad27
L_Turn_On_Keypad28:
;MyProject.c,140 :: 		}
L_end_Turn_On_Keypad:
	RETURN
; end of _Turn_On_Keypad

_Turn_On_Ultrasonic:

;MyProject.c,143 :: 		void Turn_On_Ultrasonic(){
;MyProject.c,147 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,148 :: 		LCD_Out(1,1,"Testing Sensors");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,150 :: 		Delay_ms(800);
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
;MyProject.c,152 :: 		d1 = getDistance1();     // Read sensor 1
	CALL       _getDistance1+0
	MOVF       R0+0, 0
	MOVWF      Turn_On_Ultrasonic_d1_L0+0
	MOVF       R0+1, 0
	MOVWF      Turn_On_Ultrasonic_d1_L0+1
;MyProject.c,153 :: 		d2 = getDistance2();   // Read sensor 2
	CALL       _getDistance2+0
	MOVF       R0+0, 0
	MOVWF      Turn_On_Ultrasonic_d2_L0+0
	MOVF       R0+1, 0
	MOVWF      Turn_On_Ultrasonic_d2_L0+1
;MyProject.c,155 :: 		WordToStr(d1, text);
	MOVF       Turn_On_Ultrasonic_d1_L0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       Turn_On_Ultrasonic_d1_L0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      Turn_On_Ultrasonic_text_L0+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,156 :: 		LCD_Out(1,1,"S1:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,157 :: 		LCD_Out(1,4,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Turn_On_Ultrasonic_text_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,159 :: 		WordToStr(d2, text);
	MOVF       Turn_On_Ultrasonic_d2_L0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       Turn_On_Ultrasonic_d2_L0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      Turn_On_Ultrasonic_text_L0+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,160 :: 		LCD_Out(2,1,"S2:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,161 :: 		LCD_Out(2,4,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Turn_On_Ultrasonic_text_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,163 :: 		Delay_ms(1200);
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
;MyProject.c,164 :: 		}
L_end_Turn_On_Ultrasonic:
	RETURN
; end of _Turn_On_Ultrasonic

_main:

;MyProject.c,167 :: 		void main(){
;MyProject.c,168 :: 		ADCON1 = 0x06;   // Configure analog pins as digital
	MOVLW      6
	MOVWF      ADCON1+0
;MyProject.c,171 :: 		TRIG_Direction  = 0;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;MyProject.c,172 :: 		ECHO_Direction  = 1;
	BSF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;MyProject.c,173 :: 		TRIG2_Direction = 0;
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;MyProject.c,174 :: 		ECHO2_Direction = 1;
	BSF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;MyProject.c,175 :: 		SERVO_Direction = 0;
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
;MyProject.c,176 :: 		LED_RED_Direction = 0;
	BCF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;MyProject.c,177 :: 		LED_GREEN_Direction = 0;
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;MyProject.c,179 :: 		LED_RED = 1;
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
;MyProject.c,180 :: 		LED_GREEN = 0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;MyProject.c,182 :: 		LCD_Init();
	CALL       _Lcd_Init+0
;MyProject.c,183 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;MyProject.c,185 :: 		Turn_On_LCD();
	CALL       _Turn_On_LCD+0
;MyProject.c,186 :: 		Turn_On_Keypad();
	CALL       _Turn_On_Keypad+0
;MyProject.c,187 :: 		Turn_On_Ultrasonic();
	CALL       _Turn_On_Ultrasonic+0
;MyProject.c,189 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
	NOP
;MyProject.c,192 :: 		Turn_On_Servo();   // Move to 90 degrees
	CALL       _Turn_On_Servo+0
;MyProject.c,193 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,194 :: 		LCD_Out(1,1,"All Parts OK");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,196 :: 		while(1);
L_main34:
	GOTO       L_main34
;MyProject.c,197 :: 		}
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

;MyProject.c,200 :: 		void interrupt(){
;MyProject.c,201 :: 		}
L_end_interrupt:
L__interrupt55:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
