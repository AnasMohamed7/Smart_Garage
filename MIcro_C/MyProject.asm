
_getDistance1:

	CLRF       getDistance1_t_L0+0
	CLRF       getDistance1_t_L0+1
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
	MOVLW      6
	MOVWF      R13+0
L_getDistance10:
	DECFSZ     R13+0, 1
	GOTO       L_getDistance10
	NOP
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
L_getDistance11:
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_getDistance12
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
	GOTO       L__getDistance182
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance182:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance13
	CLRF       R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	GOTO       L_end_getDistance1
L_getDistance13:
	NOP
	NOP
	GOTO       L_getDistance11
L_getDistance12:
	CLRF       getDistance1_t_L0+0
	CLRF       getDistance1_t_L0+1
L_getDistance14:
	BTFSS      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_getDistance15
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
	GOTO       L__getDistance183
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance183:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance16
	GOTO       L_getDistance15
L_getDistance16:
	NOP
	NOP
	GOTO       L_getDistance14
L_getDistance15:
	MOVF       getDistance1_t_L0+0, 0
	MOVWF      R0+0
	MOVF       getDistance1_t_L0+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
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
L_end_getDistance1:
	RETURN
; end of _getDistance1

_getDistance2:

	CLRF       getDistance2_t_L0+0
	CLRF       getDistance2_t_L0+1
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
	MOVLW      6
	MOVWF      R13+0
L_getDistance27:
	DECFSZ     R13+0, 1
	GOTO       L_getDistance27
	NOP
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
L_getDistance28:
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_getDistance29
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
	GOTO       L__getDistance285
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance285:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance210
	CLRF       R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	GOTO       L_end_getDistance2
L_getDistance210:
	NOP
	NOP
	GOTO       L_getDistance28
L_getDistance29:
	CLRF       getDistance2_t_L0+0
	CLRF       getDistance2_t_L0+1
L_getDistance211:
	BTFSS      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_getDistance212
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
	GOTO       L__getDistance286
	MOVF       R1+0, 0
	SUBLW      48
L__getDistance286:
	BTFSC      STATUS+0, 0
	GOTO       L_getDistance213
	GOTO       L_getDistance212
L_getDistance213:
	NOP
	NOP
	GOTO       L_getDistance211
L_getDistance212:
	MOVF       getDistance2_t_L0+0, 0
	MOVWF      R0+0
	MOVF       getDistance2_t_L0+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
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
L_end_getDistance2:
	RETURN
; end of _getDistance2

_UpdateGarageLEDs:

	MOVLW      0
	XORWF      FARG_UpdateGarageLEDs_angle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UpdateGarageLEDs88
	MOVLW      0
	XORWF      FARG_UpdateGarageLEDs_angle+0, 0
L__UpdateGarageLEDs88:
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__UpdateGarageLEDs89
	BCF        RE1_bit+0, BitPos(RE1_bit+0)
	GOTO       L__UpdateGarageLEDs90
L__UpdateGarageLEDs89:
	BSF        RE1_bit+0, BitPos(RE1_bit+0)
L__UpdateGarageLEDs90:
	MOVLW      0
	XORWF      FARG_UpdateGarageLEDs_angle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__UpdateGarageLEDs91
	MOVLW      90
	XORWF      FARG_UpdateGarageLEDs_angle+0, 0
L__UpdateGarageLEDs91:
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__UpdateGarageLEDs92
	BCF        RE0_bit+0, BitPos(RE0_bit+0)
	GOTO       L__UpdateGarageLEDs93
L__UpdateGarageLEDs92:
	BSF        RE0_bit+0, BitPos(RE0_bit+0)
L__UpdateGarageLEDs93:
L_end_UpdateGarageLEDs:
	RETURN
; end of _UpdateGarageLEDs

_Servo_SetAngle:

	MOVF       FARG_Servo_SetAngle_angle+0, 0
	MOVWF      _MotorCurrentAngle+0
	MOVF       FARG_Servo_SetAngle_angle+1, 0
	MOVWF      _MotorCurrentAngle+1
	MOVLW      0
	XORWF      FARG_Servo_SetAngle_angle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Servo_SetAngle95
	MOVLW      0
	XORWF      FARG_Servo_SetAngle_angle+0, 0
