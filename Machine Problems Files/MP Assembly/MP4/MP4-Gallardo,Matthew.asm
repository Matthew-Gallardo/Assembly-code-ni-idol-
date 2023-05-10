list p=16f84a
#include <p16f84a.inc>
__CONFIG _CP_OFF & _PWRTE_ON & _WDT_ON & _XT_OSC

STATUS EQU 03H	
PORTA   EQU 05H	
PORTB   EQU 06H 	
TRISA     EQU 85H	
TRISB     EQU 86H
OPTION_REG EQU 81H
CounterA  EQU  0CH
CounterB  EQU  0DH
CounterC  EQU  0EH
Counter  EQU  0x0F


; **********************************************
	ORG 00h
		goto Init
	ORG 04h
		retfie
; **********************************************
Init

	BSF STATUS,5
; Set Registers here
;	MOVLW b'00111111'
	;MOVLW 0x3F
	;MOVWF TRISA
	MOVLW 0x00
	MOVWF TRISB
	BSF OPTION_REG,3
	BCF OPTION_REG,2
	BCF OPTION_REG,1
	BCF OPTION_REG,0
	BCF STATUS,5
	goto Start
Start
; add code here
	BSF PORTB,0
	movlw 0x05
	movwf Counter
	
loop_x
	clrwdt
	BSF PORTB,0
	BCF PORTB,0
	BSF PORTB,0
	BCF PORTB,0
	BSF PORTB,0
	BCF PORTB,0
	BSF PORTB,0
	BCF PORTB,0
	BSF PORTB,0
	BCF PORTB,0
	BSF PORTB,0
	BCF PORTB,0
	BSF PORTB,0
	BCF PORTB,0
	BSF PORTB,0
	BCF PORTB,0
	BSF PORTB,0
	BCF PORTB,0
	BSF PORTB,0
	BCF PORTB,0
	decfsz Counter,1
	goto loop_x
	goto loop_y

loop_y
	nop
	sleep
	
end