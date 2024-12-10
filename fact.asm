;Compute Factorial
.ORIG X3000
MAIN    LD R0, INPUT      ; Load input value into R0
        JSR FACTORIAL     ; Call factorial subroutine
        HALT              
FACTORIAL
        AND R1, R1, #0    ; Clear R1 (result register)
        ADD R1, R1, #1    ; Initialize result to 1
        AND R2, R2, #0    ; Clear R2 as our counter
        ADD R2, R0, #-1    ; Set counter to (input value - 1)

LOOP    BRz DONE_FACT     ; If counter is zero, we're done
        AND R3, R3, #0    ; Clear R3 as multiplication accumulator
        ADD R3, R3, R1    ; Initialize accumulator with current result
        ADD R4, R2, #0    ; Use R4 as multiplication counter

MULT    ADD R3, R3, R1    ; Add current result to accumulator
        ADD R4, R4, #-1   ; Decrement multiplication counter
        BRp MULT          ; Continue if counter is positive

        ADD R1, R3, #0    ; Update result
        ADD R2, R2, #-1   ; Decrement loop counter
        BRp LOOP          ; Continue if counter is positive

DONE_FACT
        ADD R0, R1, #0    ; Move result back to R0
        RET               ; Return

INPUT   .FILL #5          ; Input
        .END
