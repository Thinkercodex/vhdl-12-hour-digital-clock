# vhdl-12-hour-digital-clock
A 12-hour (AM/PM) digital clock, created using VHDL, to be added and compiled in an Intel Quartus project to generate an output file that can be downloaded onto an FPGA

## Design
A clock signal from an FPGA will be sent to the clock tuner module to generate a (1/60)Hz signal.

The (1/60)Hz signal will be used to synchronize all counters implemented in the design.

A switch input from the FPGA will be sent to a module 60 counter package (which represents the minutes of the digital clock), whose output will be directed to the radix 10 to seven-segment display converter module and to the module 12 counter package (which represents the hours of the digital clock).

Once the value of the output from the module 60 counter package reaches its maximum counting stage, the module 12 counter circuit will be enabled to count one stage up. The output of this module 12 counter package will be sent to the radix 10 to seven-segment display converter module and to the module 2 counter package (which is used to determine if the clock should be displaying an 'A' for AM or a 'P' for PM).

Once the output value from the module 12 counter package reaches its maximum counting stage, the module 2 counter circuit will be enabled to count one stage up. The output of this module 2 counter package will be sent to the radix 2 to AM/PM converter module.

The module 60 counter circuit and module 12 counter circuit outputs are each sent to a radix 10 to seven-segment display converter module. This module converts the binary encoded radix 10 values stored in each counter into a seven-segment display encoded signal. The outputs from the converter processing the module 60 counter circuit's output is passed to two seven-segment displays to show the minute value (from 00 to 59) and the outputs from the converter processing the module 12 counter circuit's output is passed to two different seven-segment displays to show the hour value (from 01 to 12).

Finally, the output from the module 2 counter is sent to a radix 2 to AM/PM converter module. This module converts the bit value into the seven-segment encoded value of 'A' when the bit is '0' and the value of 'P' when the bit is '1'. This seven-segment encoded signal is sent from this converter module to a seven-segment display along with two signals sent constantly to two different seven-segment displays that were encoded to represent the character 'M'.

When assigning the pins for the FPGA that will be computing this project, the expected seven-segment display arrangement is:
[HOUR][HOUR][MINUTE][MINUTE][A/P][LEFT HALF OF M][RIGHT HALF OF M]

Example of an expected seven-segment display output:

```
 _   _      _   _   _   _
| |  _| |_| _| |_| | | | |
|_| |_    | _| | | |     |
```
