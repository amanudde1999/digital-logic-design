# overlap-sequence-detector
**Description**: This repository contains the source code for a "11011" overlap sequence detector using a Mealy Finite State Machine.

Finite State Machine State Diagram
----------------------------------
![alt text](../mealy-sequence-detector/FSM1.jpg?raw=true)

**Explanation:** Initially, before any of the sequence of bits arrive the current state would be the “Idle” state
(denoted as “A” in the VHDL code). To have “S1” (denoted as “B” in the VHDL code) as the next
state, the incoming bit would have to be a 1, if the received bit is a 0 the next state would be
“Idle. The arrows on the above FSM diagram indicate this, the annotations on the arrows are in
Input/Output form where the input is the bit received and the output indicates whether the
“11011” sequence has been detected or not. If the output is 1 this implies that the “11011”
sequence has been detected, if it is 0 then the sequence has not been detected yet. When the
current state is “S1”, the next state is “S11” (denoted by “C” in VHDL code) if the next bit is a 1,
otherwise we go back to the “Idle” state since the sequence has been broken (10). If the current
state is “S11”, if the next bit received is 1 then since this is an overlapping sequence detector,
the sequence will not be broken (i.e. 110 is the same as 1110) and the next state will be “S11”,
however, if a 0 is received then the next state is “S110”(denoted by “D” in VHDL code). When the
current state is “S110”, upon receiving a 0, the sequence is broken (1100) and the next state
would be the “Idle”, on the other hand, if the next bit is a 1 then the next state is “S1101”
(denoted by “E” in VHDL code). For the “S1101” state, if the incoming bit is 0 then the sequence
is broken (11010) and the next state is “Idle”, and if the incoming bit is 1 then the sequence is
complete and the output is 1 (green led lights up in our case). Since this is an overlapping
sequence detector, when we have completed the sequence, we are sent back to the “S11” ; this
is because we can continue from the last two bits (11) and complete another sequence. For
example, if “11011011” is the input, then the sequence would have been detected twice. These
states were implemented using user-defined scalar types in the VHDL code.

Register Transfer Level (RTL) Schematic
--------------------------------------
![alt text](../mealy-sequence-detector/RTLSchematicPart1.PNG?raw=true)

Simulation Results from Testbench
-----------------------------------
Using the seq_fsm_tb.vhd file, the following simulation results were obtained.

![alt text](../mealy-sequence-detector/SeqDetectorSimulation.PNG?raw=true)

**Explanation:** Starting from the left, for two rising clock edges a 1 is detected
and for the next rising edge a 0 is detected, lastly for the next two rising clock edges a 1 is
appended to the sequence. This results in an output of 1 as shown. Moreover, we tested the
reset functionality and as expected when the sequence was completed again (11011 was
detected) and the output was supposed to be high it was not since the reset was high and due
to this, the sequence was restarted. Shown below in Figure 8 are the test cases we used to test
this design. As shown from the code, we are feeding the sequence_in one bit at a time per clock
period.