L__Servo_SetAngle95:
	BTFSS      STATUS+0, 2
	GOTO       L_Servo_SetAngle14
	CLRF       Servo_SetAngle_i_L0+0
L_Servo_SetAngle15:
	MOVLW      50
	SUBWF      Servo_SetAngle_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_SetAngle16
	MOVF       FARG_Servo_SetAngle_angle+0, 0
	MOVWF      FARG_UpdateGarageLEDs_angle+0
	MOVF       FARG_Servo_SetAngle_angle+1, 0
	MOVWF      FARG_UpdateGarageLEDs_angle+1
	CALL       _UpdateGarageLEDs+0
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_Servo_SetAngle18:
	DECFSZ     R13+0, 1
	GOTO       L_Servo_SetAngle18
	DECFSZ     R12+0, 1
	GOTO       L_Servo_SetAngle18
	NOP
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	MOVLW      50
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Servo_SetAngle19:
	DECFSZ     R13+0, 1
	GOTO       L_Servo_SetAngle19
	DECFSZ     R12+0, 1
	GOTO       L_Servo_SetAngle19
	NOP
	NOP
	INCF       Servo_SetAngle_i_L0+0, 1
	GOTO       L_Servo_SetAngle15
L_Servo_SetAngle16:
L_Servo_SetAngle14:
	MOVLW      0
	XORWF      FARG_Servo_SetAngle_angle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Servo_SetAngle96
	MOVLW      90
	XORWF      FARG_Servo_SetAngle_angle+0, 0
L__Servo_SetAngle96:
	BTFSS      STATUS+0, 2
	GOTO       L_Servo_SetAngle20
	CLRF       Servo_SetAngle_i_L0+0
L_Servo_SetAngle21:
	MOVLW      50
	SUBWF      Servo_SetAngle_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Servo_SetAngle22
	MOVF       FARG_Servo_SetAngle_angle+0, 0
	MOVWF      FARG_UpdateGarageLEDs_angle+0
	MOVF       FARG_Servo_SetAngle_angle+1, 0
	MOVWF      FARG_UpdateGarageLEDs_angle+1
	CALL       _UpdateGarageLEDs+0
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_Servo_SetAngle24:
	DECFSZ     R13+0, 1
	GOTO       L_Servo_SetAngle24
	DECFSZ     R12+0, 1
	GOTO       L_Servo_SetAngle24
	NOP
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	MOVLW      49
	MOVWF      R12+0
	MOVLW      11
	MOVWF      R13+0
L_Servo_SetAngle25:
	DECFSZ     R13+0, 1
	GOTO       L_Servo_SetAngle25
	DECFSZ     R12+0, 1
	GOTO       L_Servo_SetAngle25
	NOP
	NOP
	INCF       Servo_SetAngle_i_L0+0, 1
	GOTO       L_Servo_SetAngle21
L_Servo_SetAngle22:
L_Servo_SetAngle20:
L_end_Servo_SetAngle:
	RETURN
; end of _Servo_SetAngle

_Open_Door:

	MOVLW      90
	MOVWF      FARG_Servo_SetAngle_angle+0
	MOVLW      0
	MOVWF      FARG_Servo_SetAngle_angle+1
	CALL       _Servo_SetAngle+0
L_end_Open_Door:
	RETURN
; end of _Open_Door

_Close_Door:

	CLRF       FARG_Servo_SetAngle_angle+0
	CLRF       FARG_Servo_SetAngle_angle+1
	CALL       _Servo_SetAngle+0
L_end_Close_Door:
	RETURN
; end of _Close_Door

_Get_Key_Char:

	MOVLW      1
	SUBWF      FARG_Get_Key_Char_key+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Get_Key_Char28
	MOVF       FARG_Get_Key_Char_key+0, 0
	SUBLW      16
	BTFSS      STATUS+0, 0
	GOTO       L_Get_Key_Char28
L__Get_Key_Char77:
	MOVLW      1
	SUBWF      FARG_Get_Key_Char_key+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      _keyMap+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_keyMap+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	GOTO       L_end_Get_Key_Char
L_Get_Key_Char28:
	CLRF       R0+0
L_end_Get_Key_Char:
	RETURN
; end of _Get_Key_Char

