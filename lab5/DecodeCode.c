#include "DecodeCode.h"

mipsinstruction decode(int value)
{
	mipsinstruction instr;

	instr.funct = value & 63;
	instr.immediate = value & 65535;
	instr.rd = (value >> 11) & 31;
	instr.rt = (value >> 16) & 31;
	instr.rs = (value >> 21) & 31;
	instr.opcode = (value >> 26) & 63;

	return instr;
}


