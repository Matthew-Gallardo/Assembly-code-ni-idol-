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
CounterI EQU 4AH
 CounterJ EQU 4BH
 CounterK EQU 4CH
 Temp EQU 4DH
 
W_TEMP	EQU 10H
STATUS_TEMP EQU	11H
 
; **********************************************
	ORG 00h
		goto Init
	ORG 04h
	
	PUSH
	MOVWF W_TEMP	
	SWAPF STATUS, 0
	MOVWF STATUS_TEMP
	
	ISR
	BCF INTCON, 0
	MOVLW d'10'
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
	
	BSF STATUS,5
	MOVLW b'00111111'
	MOVWF TRISA
	MOVLW 0xF0
	MOVWF TRISB
	BSF OPTION_REG, 7   
	BCF STATUS, 5
	BSF INTCON, 7	
	BSF INTCON, 3	
	BCF PORTB, 0
	BCF PORTB, 1
	BCF PORTB, 2
	BCF PORTB, 3
	
	goto Start
	
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

Function
       BSF PORTB, 0
	BSF PORTB, 1
	BSF PORTB, 2
	BSF PORTB, 3
	
	CALL Delay2
	
	BCF PORTB, 0
	BCF PORTB, 1
	BCF PORTB, 2
	BCF PORTB, 3
	CALL Delay2

	decfsz Temp, 1
	goto Function
	nop
	return
	
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
	
Delay2
	movlw D'6' 
	movwf CounterK 
	movlw D'24' 
	movwf CounterJ 
	movlw D'167' 
	movwf CounterI 
loop2 
	decfsz CounterI,1 
	goto loop2 
	decfsz CounterJ,1 
	goto loop2 
	decfsz CounterK,1 
	goto loop2
	nop
	return	
	
end
	