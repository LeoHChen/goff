#include "textflag.h"
TEXT ·_mulADXElement(SB), NOSPLIT, $0-24

	// the algorithm is described here
	// https://hackmd.io/@zkteam/modular_multiplication
	// however, to benefit from the ADCX and ADOX carry chains
	// we split the inner loops in 2:
	// for i=0 to N-1
	// 		for j=0 to N-1
	// 		    (A,t[j])  := t[j] + x[j]*y[i] + A
	// 		m := t[0]*q'[0] mod W
	// 		C,_ := t[0] + m*q[0]
	// 		for j=1 to N-1
	// 		    (C,t[j-1]) := t[j] + m*q[j] + C
	// 		t[N-1] = C + A
	
    MOVQ x+8(FP), R9
    MOVQ y+16(FP), R10
    XORQ DX, DX
    MOVQ 0(R10), DX
    MULXQ 0(R9), CX, BX
    MULXQ 8(R9), AX, BP
    ADOXQ AX, BX
    MULXQ 16(R9), AX, SI
    ADOXQ AX, BP
    MULXQ 24(R9), AX, DI
    ADOXQ AX, SI
    MULXQ 32(R9), AX, R8
    ADOXQ AX, DI
    MULXQ 40(R9), AX, R11
    ADOXQ AX, R8
    // add the last carries to R11
    MOVQ $0x0000000000000000, DX
    ADCXQ DX, R11
    ADOXQ DX, R11
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R12
    ADCXQ CX, AX
    MOVQ R12, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R11, R8
    XORQ DX, DX
    MOVQ 8(R10), DX
    MULXQ 0(R9), AX, R11
    ADOXQ AX, CX
    ADCXQ R11, BX
    MULXQ 8(R9), AX, R11
    ADOXQ AX, BX
    ADCXQ R11, BP
    MULXQ 16(R9), AX, R11
    ADOXQ AX, BP
    ADCXQ R11, SI
    MULXQ 24(R9), AX, R11
    ADOXQ AX, SI
    ADCXQ R11, DI
    MULXQ 32(R9), AX, R11
    ADOXQ AX, DI
    ADCXQ R11, R8
    MULXQ 40(R9), AX, R11
    ADOXQ AX, R8
    // add the last carries to R11
    MOVQ $0x0000000000000000, DX
    ADCXQ DX, R11
    ADOXQ DX, R11
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R12
    ADCXQ CX, AX
    MOVQ R12, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R11, R8
    XORQ DX, DX
    MOVQ 16(R10), DX
    MULXQ 0(R9), AX, R11
    ADOXQ AX, CX
    ADCXQ R11, BX
    MULXQ 8(R9), AX, R11
    ADOXQ AX, BX
    ADCXQ R11, BP
    MULXQ 16(R9), AX, R11
    ADOXQ AX, BP
    ADCXQ R11, SI
    MULXQ 24(R9), AX, R11
    ADOXQ AX, SI
    ADCXQ R11, DI
    MULXQ 32(R9), AX, R11
    ADOXQ AX, DI
    ADCXQ R11, R8
    MULXQ 40(R9), AX, R11
    ADOXQ AX, R8
    // add the last carries to R11
    MOVQ $0x0000000000000000, DX
    ADCXQ DX, R11
    ADOXQ DX, R11
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R12
    ADCXQ CX, AX
    MOVQ R12, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R11, R8
    XORQ DX, DX
    MOVQ 24(R10), DX
    MULXQ 0(R9), AX, R11
    ADOXQ AX, CX
    ADCXQ R11, BX
    MULXQ 8(R9), AX, R11
    ADOXQ AX, BX
    ADCXQ R11, BP
    MULXQ 16(R9), AX, R11
    ADOXQ AX, BP
    ADCXQ R11, SI
    MULXQ 24(R9), AX, R11
    ADOXQ AX, SI
    ADCXQ R11, DI
    MULXQ 32(R9), AX, R11
    ADOXQ AX, DI
    ADCXQ R11, R8
    MULXQ 40(R9), AX, R11
    ADOXQ AX, R8
    // add the last carries to R11
    MOVQ $0x0000000000000000, DX
    ADCXQ DX, R11
    ADOXQ DX, R11
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R12
    ADCXQ CX, AX
    MOVQ R12, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R11, R8
    XORQ DX, DX
    MOVQ 32(R10), DX
    MULXQ 0(R9), AX, R11
    ADOXQ AX, CX
    ADCXQ R11, BX
    MULXQ 8(R9), AX, R11
    ADOXQ AX, BX
    ADCXQ R11, BP
    MULXQ 16(R9), AX, R11
    ADOXQ AX, BP
    ADCXQ R11, SI
    MULXQ 24(R9), AX, R11
    ADOXQ AX, SI
    ADCXQ R11, DI
    MULXQ 32(R9), AX, R11
    ADOXQ AX, DI
    ADCXQ R11, R8
    MULXQ 40(R9), AX, R11
    ADOXQ AX, R8
    // add the last carries to R11
    MOVQ $0x0000000000000000, DX
    ADCXQ DX, R11
    ADOXQ DX, R11
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R12
    ADCXQ CX, AX
    MOVQ R12, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R11, R8
    XORQ DX, DX
    MOVQ 40(R10), DX
    MULXQ 0(R9), AX, R11
    ADOXQ AX, CX
    ADCXQ R11, BX
    MULXQ 8(R9), AX, R11
    ADOXQ AX, BX
    ADCXQ R11, BP
    MULXQ 16(R9), AX, R11
    ADOXQ AX, BP
    ADCXQ R11, SI
    MULXQ 24(R9), AX, R11
    ADOXQ AX, SI
    ADCXQ R11, DI
    MULXQ 32(R9), AX, R11
    ADOXQ AX, DI
    ADCXQ R11, R8
    MULXQ 40(R9), AX, R11
    ADOXQ AX, R8
    // add the last carries to R11
    MOVQ $0x0000000000000000, DX
    ADCXQ DX, R11
    ADOXQ DX, R11
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R12
    ADCXQ CX, AX
    MOVQ R12, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R11, R8
    MOVQ res+0(FP), R9
    MOVQ CX, R13
    SUBQ ·qElement+0(SB), R13
    MOVQ BX, R14
    SBBQ ·qElement+8(SB), R14
    MOVQ BP, R15
    SBBQ ·qElement+16(SB), R15
    MOVQ SI, R10
    SBBQ ·qElement+24(SB), R10
    MOVQ DI, R11
    SBBQ ·qElement+32(SB), R11
    MOVQ R8, R12
    SBBQ ·qElement+40(SB), R12
    CMOVQCC R13, CX
    CMOVQCC R14, BX
    CMOVQCC R15, BP
    CMOVQCC R10, SI
    CMOVQCC R11, DI
    CMOVQCC R12, R8
    MOVQ CX, 0(R9)
    MOVQ BX, 8(R9)
    MOVQ BP, 16(R9)
    MOVQ SI, 24(R9)
    MOVQ DI, 32(R9)
    MOVQ R8, 40(R9)
    RET

