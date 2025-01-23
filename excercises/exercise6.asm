    processor 6502 
    seg Code        ; Define a new segment named "Code" 
    org $F000       ; Define the origin of the ROM code at memory address $F000 
Start: 
    lda #1          ; Load the A register with the decimal value 1 
    ldx #2          ; Load the X register with the decimal value 2 
    ldy #3          ; Load the Y register with the decimal value 3 
    inx             ; Increment X 
    iny             ; Increment Y 
    
    clc             ; Clear the carry flag   
    adc #1          ; Increment A by adding 1 (6502 does not have ina)
 
    dex             ; Decrement X 
    dey             ; Decrement Y 
    
    sec             ; Set the carry flag
    sbc #1          ; Decrement A by subtracting 1 (6502 does not have dea)
    
                    ; In the 6502, we can directly increment and decrement both
                    ; X and Y, but not A. We can only ADC #1 and SBC #1 from A.
                    ; This makes X and Y great choices to control loops.
    
    
    jmp Start
                   
 
    org $FFFC      ; End the ROM by adding required values to memory position $FFFC 
    .word Start    ; Put 2 bytes with the reset address at memory position $FFFC 
    .word Start    ; Put 2 bytes with the break address at memory position $FFFE