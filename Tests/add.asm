# Main program
.text
.globl main
main:
    # Load the value of g into register $s1
    lw $s1, g

    # Add 20 to the value in $s1 and store the result in register $s0
    addi $s0, $s1, 20

    # Store the result in f
    sw $s0, f

    # Load the result from f into $a0 for printing
    lw $a0, f

    # Print the integer value in $a0
    li $v0, 1        # syscall for print integer
    syscall

    # Exit the program
    li $v0, 10       # syscall for exit
    syscall

# Data section
.data
g: .word 10   # Example value for g
f: .word 0    # Space for the result f
