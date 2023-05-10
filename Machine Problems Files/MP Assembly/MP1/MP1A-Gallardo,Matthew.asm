list p=16f84a
#include <p16f84a.inc>
__CONFIG _CP_OFF & _PWRTE_ON & _WDT_OFF & _XT_OSC

STATUS EQU 03H	
PORTA   EQU 05H	
PORTB   EQU 06H 	
TRISA     EQU 85H	
TRISB     EQU 86H
CounterA  EQU  0CH
CounterB  EQU  0DH
CounterC  EQU  0EH

; **********************************************
	ORG 00h
		goto Init
	ORG 04h
		retfie
; **********************************************
Init

	BSF STATUS,5
	MOVLW 0x3F
	MOVWF TRISA
	MOVLW 0x00
	MOVWF TRISB
	BCF STATUS, 5
	goto Start
Start
	RRF PORTA, 0	; PORTA to W
	MOVWF PORTB	; W to PORTB
	goto Start
end
