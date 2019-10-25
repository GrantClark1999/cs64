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
	# Get first number
	li $v0, 4
	la $a0, requestInput
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

	# Get second number
	li $v0, 4
	la $a0, requestInput
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	# Get third number
	li $v0, 4
	la $a0, requestInput
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

findMaxOfFirstTwo:
	# Find max($t0, $t1) and store in $t7
	slt $t3, $t0, $t1
	bne $t3, $zero, setMaxOfFirstTwo

findMinOfMaxAndLast:
	# Find min($t7, $t2) and store in $t7
	move $t3, $zero
	slt $t3, $t2, $t0
	bne $t3, $zero, setMinOfMaxAndLast

findMaxFinal:
	# Find max($t7, $t0) and store in $t7
	move $t3, $zero
	slt $t3, $t7, $t0
	bne $t3, $zero, setMaxFinal
	j print

setMaxOfFirstTwo:
	move $t7, $t1
	j findMinOfMaxAndLast

setMinOfMaxAndLast:
	move $t7, $t2
	j findMaxFinal

setMaxFinal:
	move $t7, $t0

print:
	# Print median
	li $v0, 4
	la $a0, medianText
	syscall

	li $v0, 1
	move $a0, $t7
	syscall

	li $v0, 4
	la $a0, newLine
	syscall

exit:
	# Exit
	li $v0, 10
	syscall