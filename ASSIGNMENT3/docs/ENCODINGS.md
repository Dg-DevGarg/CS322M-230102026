# ENCODINGS.md

This document lists the exact bitfields for the revised **better test program**: every source register is initialized before use, all custom RVX10 instructions are exercised, and the program ends with a `sw` that writes 25 to address 100.

---

## Instruction formats reminder

* **R-type** (used by RVX10 custom ops)

```
31:25 funct7 | 24:20 rs2 | 19:15 rs1 | 14:12 funct3 | 11:7 rd | 6:0 opcode
```

* **I-type** (`addi`, `lw`)
* **S-type** (`sw`)

Opcode summary:

* `addi`: `0010011`
* `sw`:   `0100011`
* RVX10 custom: `0001011`

---

## Encodings in program order

### Register initializations (I-type addi)

```
00600313   addi x6, x0, 6
00700393   addi x7, x0, 7
00900413   addi x8, x0, 9
00A00493   addi x9, x0, 10
00B00513   addi x10, x0, 11
00C00613   addi x12, x0, 12
00D00693   addi x13, x0, 13
00F00793   addi x15, x0, 15
01000813   addi x16, x0, 16
01200913   addi x18, x0, 18
01300993   addi x19, x0, 19
01500A93   addi x21, x0, 21
01600B13   addi x22, x0, 22
01800C13   addi x24, x0, 24
01900C93   addi x25, x0, 25
01B00D93   addi x27, x0, 27
00300193   addi x3, x0, 3
00400213   addi x4, x0, 4
```

### RVX10 custom ops (R-type, opcode 0x0B)

```
0073028B   andn  x5, x6, x7
00A4940B   orn   x8, x9, x10
00D6258B   xnor  x11, x12, x13
0307870B   min   x14, x15, x16
0339188B   max   x17, x18, x19
036AAA0B   minu  x20, x21, x22
039C3B8B   maxu  x23, x24, x25
043D8D0B   rol   x26, x27, x3
0441108B   ror   x1, x2, x4   (x2 set later)
00E00113   addi  x2, x0, 14   (seed x2 before ROR)
0602018B   abs   x3, x4, x0
```

### Final check (writes 25 to memory[100])

```
01900093   addi x1, x0, 25
02400113   addi x2, x0, 36
04112023   sw   x1, 64(x2)   // address = 36+64 = 100
```

---
