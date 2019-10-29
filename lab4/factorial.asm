# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly version of:
#   int n, fn=1;
#   cout << "Enter the number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial is:\n" << fn << "\n";
#
.data
	enterNumber: .asciiz "Enter the number:\n"
	output: .asciiz "Factorial is:\n"
	newLine: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:
	# Ask for a number (n)
	li $v0, 4
	la $a0, enterNumber
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	# Set the partial factorial (fn) = 1 initially
	li $t1, 1
	# Set iteration variable (x) = 2 initially
	li $t2, 2

loop:
	# If x > n, break from the loop
	slt $t3, $t0, $t2
	bne $t3, $zero, loop_exit

	# Otherwise, perform loop operations

	# Make fn = fn * x
	mult $t1, $t2
	mflo $t1

	# Make x = x + 1
	addi $t2, $t2, 1

	# Jump back to beginning of loop
	j loop

loop_exit:
	# Print output
	li $v0, 4
	la $a0, output
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, newLine
	syscall

exit:
	# Exit
	li $v0, 10
	syscall
