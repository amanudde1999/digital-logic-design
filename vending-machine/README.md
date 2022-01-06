# vending-machine

**Description:** This repository contains the source code for a implementing a vending machine that dispenses a granola bar or a soft drink that cost $2 and $4 respectively based on the value of the coins inserted. This vending machine is only able to accept denominations of $1, $2 and $3. Firstly, the user selects which item they want and then inserts sufficient coins to make the purchase and if the entered amount is enough for the selected item then the change is given to the customer (if any) and then the product is dispensed.

Finite State Machine State Diagram
----------------------------------

![alt text](../vending-machine/FSM2.jpg?raw=true)

**Explanation:** For this vending machine’s FSM, there were a total of 7 states, 6 of them corresponded to the total amount the user had inserted and the last state is the dispensed state. The annotations on
the arrows on the above FSM diagram are of the form Input/Output. The input is 3 bits where the first two bits represent the value of the coin inserted and the last bit represents which item was selected, where 0 is soft drink and 1 is granola. For example “111” (for the input) represents a $3 coin inserted and a granola selected and “100” represents $2 coin inserted and a soft drink inserted. The output on the other hand is 2 bits representing the value of change that is returned. Moreover, in the FSM diagram the “X” stands for dont cares. For this vending machine, if the required amount of money was inserted then the customer is not able to insert more coins. For example, if the user selects a soft drink and reaches “$3” (sum_3 in VHDL code) state by inserting a $3 coin then there is no point in them (in this vending machine) inserting more coins.

Register Transfer Level (RTL) Schematic
--------------------------------------
![alt text](../vending-machine/RTLPart2.PNG?raw=true)

Simulation Results from Testbench
----------------------------------
![alt text](../vending-machine/SimuPart2.PNG?raw=true)

**Explanation:** In this part of the lab we designed a testbench file called *vending_m_tb.vhd* that would take us through a couple of different test-cases. To start we set item selection to 0 and coins to 2. 1 clock cycle after our 2 coins are inputted we see an output of one soft drink with a change of $0. This makes sense since the soft drink corresponds to item selection 0 and costs $2. We then hit the reset and change item selection to 1, we also change the coins to 3. After 2 clock cycles $6 has been inserted and we see change dispensed is 2 dollars and a granola bar is dispensed. This makes sense since the granola bar is $4 and based on the constraints of the vending machine design we cannot enter more coins if we have entered a sufficient amount for the item.