TEXT ·_squareADXElement(SB), NOSPLIT, $0-16

	// the algorithm is described here
	// https://hackmd.io/@zkteam/modular_multiplication
	// for i=0 to N-1
	// A, t[i] = x[i] * x[i] + t[i]
	// p = 0
	// for j=i+1 to N-1
	//     p,A,t[j] = 2*x[j]*x[i] + t[j] + (p,A)
	// m = t[0] * q'[0]
	// C, _ = t[0] + q[0]*m
	// for j=1 to N-1
	//     C, t[j-1] = q[j]*m +  t[j] + C
	// t[N-1] = C + A

	// if adx and mulx instructions are not available, uses MUL algorithm.
	
    MOVQ x+8(FP), R9
    XORQ AX, AX
    MOVQ 0(R9), DX
    MULXQ 8(R9), R11, R12
    MULXQ 16(R9), AX, R13
    ADCXQ AX, R12
    MULXQ 24(R9), AX, R14
    ADCXQ AX, R13
    MULXQ 32(R9), AX, R15
    ADCXQ AX, R14
    MULXQ 40(R9), AX, R10
    ADCXQ AX, R15
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R10
    XORQ AX, AX
    MULXQ DX, CX, DX
    ADCXQ R11, R11
    MOVQ R11, BX
    ADOXQ DX, BX
    ADCXQ R12, R12
    MOVQ R12, BP
    ADOXQ AX, BP
    ADCXQ R13, R13
    MOVQ R13, SI
    ADOXQ AX, SI
    ADCXQ R14, R14
    MOVQ R14, DI
    ADOXQ AX, DI
    ADCXQ R15, R15
    MOVQ R15, R8
    ADOXQ AX, R8
    ADCXQ R10, R10
    ADOXQ AX, R10
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    MULXQ ·qElement+0(SB), AX, R11
    ADCXQ CX, AX
    MOVQ R11, CX
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R10, R8
    XORQ AX, AX
    MOVQ 8(R9), DX
    MULXQ 16(R9), R12, R13
    MULXQ 24(R9), AX, R14
    ADCXQ AX, R13
    MULXQ 32(R9), AX, R15
    ADCXQ AX, R14
    MULXQ 40(R9), AX, R10
    ADCXQ AX, R15
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R10
    XORQ AX, AX
    ADCXQ R12, R12
    ADOXQ R12, BP
    ADCXQ R13, R13
    ADOXQ R13, SI
    ADCXQ R14, R14
    ADOXQ R14, DI
    ADCXQ R15, R15
    ADOXQ R15, R8
    ADCXQ R10, R10
    ADOXQ AX, R10
    XORQ AX, AX
    MULXQ DX, AX, DX
    ADOXQ AX, BX
    MOVQ $0x0000000000000000, AX
    ADOXQ DX, BP
    ADOXQ AX, SI
    ADOXQ AX, DI
    ADOXQ AX, R8
    ADOXQ AX, R10
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    MULXQ ·qElement+0(SB), AX, R11
    ADCXQ CX, AX
    MOVQ R11, CX
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R10, R8
    XORQ AX, AX
    MOVQ 16(R9), DX
    MULXQ 24(R9), R12, R13
    MULXQ 32(R9), AX, R14
    ADCXQ AX, R13
    MULXQ 40(R9), AX, R10
    ADCXQ AX, R14
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R10
    XORQ AX, AX
    ADCXQ R12, R12
    ADOXQ R12, SI
    ADCXQ R13, R13
    ADOXQ R13, DI
    ADCXQ R14, R14
    ADOXQ R14, R8
    ADCXQ R10, R10
    ADOXQ AX, R10
    XORQ AX, AX
    MULXQ DX, AX, DX
    ADOXQ AX, BP
    MOVQ $0x0000000000000000, AX
    ADOXQ DX, SI
    ADOXQ AX, DI
    ADOXQ AX, R8
    ADOXQ AX, R10
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    MULXQ ·qElement+0(SB), AX, R15
    ADCXQ CX, AX
    MOVQ R15, CX
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R10, R8
    XORQ AX, AX
    MOVQ 24(R9), DX
    MULXQ 32(R9), R11, R12
    MULXQ 40(R9), AX, R10
    ADCXQ AX, R12
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R10
    XORQ AX, AX
    ADCXQ R11, R11
    ADOXQ R11, DI
    ADCXQ R12, R12
    ADOXQ R12, R8
    ADCXQ R10, R10
    ADOXQ AX, R10
    XORQ AX, AX
    MULXQ DX, AX, DX
    ADOXQ AX, SI
    MOVQ $0x0000000000000000, AX
    ADOXQ DX, DI
    ADOXQ AX, R8
    ADOXQ AX, R10
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    MULXQ ·qElement+0(SB), AX, R13
    ADCXQ CX, AX
    MOVQ R13, CX
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R10, R8
    XORQ AX, AX
    MOVQ 32(R9), DX
    MULXQ 40(R9), R14, R10
    ADCXQ R14, R14
    ADOXQ R14, R8
    ADCXQ R10, R10
    ADOXQ AX, R10
    XORQ AX, AX
    MULXQ DX, AX, DX
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADOXQ DX, R8
    ADOXQ AX, R10
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    MULXQ ·qElement+0(SB), AX, R15
    ADCXQ CX, AX
    MOVQ R15, CX
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R10, R8
    XORQ AX, AX
    MOVQ 40(R9), DX
    MULXQ DX, AX, R10
    ADCXQ AX, R8
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R10
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    MULXQ ·qElement+0(SB), AX, R11
    ADCXQ CX, AX
    MOVQ R11, CX
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ R10, R8
    MOVQ res+0(FP), R12
    MOVQ CX, R13
    SUBQ ·qElement+0(SB), R13
    MOVQ BX, R14
    SBBQ ·qElement+8(SB), R14
    MOVQ BP, R15
    SBBQ ·qElement+16(SB), R15
    MOVQ SI, R11
    SBBQ ·qElement+24(SB), R11
    MOVQ DI, R9
    SBBQ ·qElement+32(SB), R9
    MOVQ R8, R10
    SBBQ ·qElement+40(SB), R10
    CMOVQCC R13, CX
    CMOVQCC R14, BX
    CMOVQCC R15, BP
    CMOVQCC R11, SI
    CMOVQCC R9, DI
    CMOVQCC R10, R8
    MOVQ CX, 0(R12)
    MOVQ BX, 8(R12)
    MOVQ BP, 16(R12)
    MOVQ SI, 24(R12)
    MOVQ DI, 32(R12)
    MOVQ R8, 40(R12)
    RET