_Check_Password:

	CLRF       Check_Password_i_L0+0
	CLRF       Check_Password_i_L0+1
	CLRF       Check_Password_attempts_L0+0
	CLRF       Check_Password_attempts_L0+1
	CLRF       Check_Password_cnt_L0+0
	CLRF       Check_Password_cnt_L0+1
	MOVLW      _entered_pass+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
L_Check_Password29:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       Check_Password_i_L0+0
	CLRF       Check_Password_i_L0+1
L_Check_Password31:
	MOVLW      128
	XORWF      Check_Password_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Password101
	MOVLW      4
	SUBWF      Check_Password_i_L0+0, 0
L__Check_Password101:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Password32
	CLRF       Check_Password_key_L0+0
L_Check_Password33:
	MOVF       Check_Password_key_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Check_Password34
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      Check_Password_key_L0+0
	GOTO       L_Check_Password33
L_Check_Password34:
	MOVF       Check_Password_key_L0+0, 0
	MOVWF      FARG_Get_Key_Char_key+0
	CALL       _Get_Key_Char+0
	MOVF       R0+0, 0
	MOVWF      Check_Password_k_char_L0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Check_Password35
	MOVF       Check_Password_i_L0+0, 0
	ADDLW      _entered_pass+0
	MOVWF      FSR
	MOVF       Check_Password_k_char_L0+0, 0
	MOVWF      INDF+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       Check_Password_i_L0+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	INCF       Check_Password_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Check_Password_i_L0+1, 1
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_Check_Password36:
	DECFSZ     R13+0, 1
	GOTO       L_Check_Password36
	DECFSZ     R12+0, 1
	GOTO       L_Check_Password36
	DECFSZ     R11+0, 1
	GOTO       L_Check_Password36
L_Check_Password35:
	GOTO       L_Check_Password31
L_Check_Password32:
	CLRF       _entered_pass+4
	MOVLW      _entered_pass+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      _password+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Password102
	MOVLW      0
	XORWF      R0+0, 0
L__Check_Password102:
	BTFSS      STATUS+0, 2
	GOTO       L_Check_Password37
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_Check_Password
L_Check_Password37:
	INCF       Check_Password_attempts_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Check_Password_attempts_L0+1, 1
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BSF        RE1_bit+0, BitPos(RE1_bit+0)
	BCF        RE0_bit+0, BitPos(RE0_bit+0)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Check_Password39:
	DECFSZ     R13+0, 1
	GOTO       L_Check_Password39
	DECFSZ     R12+0, 1
	GOTO       L_Check_Password39
	DECFSZ     R11+0, 1
	GOTO       L_Check_Password39
	NOP
	NOP
	MOVLW      128
	XORWF      Check_Password_attempts_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Password103
	MOVLW      3
	SUBWF      Check_Password_attempts_L0+0, 0
L__Check_Password103:
	BTFSS      STATUS+0, 0
	GOTO       L_Check_Password40
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      60
	MOVWF      Check_Password_cnt_L0+0
	MOVLW      0
	MOVWF      Check_Password_cnt_L0+1
L_Check_Password41:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      Check_Password_cnt_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Password104
	MOVF       Check_Password_cnt_L0+0, 0
	SUBLW      0
L__Check_Password104:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Password42
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       Check_Password_cnt_L0+0, 0
	MOVWF      R0+0
	MOVF       Check_Password_cnt_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       Check_Password_cnt_L0+0, 0
	MOVWF      R0+0
	MOVF       Check_Password_cnt_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      5
	MOVWF      R11+0
	MOVLW      223
	MOVWF      R12+0
	MOVLW      187
	MOVWF      R13+0
L_Check_Password44:
	DECFSZ     R13+0, 1
	GOTO       L_Check_Password44
	DECFSZ     R12+0, 1
	GOTO       L_Check_Password44
	DECFSZ     R11+0, 1
	GOTO       L_Check_Password44
	NOP
	NOP
	MOVLW      1
	SUBWF      Check_Password_cnt_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       Check_Password_cnt_L0+1, 1
	GOTO       L_Check_Password41
L_Check_Password42:
	CLRF       Check_Password_attempts_L0+0
	CLRF       Check_Password_attempts_L0+1
L_Check_Password40:
	GOTO       L_Check_Password29
L_end_Check_Password:
	RETURN
; end of _Check_Password

_Operate_Garage:

	MOVLW      0
	XORWF      _MotorCurrentAngle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Operate_Garage106
	MOVLW      0
	XORWF      _MotorCurrentAngle+0, 0
