list p=16f84a
#include <p16f84a.inc>
__CONFIG _CP_OFF & _PWRTE_ON & _WDT_ON & _XT_OSC

STATUS EQU 03H
PORTA   EQU 05H
PORTB   EQU 06H
TRISA     EQU 85H
TRISB     EQU 86H
CounterA  EQU  0CH
CounterB  EQU  0DH
CounterC  EQU  0EH

; 
    ORG 00h
        goto Init
    ORG 04h
        retfie
; 
Init

    BSF STATUS,5
    MOVLW 0x00
    MOVWF TRISB

    BSF OPTION_REG, 3
    BSF OPTION_REG, 2
    BSF OPTION_REG, 1
    BSF OPTION_REG, 0

    BCF STATUS, 5
    goto Start

Start



    MOVLW 0x00     ;1us
    MOVWF PORTB    ;1us
    Call Delay

    MOVLW 0x80     ;1us
    MOVWF PORTB    ;1us
    Call Delay

    MOVLW 0x40     ;1us
    MOVWF PORTB    ;1us
    Call Delay

    MOVLW 0x20     ;1us
    MOVWF PORTB    ;1us
    Call Delay

    MOVLW 0x10     ;1us
    MOVWF PORTB    ;1us
    Call Delay

    MOVLW 0x08     ;1us
    MOVWF PORTB    ;1us
    Call Delay

    MOVLW 0x04     ;1us
    MOVWF PORTB    ;1us
    Call Delay

    MOVLW 0x02     ;1us
    MOVWF PORTB    ;1us
    Call Delay

    MOVLW 0x01     ;1us
    MOVWF PORTB    ;1us
    Call Delay

    BSF PORTB, 0
    goto loop

Delay
    movlw D'3' 
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

    clrwdt
    BCF PORTB, 0
    nop
    return

end