TEXT ·subElement(SB), NOSPLIT, $0-24
    XORQ DX, DX
    MOVQ x+8(FP), R9
    MOVQ 0(R9), CX
    MOVQ 8(R9), BX
    MOVQ 16(R9), BP
    MOVQ 24(R9), SI
    MOVQ 32(R9), DI
    MOVQ 40(R9), R8
    MOVQ y+16(FP), R9
    SUBQ 0(R9), CX
    SBBQ 8(R9), BX
    SBBQ 16(R9), BP
    SBBQ 24(R9), SI
    SBBQ 32(R9), DI
    SBBQ 40(R9), R8
    MOVQ $0x8508c00000000001, R10
    CMOVQCC DX, R10
    MOVQ $0x170b5d4430000000, R11
    CMOVQCC DX, R11
    MOVQ $0x1ef3622fba094800, R12
    CMOVQCC DX, R12
    MOVQ $0x1a22d9f300f5138f, R13
    CMOVQCC DX, R13
    MOVQ $0xc63b05c06ca1493b, R14
    CMOVQCC DX, R14
    MOVQ $0x01ae3a4617c510ea, R15
    CMOVQCC DX, R15
    MOVQ res+0(FP), R9
    ADDQ R10, CX
    MOVQ CX, 0(R9)
    ADCQ R11, BX
    MOVQ BX, 8(R9)
    ADCQ R12, BP
    MOVQ BP, 16(R9)
    ADCQ R13, SI
    MOVQ SI, 24(R9)
    ADCQ R14, DI
    MOVQ DI, 32(R9)
    ADCQ R15, R8
    MOVQ R8, 40(R9)
    RET

