list p=16f84a
#include <p16f84a.inc>
__CONFIG _CP_OFF & _PWRTE_ON & _WDT_OFF & _XT_OSC
 
STATUS EQU 03H    
PORTA   EQU 05H    
PORTB   EQU 06H     
TRISA     EQU 85H    
TRISB     EQU 86H
 
; **********************************************
    ORG 00h
        goto Init
    ORG 04h
        retfie
; **********************************************
Init
 
    BSF STATUS,5
    MOVLW b'11111111'   ; Set all PORTA pins as input
    MOVWF TRISA
    MOVLW b'00000000'   ; Set all PORTB pins as output
    MOVWF TRISB
    BCF STATUS, 5
    goto Start
Start
       MOVF PORTA, W
       RLF W, F ; Multiply by 2
       MOVWF PORTB
    
    goto Start
end
