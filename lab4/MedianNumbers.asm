# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data
	requestInput: .asciiz "Enter the next number:\n"
	medianText: .asciiz "Median: "
	newLine: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:
	# Get first number (a) -> $t0
	li $v0, 4
	la $a0, requestInput
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

	# Get second number (b) -> $t1
	li $v0, 4
	la $a0, requestInput
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	# Get third number (c) -> $t2
	li $v0, 4
	la $a0, requestInput
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

	# Store x = (a-b) -> $s0
	sub $s0, $t0, $t1

	# Store y = (b-c) -> $s1
	sub $s1, $t1, $t2

	# Store z = (a-c) -> $s2
	sub $s2, $t0, $t2

	# If x * y > 0, b is the median
	mult $s0, $s1
	mflo $t3
	slt $s3, $zero, $t3
	bne $s3, $zero, setSecondAsMedian

	# If x * z > 0, c is the median
	mult $s0, $s2
	mflo $t3
	slt $s3, $zero, $t3
	bne $s3, $zero, setThirdAsMedian

	# Else, a is the median

setFirstAsMedian:
	move $t9, $t0
	j print

setSecondAsMedian:
	move $t9, $t1
	j print

setThirdAsMedian:
	move $t9, $t2
	j print

print:
	# Print median
	li $v0, 4
	la $a0, medianText
	syscall

	li $v0, 1
	move $a0, $t9
	syscall

	li $v0, 4
	la $a0, newLine
	syscall

exit:
	# Exit
	li $v0, 10
	syscall