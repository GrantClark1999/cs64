# Arithmetic.asm
# A simple calculator program in MIPS Assembly for CS64
#

.text
main:
	# t0 = a
	li $v0, 5
	syscall
	move $t0, $v0
	
	# t1 = b
	li $v0, 5
	syscall
	move $t1, $v0

	# t2 = c
	li $v0, 5
	syscall
	move $t2, $v0

	# t0 = a-b
	sub $t0, $t0, $t1

	# Double (a-b) and store into t0
	add $t0, $t0, $t0

	# Loads 3 multiplier into (now unused) t1
	li $t1, 3

	# Mutliply t2 by 3 and store into (now unused) t1
	mult $t1, $t2
	mflo $t1

	# Add 2(a-b) to 3*c and store in t0
	add $t0, $t0, $t1

	# Print result that's stored in t0
	li $v0, 1
	move $a0, $t0
	syscall

exit:
	# Exit
	li $v0, 10
	syscall

