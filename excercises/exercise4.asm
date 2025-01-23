    processor 6502 
    seg Code        ; Define a new segment named "Code" 
    org $F000       ; Define the origin of the ROM code at memory address $F000 
Start: 
    lda #100	    ; Load the A register with the literal decimal value 100 

    clc 	        ; Always clear carray flag before calling ADC
    adc #5          ; Add the decimal value 5 to the accumulator 
    		        ; Register A should now contain the decimal value #105
                    
    sec		        ; Always set carray flag before calling SBC
    sbc #10         ; Subtract the decimal value 10 from the accumulator 
                    ; Register A should now contain the decimal 95 (or $5F in hexadecimal) 
                    
    jmp Start 
    
    org $FFFC       ; End the ROM by adding required values to memory position $FFFC 
    .word Start     ; Put 2 bytes with the reset address at memory position $FFFC 
    .word Start     ; Put 2 bytes with the break address at memory position $FFFE
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6502 has the ADC (add with carry), which allows us to add a value with the
;; remainder from a previous instruction.
;;
;; We can use the 6502 to add using ADC and subtract using SBC.
;; The only gotcha is that we need to remember to clear the carry before
;; adding, and remember to set the carry before subtracting.
;;
;; As a suggestion, always think of these instructions as a pair.
;;
;; ; Adding is always done with CLC followed by an ADC.
;; ; CLC
;; ; ADC xx
;;
;; ; Subtracting is always done with SEC followed by an SBC.
;; ; SEC
;; ; SBC xx
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;