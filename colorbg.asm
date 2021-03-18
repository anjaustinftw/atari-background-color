    processor 6502

    include "vcs.h"
    include "macro.h"

    seg code
    org $F000       ; Define ROM origin as $F0000

START:
;    CLEAN_START     ; Call macro to safely clear memory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set background luminosity and hue to yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda #$1E        ; Load NTSC color 1E to register A
    sta COLUBK      ; Store A to BackgroundColor Address $09

    jmp START       ; Repeat from START

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    org $FFFC       ; Define origin as ROM address $FFFC
    .word START     ; Reset vecotr at $FFFC
    .word START     ; Interupt vector at $FFFE (unused by the VCS)
