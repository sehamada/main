# MIPS Assembly Code
# $s0 = A
# $s1 = B

.data
equal_str:      .asciiz "equal\n"
not_equal_str:  .asciiz "not equal\n"
done_str:       .asciiz "done\n"
prompt_a:       .asciiz "Enter value for A: "
prompt_b:       .asciiz "Enter value for B: "

.text
.globl main
main:
    # Prompt user for A
    li $v0, 4               # syscall for printing string
    la $a0, prompt_a        # load address of prompt_a string into $a0
    syscall                 # print "Enter value for A: "

    # Read A from user
    li $v0, 5               # syscall for reading integer
    syscall                 # read integer input
    move $s0, $v0           # move the input value to $s0 (A)

    # Prompt user for B
    li $v0, 4               # syscall for printing string
    la $a0, prompt_b        # load address of prompt_b string into $a0
    syscall                 # print "Enter value for B: "

    # Read B from user
    li $v0, 5               # syscall for reading integer
    syscall                 # read integer input
    move $s1, $v0           # move the input value to $s1 (B)

    # Compare A and B
    beq $s0, $s1, equal     # if (A == B) jump to equal label
    # not-equal-code
    li $v0, 4               # syscall for printing string
    la $a0, not_equal_str   # load address of "not equal" string into $a0
    syscall                 # print "not equal"
    j done                  # jump to done label

equal:
    # equal-code
    li $v0, 4               # syscall for printing string
    la $a0, equal_str       # load address of "equal" string into $a0
    syscall                 # print "equal"

done:
    # after-if-code
    li $v0, 4               # syscall for printing string
    la $a0, done_str        # load address of "done" string into $a0
    syscall                 # print "done"

    # Exit program
    li $v0, 10              # syscall for exit
    syscall                 # exit the program