TEXT ·_fromMontADXElement(SB), NOSPLIT, $0-8

	// the algorithm is described here
	// https://hackmd.io/@zkteam/modular_multiplication
	// when y = 1 we have: 
	// for i=0 to N-1
	// 		t[i] = x[i]
	// for i=0 to N-1
	// 		m := t[0]*q'[0] mod W
	// 		C,_ := t[0] + m*q[0]
	// 		for j=1 to N-1
	// 		    (C,t[j-1]) := t[j] + m*q[j] + C
	// 		t[N-1] = C
    MOVQ res+0(FP), R9
    MOVQ 0(R9), CX
    MOVQ 8(R9), BX
    MOVQ 16(R9), BP
    MOVQ 24(R9), SI
    MOVQ 32(R9), DI
    MOVQ 40(R9), R8
    XORQ DX, DX
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R10
    ADCXQ CX, AX
    MOVQ R10, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ AX, R8
    XORQ DX, DX
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R10
    ADCXQ CX, AX
    MOVQ R10, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ AX, R8
    XORQ DX, DX
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R10
    ADCXQ CX, AX
    MOVQ R10, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ AX, R8
    XORQ DX, DX
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R10
    ADCXQ CX, AX
    MOVQ R10, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ AX, R8
    XORQ DX, DX
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R10
    ADCXQ CX, AX
    MOVQ R10, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ AX, R8
    XORQ DX, DX
    MOVQ CX, DX
    MULXQ ·qElementInv0(SB), DX, AX                        // m := t[0]*q'[0] mod W
    XORQ AX, AX
    // C,_ := t[0] + m*q[0]
    MULXQ ·qElement+0(SB), AX, R10
    ADCXQ CX, AX
    MOVQ R10, CX
    // for j=1 to N-1
    //     (C,t[j-1]) := t[j] + m*q[j] + C
    ADCXQ BX, CX
    MULXQ ·qElement+8(SB), AX, BX
    ADOXQ AX, CX
    ADCXQ BP, BX
    MULXQ ·qElement+16(SB), AX, BP
    ADOXQ AX, BX
    ADCXQ SI, BP
    MULXQ ·qElement+24(SB), AX, SI
    ADOXQ AX, BP
    ADCXQ DI, SI
    MULXQ ·qElement+32(SB), AX, DI
    ADOXQ AX, SI
    ADCXQ R8, DI
    MULXQ ·qElement+40(SB), AX, R8
    ADOXQ AX, DI
    MOVQ $0x0000000000000000, AX
    ADCXQ AX, R8
    ADOXQ AX, R8
    MOVQ CX, R11
    SUBQ ·qElement+0(SB), R11
    MOVQ BX, R12
    SBBQ ·qElement+8(SB), R12
    MOVQ BP, R13
    SBBQ ·qElement+16(SB), R13
    MOVQ SI, R14
    SBBQ ·qElement+24(SB), R14
    MOVQ DI, R15
    SBBQ ·qElement+32(SB), R15
    MOVQ R8, R10
    SBBQ ·qElement+40(SB), R10
    CMOVQCC R11, CX
    CMOVQCC R12, BX
    CMOVQCC R13, BP
    CMOVQCC R14, SI
    CMOVQCC R15, DI
    CMOVQCC R10, R8
    MOVQ CX, 0(R9)
    MOVQ BX, 8(R9)
    MOVQ BP, 16(R9)
    MOVQ SI, 24(R9)
    MOVQ DI, 32(R9)
    MOVQ R8, 40(R9)
    RET

