
# 2-bit-full-adder
**Description:** The design of these 2-bit full adders was done using two methods, one which involved instantiating the implemented 1-bit full adder twice to create a two bit full adder (found in the *1bit-implementation* files). The second implementation uses three 16x1 multiplexers which use the look-up tables for S<sub>0</sub>, S<sub>1</sub> and C<sub>out</sub> (found in the *mux-implementation* file).

2-Bit Full Adder Using two 1-Bit full adders
--------------------------------------------
**Description:** Using the boolean expression for S and C<sub>out</sub> shown below obtained from the solved karnaugh map (also shown below), this 1-bit full adder was implemented. Then by instantiating it twice, the 2-bit full adder was completed.
![alt text](../2bit-full-adder/1bit-implementation/Karnaugh.jpg?raw=true)



![alt text](../2bit-full-adder/1bit-implementation/bool_expressions.png?raw=true)


2-Bit Full Adder Using two 1-Bit full adders RTL Schematic
--------------------------------------------

![alt text](../2bit-full-adder/1bit-implementation/full_adder_RTL.PNG?raw=true)

2-Bit Full Adder Using 3, 16x1 Multiplexers
-------------------------------------------
**Description:** Using the truth tables for S<sub>0</sub>, S<sub>1</sub> and C<sub>out</sub> shown below, the 2 bit full adder was also constructed using three 16x1 multiplexers (one for each of S<sub>0</sub>, S<sub>1</sub> and C<sub>out</sub>).

S0
---

![alt text](../2bit-full-adder/mux-implementation/S0_Truth.jpg?raw=true)

S1
---

![alt text](../2bit-full-adder/mux-implementation/S1_Truth.jpg?raw=true)

C<sub>out</sub>
---

![alt text](../2bit-full-adder/mux-implementation/Cout_Truth.jpg?raw=true)



2-Bit Full Adder Using 3, 16x1 Multiplexers RTL Schematic
-------------------------------------------
![alt text](../2bit-full-adder/mux-implementation/mux_adder_RTL.PNG?raw=true)

Simulation Testbench Results
---------------------------
As the simulation does not deal with what the hardware implementation of the 2-bit full adder entails, the simulation results for both implementations provided the same outcome.

![alt text](../2bit-full-adder/full_adder_simulation.PNG?raw=true)

