			#include<p18F4550.inc>

loop_cnt1 	set 0x00
loop_cnt2 	set 0x01

			org 0x00
			goto start
			org 0x08
			retfie
			org 0x18
			retfie

dup_nop 	macro kk
			variable i
i = 0
			while i < kk
			nop
i += 1
			endw
			endm

start 		SETF TRISB,A 		
			CLRF TRISE,A 		
			CLRF TRISD,A 		
			BCF TRISC,2,A 		
			BCF PORTC,2,A 		
			CLRF PORTD,A 		
			CLRF PRODH,A 		
			BSF PORTE,0,A
			MOVWF	PRODH,A	
AGAIN 		BTFSC PORTB,0 		
			BRA	AGAIN
			MOVLW 0x0A		
			MOVWF PRODL,A
LOOP 		MOVFF PRODL,PORTD
			CALL DELAY
			DECF PRODH,F,A
			DECFSZ PRODL,F,A
			BRA LOOP
			MOVLW	B'00000000'
			MOVWF	PORTD,A
			CALL	DELAY
			MOVLW 0x0A		
			MOVWF PRODL,A
LOOP2 		MOVFF PRODL,PORTD
			CALL DELAY
			DECF PRODH,F,A
			DECFSZ PRODL,F,A
			BRA LOOP2
			MOVLW	B'00000000'
			MOVWF	PORTD,A
			CALL	DELAY
			MOVLW 0x0A		
			MOVWF PRODL,A
LOOP3 		MOVFF PRODL,PORTD
			CALL DELAY
			DECF PRODH,F,A
			DECFSZ PRODL,F,A
			BRA LOOP3
			MOVLW	B'00000000'
			MOVWF	PORTD,A
			CALL	DELAY
			CLRF 	PRODH,A
			CLRF 	PORTD,A
			SETF	PORTC, 2
			CALL	BLON
			CALL 	DELAY
			CLRF	PORTC, 2
			CALL	BLOFF
			CALL 	DELAY
			SETF	PORTC, 2
			CALL	BLON
			CALL 	DELAY
			CLRF	PORTC, 2
			CALL	BLOFF
			CALL 	DELAY
			SETF	PORTC, 2
			CALL	BLON
			CALL 	DELAY
			CLRF	PORTC, 2
			CALL	BLOFF
			CALL	DELAY
			SETF	PORTC, 2
			CALL	BLON
			CALL 	DELAY
			CLRF	PORTC, 2
			CALL	BLOFF
			CALL 	DELAY
			SETF	PORTC, 2
			CALL	BLON
			CALL 	DELAY
			CLRF	PORTC, 2
			CALL	BLOFF
			CALL 	DELAY
			SETF	PORTC, 2
			CALL	BLON
			CALL 	DELAY
			CLRF	PORTC, 2
			CALL	BLOFF
			CALL 	DELAY
			BRA 	AGAIN
			NOP

BLON		MOVLW	B'11111111'
			MOVWF	PORTD,A
			RETURN

BLOFF		MOVLW	B'00000000'
			MOVWF	PORTD,A
			RETURN

DELAY		MOVLW D'80'
			MOVWF loop_cnt2,A
AGAIN1 		MOVLW D'250'
			MOVWF loop_cnt1,A
AGAIN2 		dup_nop D'247'
			DECFSZ loop_cnt1,F,A
			BRA AGAIN2
			DECFSZ loop_cnt2,F,A
			BRA AGAIN1
			NOP
			RETURN

			END



