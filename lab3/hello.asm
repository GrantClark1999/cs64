# hello.asm
# A "Hello World" program in MIPS Assembly for CS64
#
#  Data Area - allocate and initialize variables
.data
	chooseInt: .asciiz "Choose an integer between 0 and 1000:\n"
	helloWorld: .asciiz "Hello World!\n"
	response1: .asciiz "User chose "
	response2: .asciiz ". Truly a wise choice.\n"

# Text Area (i.e. instructions)
.text
main:
	li $v0, 4
	la $a0, chooseInt
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, helloWorld
	syscall

	la $a0, response1
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, response2
	syscall

exit:
	# Exit
	li $v0, 10
	syscall

