## Simulation Commands
```bash
iverilog -o iverilog -o master_slave master_fsm.v slave_fsm.v link_top.v tb4.v
vvp master_slave
gtkwave wave4.vcd