TEXT ·reduceElement(SB), NOSPLIT, $0-8
    MOVQ res+0(FP), CX
    MOVQ 0(CX), BX
    MOVQ 8(CX), BP
    MOVQ 16(CX), SI
    MOVQ 24(CX), DI
    MOVQ 32(CX), R8
    MOVQ 40(CX), R9
    MOVQ BX, R10
    SUBQ ·qElement+0(SB), R10
    MOVQ BP, R11
    SBBQ ·qElement+8(SB), R11
    MOVQ SI, R12
    SBBQ ·qElement+16(SB), R12
    MOVQ DI, R13
    SBBQ ·qElement+24(SB), R13
    MOVQ R8, R14
    SBBQ ·qElement+32(SB), R14
    MOVQ R9, R15
    SBBQ ·qElement+40(SB), R15
    CMOVQCC R10, BX
    CMOVQCC R11, BP
    CMOVQCC R12, SI
    CMOVQCC R13, DI
    CMOVQCC R14, R8
    CMOVQCC R15, R9
    MOVQ BX, 0(CX)
    MOVQ BP, 8(CX)
    MOVQ SI, 16(CX)
    MOVQ DI, 24(CX)
    MOVQ R8, 32(CX)
    MOVQ R9, 40(CX)
    RET

TEXT ·addElement(SB), NOSPLIT, $0-24
    MOVQ x+8(FP), AX
    MOVQ 0(AX), CX
    MOVQ 8(AX), BX
    MOVQ 16(AX), BP
    MOVQ 24(AX), SI
    MOVQ 32(AX), DI
    MOVQ 40(AX), R8
    MOVQ y+16(FP), AX
    ADDQ 0(AX), CX
    ADCQ 8(AX), BX
    ADCQ 16(AX), BP
    ADCQ 24(AX), SI
    ADCQ 32(AX), DI
    ADCQ 40(AX), R8
    // note that we don't check for the carry here, as this code was generated assuming F.NoCarry condition is set
    // (see goff for more details)
    MOVQ res+0(FP), AX
    MOVQ CX, R9
    SUBQ ·qElement+0(SB), R9
    MOVQ BX, R10
    SBBQ ·qElement+8(SB), R10
    MOVQ BP, R11
    SBBQ ·qElement+16(SB), R11
    MOVQ SI, R12
    SBBQ ·qElement+24(SB), R12
    MOVQ DI, R13
    SBBQ ·qElement+32(SB), R13
    MOVQ R8, R14
    SBBQ ·qElement+40(SB), R14
    CMOVQCC R9, CX
    CMOVQCC R10, BX
    CMOVQCC R11, BP
    CMOVQCC R12, SI
    CMOVQCC R13, DI
    CMOVQCC R14, R8
    MOVQ CX, 0(AX)
    MOVQ BX, 8(AX)
    MOVQ BP, 16(AX)
    MOVQ SI, 24(AX)
    MOVQ DI, 32(AX)
    MOVQ R8, 40(AX)
    RET

