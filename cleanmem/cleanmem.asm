    processor 6502

    seg code
    org $F000       ; define the code origin at $F000

Start:
    sei             ; disable interrupts
    cld             ; disable the BCD decimal math mode
    ldx #$FF        ; loads the X registry with #$FF
    txs             ; transfer the X registry to the stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Page Zero region ($00 to $FF)
; Meaning the entire RAM and also the entire TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #0          ; A = 0
    ldx #$FF        ; X = #$FF
MemLoop:
    dex             ; X--
    sta $0,X        ; store the value of A, which is zero at address $0 + X
    bne MemLoop     ; make sure $FF is zeroed before the loop starts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org $FFFC
    .word Start     ; reset vector at $FFFC (where the program starts)
    .word Start     ; interrupt vector at $FFFE (unused in the VCS)