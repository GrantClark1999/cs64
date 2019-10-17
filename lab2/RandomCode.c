#include "stdio.h"
#include "stdlib.h"

int multiplyBy8(int v)
{
	return (v << 3);
}

int setBit6to1(int v)
{
	return (v | 64);
}

int setBit3to0(int v)
{
	return (v & ~8);
}
	
int flipBit5(int v)
{
	return (v ^ 32);
}
	
int ifBit7is0(int v)
{
	if ((v >> 7) & 1 == 0)
		return 1;
	return 0;
}

int ifBit3is1(int v)
{
	// check to see if bit 3 is a 1 - return 1 if true, 0 if false
	if ((v >> 3) & 1 == 0)
		return 0;
	return 1;
}

int unsignedBits0through5(int v)
{
	return v & 63;
}

int unsignedBits6through9(int v)
{
	return (v >> 6) & 15;
}

int signedBits0through5(int v)
{
	if ((v >> 5) & 1 == 1) 
		return (v | ~63);
	return (v & 63);
}

int signedBits6through9(int v)
{
	if ((v >> 9) & 1 == 1)
		return ((v >> 6) | ~15);
	return ((v >> 6) & 15);
}

int setBits4through9(int v, int setValue)
{
	// set bits 4 through 9 in v to become setValue
	(setValue << 4)

	10001001001001001000010000100001111000
	00000000000000000000000000001000110000
	11111111111111111111111111110111010000


	return v;
}