TEXT ·doubleElement(SB), NOSPLIT, $0-16
    MOVQ x+8(FP), AX
    MOVQ 0(AX), CX
    MOVQ 8(AX), BX
    MOVQ 16(AX), BP
    MOVQ 24(AX), SI
    MOVQ 32(AX), DI
    MOVQ 40(AX), R8
    ADDQ CX, CX
    ADCQ BX, BX
    ADCQ BP, BP
    ADCQ SI, SI
    ADCQ DI, DI
    ADCQ R8, R8
    // note that we don't check for the carry here, as this code was generated assuming F.NoCarry condition is set
    // (see goff for more details)
    MOVQ res+0(FP), AX
    MOVQ CX, R9
    SUBQ ·qElement+0(SB), R9
    MOVQ BX, R10
    SBBQ ·qElement+8(SB), R10
    MOVQ BP, R11
    SBBQ ·qElement+16(SB), R11
    MOVQ SI, R12
    SBBQ ·qElement+24(SB), R12
    MOVQ DI, R13
    SBBQ ·qElement+32(SB), R13
    MOVQ R8, R14
    SBBQ ·qElement+40(SB), R14
    CMOVQCC R9, CX
    CMOVQCC R10, BX
    CMOVQCC R11, BP
    CMOVQCC R12, SI
    CMOVQCC R13, DI
    CMOVQCC R14, R8
    MOVQ CX, 0(AX)
    MOVQ BX, 8(AX)
    MOVQ BP, 16(AX)
    MOVQ SI, 24(AX)
    MOVQ DI, 32(AX)
    MOVQ R8, 40(AX)
    RET
