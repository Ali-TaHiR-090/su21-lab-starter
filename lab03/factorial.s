.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    addi t0, x0, 1      
    add t1, a0, x0      

fact_loop:
    beq t1, x0, fact_done   
    mul t0, t0, t1          
    addi t1, t1, -1         
    j fact_loop

fact_done:
    mv a0, t0          
    ret

