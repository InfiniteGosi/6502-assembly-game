    processor 6502 
    seg Code        ; Define a new segment named "Code" 
    org $F000       ; Define the origin of the ROM code at memory address $F000 
Start: 
    lda #15         ; Load the A register with the literal decimal value 15 
    
    tax             ; Transfer the value from A to X 
    tay             ; Transfer the value from A to Y 
    txa             ; Transfer the value from X to A 
    tya             ; Transfer the value from Y to A 
    
    		        ; Important: There is no TXY for TYX
                    ; Therefore we can't transfer directly X to Y or Y to X
                    ; If we wish to do so, we must go through A
    
    ldx #6          ; Load X with the decimal value 6 
    txa             ; Transfer X to A
    tay	 	        ; Transfer Y to A
    
    jmp Start 
    
    org $FFFC       ; End the ROM by adding required values to memory position $FFFC 
    .word Start     ; Put 2 bytes with the reset address at memory position $FFFC 
    .word Start     ; Put 2 bytes with the break address at memory position $FFFE