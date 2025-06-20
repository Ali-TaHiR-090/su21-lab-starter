.globl map

.text
main:
    
    jal ra, create_default_list
    add s0, a0, x0        

    
    add a0, s0, x0
    jal ra, print_list
    jal ra, print_newline

    
    add a0, s0, x0        
    la a1, square         
    jal ra, map           

    
    add a0, s0, x0
    jal ra, print_list
    jal ra, print_newline

    
    add a0, s0, x0        
    la a1, decrement      
    jal ra, map           

    
    add a0, s0, x0
    jal ra, print_list
    jal ra, print_newline

    
    addi a0, x0, 10
    ecall


map:
    
    addi sp, sp, -12
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)

    beq a0, x0, done      

    add s0, a0, x0        
    add s1, a1, x0        

    lw a0, 0(s0)          
    jalr ra, s1, 0
    sw a0, 0(s0)          

    lw a0, 4(s0)          
    add a1, s1, x0        
    jal ra, map           

done:
    
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12


square:
    mul a0, a0, a0
    jr ra


decrement:
    addi a0, a0, -1
    jr ra


create_default_list:
    addi sp, sp, -12
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)

    li s0, 0             
    li s1, 0             

loop:
    li a0, 8             
    jal ra, malloc       
    sw s1, 0(a0)         
    sw s0, 4(a0)         
    add s0, a0, x0       
    addi s1, s1, 1       

    addi t0, x0, 10
    bne s1, t0, loop     

    
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12
    jr ra                


print_list:
    bne a0, x0, print_me_and_recurse
    jr ra                

print_me_and_recurse:
    add t0, a0, x0       
    lw a1, 0(t0)         

    addi a0, x0, 1       
    ecall

    addi a1, x0, ' '     
    addi a0, x0, 11      
    ecall

    lw a0, 4(t0)         
    jal x0, print_list   


print_newline:
    addi a1, x0, '\n'
    addi a0, x0, 11      
    ecall
    jr ra


malloc:
    addi a1, a0, 0       
    addi a0, x0, 9       
    ecall
    jr ra                