L__Operate_Garage106:
	BTFSS      STATUS+0, 2
	GOTO       L_Operate_Garage45
	MOVLW      1
	MOVWF      Operate_Garage_DoorIsClosed_L0+0
	MOVLW      0
	MOVWF      Operate_Garage_DoorIsClosed_L0+1
	GOTO       L_Operate_Garage46
L_Operate_Garage45:
	CLRF       Operate_Garage_DoorIsClosed_L0+0
	CLRF       Operate_Garage_DoorIsClosed_L0+1
L_Operate_Garage46:
L_Operate_Garage47:
	CALL       _getDistance1+0
	MOVF       R0+0, 0
	MOVWF      Operate_Garage_d1_L0+0
	MOVF       R0+1, 0
	MOVWF      Operate_Garage_d1_L0+1
	MOVF       R0+2, 0
	MOVWF      Operate_Garage_d1_L0+2
	MOVF       R0+3, 0
	MOVWF      Operate_Garage_d1_L0+3
	CALL       _getDistance2+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_Operate_Garage49:
	DECFSZ     R13+0, 1
	GOTO       L_Operate_Garage49
	DECFSZ     R12+0, 1
	GOTO       L_Operate_Garage49
	DECFSZ     R11+0, 1
	GOTO       L_Operate_Garage49
	MOVLW      0
	XORWF      _MotorCurrentAngle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Operate_Garage107
	MOVLW      0
	XORWF      _MotorCurrentAngle+0, 0
L__Operate_Garage107:
	BTFSS      STATUS+0, 2
	GOTO       L_Operate_Garage50
	MOVLW      1
	MOVWF      Operate_Garage_DoorIsClosed_L0+0
	MOVLW      0
	MOVWF      Operate_Garage_DoorIsClosed_L0+1
	GOTO       L_Operate_Garage51
L_Operate_Garage50:
	CLRF       Operate_Garage_DoorIsClosed_L0+0
	CLRF       Operate_Garage_DoorIsClosed_L0+1
L_Operate_Garage51:
	MOVF       Operate_Garage_d1_L0+0, 0
	MOVWF      R4+0
	MOVF       Operate_Garage_d1_L0+1, 0
	MOVWF      R4+1
	MOVF       Operate_Garage_d1_L0+2, 0
	MOVWF      R4+2
	MOVF       Operate_Garage_d1_L0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      72
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Operate_Garage54
	MOVF       Operate_Garage_DoorIsClosed_L0+0, 0
	IORWF      Operate_Garage_DoorIsClosed_L0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Operate_Garage54
L__Operate_Garage80:
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Operate_Garage55:
	DECFSZ     R13+0, 1
	GOTO       L_Operate_Garage55
	DECFSZ     R12+0, 1
	GOTO       L_Operate_Garage55
	DECFSZ     R11+0, 1
	GOTO       L_Operate_Garage55
	NOP
	NOP
	CALL       _Check_Password+0
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Operate_Garage56:
	DECFSZ     R13+0, 1
	GOTO       L_Operate_Garage56
	DECFSZ     R12+0, 1
	GOTO       L_Operate_Garage56
	DECFSZ     R11+0, 1
	GOTO       L_Operate_Garage56
	NOP
	NOP
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CALL       _Open_Door+0
	CLRF       Operate_Garage_timer_counter_L0+0
	CLRF       Operate_Garage_timer_counter_L0+1
L_Operate_Garage57:
	CALL       _getDistance2+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      112
	MOVWF      R0+2
	MOVLW      130
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Operate_Garage58
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Operate_Garage59:
	DECFSZ     R13+0, 1
	GOTO       L_Operate_Garage59
	DECFSZ     R12+0, 1
	GOTO       L_Operate_Garage59
	DECFSZ     R11+0, 1
	GOTO       L_Operate_Garage59
	NOP
	INCF       Operate_Garage_timer_counter_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Operate_Garage_timer_counter_L0+1, 1
	MOVF       Operate_Garage_timer_counter_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Operate_Garage108
	MOVF       Operate_Garage_timer_counter_L0+0, 0
	SUBLW      100
L__Operate_Garage108:
	BTFSC      STATUS+0, 0
	GOTO       L_Operate_Garage60
	GOTO       L_Operate_Garage58
