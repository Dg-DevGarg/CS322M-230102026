## Handshake Simulation Log

| Time (ns) | req | ack | data | last_byte | done |
|-----------|-----|-----|------|-----------|------|
| 0         | x   | x   | xx   | xx        | x    |
| 5000      | 0   | 0   | a0   | 00        | 0    |
| 15000     | 1   | 0   | a0   | 00        | 0    |
| 25000     | 1   | 1   | a0   | 00        | 0    |
| 35000     | 0   | 1   | a0   | a0        | 0    |
| 65000     | 0   | 0   | a0   | a0        | 0    |
| 75000     | 0   | 0   | a1   | a0        | 0    |
| 85000     | 1   | 0   | a1   | a0        | 0    |
| 95000     | 1   | 1   | a1   | a0        | 0    |
| 105000    | 0   | 1   | a1   | a1        | 0    |
| 135000    | 0   | 0   | a1   | a1        | 0    |
| 145000    | 0   | 0   | a2   | a1        | 0    |
| 155000    | 1   | 0   | a2   | a1        | 0    |
| 165000    | 1   | 1   | a2   | a1        | 0    |
| 175000    | 0   | 1   | a2   | a2        | 0    |
| 205000    | 0   | 0   | a2   | a2        | 0    |
| 215000    | 0   | 0   | a3   | a2        | 0    |
| 225000    | 1   | 0   | a3   | a2        | 0    |
| 235000    | 1   | 1   | a3   | a2        | 0    |
| 245000    | 0   | 1   | a3   | a3        | 0    |
| 275000    | 0   | 0   | a3   | a3        | 0    |
| 285000    | 0   | 0   | a4   | a3        | 0    |
| 295000    | 0   | 0   | a4   | a3        | 1    |



## Simulation Commands
```bash
iverilog -o iverilog -o master_slave master_fsm.v slave_fsm.v link_top.v tb4.v
vvp master_slave
gtkwave wave4.vcd

