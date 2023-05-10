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
	BSF STATUS,5
	MOVLW 0xF0
	MOVWF TRISB
	bcf STATUS, 5
	goto Start
Delay 
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
Start
       MOVLW d'0'
       MOVWF PORTB
       CALL Delay
       
       MOVLW d'1'
       MOVWF PORTB
       CALL Delay
       
       MOVLW d'2'
       MOVWF PORTB
       CALL Delay
       
       MOVLW d'3'
       MOVWF PORTB
       CALL Delay
       
       MOVLW d'4'
       MOVWF PORTB
       CALL Delay
       
       MOVLW d'5'
       MOVWF PORTB
       CALL Delay
       
       MOVLW d'6'
       MOVWF PORTB
       CALL Delay
       
       MOVLW d'7'
       MOVWF PORTB
       CALL Delay
       
       MOVLW d'8'
       MOVWF PORTB
       CALL Delay
       
       MOVLW d'9'
       MOVWF PORTB
       CALL Delay
       
       goto Start  
end
	