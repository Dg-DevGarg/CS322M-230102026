# README.md

## Overview

This project is a **single-cycle RISC-V processor** (RV32I base with RVX10 custom extension) implemented in SystemVerilog. The processor is based on *Digital Design and Computer Architecture* and extended with 10 custom ALU instructions.

The simulation is verified by a testbench that checks whether the value **25** is written to memory address **100**. If this happens, the message `Simulation succeeded` is printed.

---

## File contents

* **riscvsingle.sv** – Processor implementation, including datapath, control, ALU, register file, instruction/data memories.
* **ENCODINGS.md** – My exact bitfields + worked encodings
* **TESTPLAN.md** – Input values and expected results for each instruction.
* **riscvtest.txt** – Hex program loaded into instruction memory for simulation.

---

## Custom Instructions (RVX10)

These use opcode `0001011` (0x0B):

* ANDN  – bitwise AND with inverted rs2
* ORN   – bitwise OR with inverted rs2
* XNOR  – bitwise XNOR
* MIN   – signed minimum
* MAX   – signed maximum
* MINU  – unsigned minimum
* MAXU  – unsigned maximum
* ROL   – rotate left
* ROR   – rotate right
* ABS   – absolute value

---

## How to run

1. **Compile and simulate**:
   (make sure riscvsingle.sv and riscvtest.txt in same folder)

   ```bash
   iverilog g2012 -o sim riscvsingle.sv
   vvp sim
   ```
   
3. **View waveform**:

   ```bash
   gtkwave wave.vcd
   ```

4. **Check signals**:

   * `PC`, `Instr` → instruction trace
   * `ALUResult` → ALU outputs
   * `rf.rf[...]` → register file values
   * `WriteData`, `DataAdr`, `MemWrite` → memory operations

---

## Program Flow

1. Execute 21 RV32I base instructions (logic, arithmetic, branch, memory).
2. Execute 10 RVX10 custom instructions (each once).
3. Append final instructions:

   ```
   addi x1, x0, 25
   addi x2, x0, 36
   sw   x1, 64(x2)
   ```

   → Writes 25 to address 100.

---

## Expected Outcome

* During simulation, when `MemWrite=1`, `DataAdr=100`, and `WriteData=25`, the testbench prints:

  ```
  Simulation succeeded
  ```
* This indicates that both the base ISA and custom instructions integrate correctly in the datapath.

---

## Extending

* Add funct7
* Add decoding logic
* New ALUOp value 11 for RVX10 kind of instructions
* Add new `{funct7,funct3}` cases in `aludec` and logic in `alu`.
* Encode them into `riscvtest.txt` for verification.

---

