list p=16f84a
#include <p16f84a.inc>
__CONFIG _CP_OFF & _PWRTE_ON & _WDT_OFF & _XT_OSC

STATUS EQU 03H	
PORTA   EQU 05H	
PORTB   EQU 06H 	
TRISA     EQU 85H	
TRISB     EQU 86H
     
OPTION_REG  EQU	81H
INTCON	EQU 0BH
	
CounterA  EQU  0CH
CounterB  EQU  0DH
CounterC  EQU  0EH

W_TEMP	EQU 0FH
STATUS_TEMP EQU	10H
 
Temp  EQU  0FH
  
; **********************************************
	ORG 00h
		goto Init
	ORG 04h
	
	PUSH
	BCF INTCON, 1
	MOVWF W_TEMP	
	SWAPF STATUS, 0
	MOVWF STATUS_TEMP
	NOP
	
	ISR 
	MOVLW 0x0A
        MOVWF Temp
	CALL Function
	
	
	POP
	SWAPF STATUS_TEMP, 0
	MOVWF STATUS
	SWAPF W_TEMP, 1
	SWAPF W_TEMP, 0
	
	
		retfie
; **********************************************
Init
	BSF STATUS, 5
	
	
	MOVLW b'00111111'
	MOVWF TRISA
	MOVLW 0x01
	MOVWF TRISB
	BSF OPTION_REG, 6
	BSF OPTION_REG, 7   ;optional daw
	BCF STATUS, 5
	BSF INTCON, 7
	BSF INTCON, 4
	
	goto Start
	
Start
       MOVLW 0x00
       MOVWF PORTB
       BCF PORTB, 7
       BSF PORTB, 7
       goto Start 

Delay
	movlw D'6' 
	movwf CounterC 
	movlw D'24' 
	movwf CounterB 
	movlw D'167' 
	movwf CounterA 
loop 
	decfsz CounterA,1 
	goto loop 
	decfsz CounterB,1 
	goto loop 
	decfsz CounterC,1 
	goto loop 
	nop
	return	
	
Function
	BCF PORTB, 7
	CALL Delay
	BSF PORTB, 7
	CALL Delay
	decfsz Temp, 1
	goto Function
	nop
	return
end
	