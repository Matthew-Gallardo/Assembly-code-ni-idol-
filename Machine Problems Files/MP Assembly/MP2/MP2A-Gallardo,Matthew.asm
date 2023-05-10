list p=16f84a
#include <p16f84a.inc>
__CONFIG _CP_OFF & _PWRTE_ON & _WDT_OFF & _XT_OSC

STATUS	    EQU 03H	
PORTA	    EQU 05H	
PORTB	    EQU 06H 	
TRISA	    EQU 85H	
TRISB	    EQU 86H
COUNTERA    EQU 0CH
COUNTERB    EQU 0DH
COUNTERC    EQU 0EH
; **********************************************
	ORG 00h
		goto Init
	ORG 04h
		retfie
; **********************************************
Init
	BSF STATUS, 5
	MOVLW b'00111111'
	MOVWF TRISA
	MOVLW 0x00
	MOVWF TRISB
	BCF STATUS, 5
	GOTO START
START
	BTFSS PORTA, 0
	GOTO DOWN
DOWN
	MOVLW 0x00
	MOVWF PORTB
	CALL DELAY
	
	MOVLW 0x01
	MOVWF PORTB
	CALL DELAY
	
	MOVLW 0x02
	MOVWF PORTB
	CALL DELAY
	
	MOVLW 0x04
	MOVWF PORTB
	CALL DELAY
	
	MOVLW 0x08
	MOVWF PORTB
	CALL DELAY
	
	MOVLW 0x10
	MOVWF PORTB
	CALL DELAY
	
	MOVLW 0x20
	MOVWF PORTB
	CALL DELAY
	
	MOVLW 0x40
	MOVWF PORTB
	CALL DELAY
	
	MOVLW 0x80
	MOVWF PORTB
	CALL DELAY

DELAY
	MOVLW D'6'
	MOVWF COUNTERC
	MOVLW D'24'
	MOVWF COUNTERB
	MOVLW D'167'
	MOVWF COUNTERA
LOOP
	DECFSZ COUNTERA, 1
	GOTO LOOP
	DECFSZ COUNTERB, 1
	GOTO LOOP
	DECFSZ COUNTERC, 1
	GOTO LOOP
	NOP
	RETURN
END
	
	