L_Operate_Garage60:
	GOTO       L_Operate_Garage57
L_Operate_Garage58:
L_Operate_Garage61:
	CALL       _getDistance1+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      72
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Operate_Garage62
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Operate_Garage63:
	DECFSZ     R13+0, 1
	GOTO       L_Operate_Garage63
	DECFSZ     R12+0, 1
	GOTO       L_Operate_Garage63
	DECFSZ     R11+0, 1
	GOTO       L_Operate_Garage63
	NOP
	GOTO       L_Operate_Garage61
L_Operate_Garage62:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CALL       _Close_Door+0
	MOVLW      8
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      Operate_Garage_DoorIsClosed_L0+0
	MOVLW      0
	MOVWF      Operate_Garage_DoorIsClosed_L0+1
L_Operate_Garage54:
	BTFSS      RE2_bit+0, BitPos(RE2_bit+0)
	GOTO       L_Operate_Garage66
	MOVF       Operate_Garage_DoorIsClosed_L0+0, 0
	IORWF      Operate_Garage_DoorIsClosed_L0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Operate_Garage66
L__Operate_Garage79:
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_Operate_Garage67:
	DECFSZ     R13+0, 1
	GOTO       L_Operate_Garage67
	DECFSZ     R12+0, 1
	GOTO       L_Operate_Garage67
	DECFSZ     R11+0, 1
	GOTO       L_Operate_Garage67
	NOP
	NOP
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CALL       _Open_Door+0
	CLRF       Operate_Garage_timer_counter_L0+0
	CLRF       Operate_Garage_timer_counter_L0+1
L_Operate_Garage68:
	CALL       _getDistance1+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      72
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Operate_Garage69
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Operate_Garage70:
	DECFSZ     R13+0, 1
	GOTO       L_Operate_Garage70
	DECFSZ     R12+0, 1
	GOTO       L_Operate_Garage70
	DECFSZ     R11+0, 1
	GOTO       L_Operate_Garage70
	NOP
	INCF       Operate_Garage_timer_counter_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Operate_Garage_timer_counter_L0+1, 1
	MOVF       Operate_Garage_timer_counter_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Operate_Garage109
	MOVF       Operate_Garage_timer_counter_L0+0, 0
	SUBLW      100
L__Operate_Garage109:
	BTFSC      STATUS+0, 0
	GOTO       L_Operate_Garage71
	GOTO       L_Operate_Garage69
L_Operate_Garage71:
	GOTO       L_Operate_Garage68
L_Operate_Garage69:
L_Operate_Garage72:
	CALL       _getDistance1+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      72
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Operate_Garage78
	CALL       _getDistance2+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      112
	MOVWF      R0+2
	MOVLW      130
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Operate_Garage78
	GOTO       L_Operate_Garage73
L__Operate_Garage78:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Operate_Garage76:
	DECFSZ     R13+0, 1
	GOTO       L_Operate_Garage76
	DECFSZ     R12+0, 1
	GOTO       L_Operate_Garage76
	DECFSZ     R11+0, 1
	GOTO       L_Operate_Garage76
	NOP
	GOTO       L_Operate_Garage72
L_Operate_Garage73:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	CALL       _Close_Door+0
	MOVLW      8
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      Operate_Garage_DoorIsClosed_L0+0
	MOVLW      0
	MOVWF      Operate_Garage_DoorIsClosed_L0+1
L_Operate_Garage66:
	GOTO       L_Operate_Garage47
L_end_Operate_Garage:
	RETURN
; end of _Operate_Garage

_main:

	MOVLW      6
	MOVWF      ADCON1+0
	BCF        TRISC4_bit+0, BitPos(TRISC4_bit+0)
	BCF        TRISE1_bit+0, BitPos(TRISE1_bit+0)
	BCF        TRISE0_bit+0, BitPos(TRISE0_bit+0)
	BSF        TRISE2_bit+0, BitPos(TRISE2_bit+0)
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
	BSF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
	BSF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
	BCF        RE1_bit+0, BitPos(RE1_bit+0)
	BCF        RE0_bit+0, BitPos(RE0_bit+0)
	CALL       _Lcd_Init+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	CALL       _Keypad_Init+0
	CALL       _Operate_Garage+0
L_end_main:
	GOTO       $+0
; end of _main
