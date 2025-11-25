
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		trisb=0;
	CLRF       TRISB+0
;MyProject.c,3 :: 		portb=1;
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,8 :: 		}
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

;MyProject.c,9 :: 		void interrupt(){
;MyProject.c,15 :: 		}
L_end_interrupt:
L__interrupt2:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
