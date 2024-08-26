.data
.align 2           # Ensure data is word-aligned
g: .word 10        # Initialize g to 10
h: .word 5         # Initialize h to 5
i: .word 3         # Initialize i to 3
j: .word 2         # Initialize j to 2

.text
.globl main
main:
    # Load the values of g, h, i, and j into registers
    lw $s0, g    # Load g into $s0
    lw $s1, h    # Load h into $s1
    lw $s2, i    # Load i into $s2
    lw $s3, j    # Load j into $s3

    # Calculate g + h
    add $t0, $s0, $s1

    # Calculate i + j
    add $t1, $s2, $s3

    # Calculate f = (g + h) - (i + j)
    sub $s0, $t0, $t1

    # Print the result of f
    li $v0, 1     # System call code for printing an integer
    move $a0, $s0  # Move the value of f into $a0
    syscall

    # Exit the program
    li $v0, 10    # System call code for exiting the program
    syscall
