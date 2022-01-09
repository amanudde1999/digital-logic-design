----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Shyama Gandhi, Amro Amanuddein and Ahmed Ahmed
-- 
-- Create Date: 10/03/2021 11:20:10 AM
-- Design Name: 
-- Module Name: full_adder_2bit_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_2bit_tb is
--  Port ( );
end full_adder_2bit_tb;

architecture Behavioral of full_adder_2bit_tb is

component full_adder_2bit is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (1 downto 0);
           c_out : out STD_LOGIC);
end component;

component full_adder_1bit is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;


signal A, B : std_logic_vector(1 downto 0);
signal c_in, c_out        : std_logic;
signal sum        : std_logic_vector(1 downto 0);
begin
    Full_adder : full_adder_2bit port map(A => A,
                                B => B,
                                c_in => c_in,
                                sum => Sum,
                                c_out => c_out);
    
    process
        constant time_period : time := 20ns;
        
        begin
 
    -- this is a self checking testbench written for few input combinations of the 2-bit half adder.
    -- Error in Sum and Cout will be reported using this self checking test bench
    -- On generation of the wrong outputs, error is reported in the tcl console window

    -- You must include reasonable number of test cases to verify the working of your design.
    
        ----------------
        A <= "00";
        B <= "00";
        c_in <= '0';
        wait for time_period;
        assert ((sum = "00") and (c_out='0')) --If for A=00 AND B=00, IF S!=00 AND C!=0, then there is an error
        report "Error for input A_in=00 and B_in=00" severity error;
	----------------
	        ----------------
        A <= "10";
        B <= "01";
        c_in <= '0';
        wait for time_period;
        assert ((sum = "11") and (c_out='0')) --If for A=00 AND B=00, IF S!=00 AND C!=0, then there is an error
        report "Error for input A_in=00 and B_in=00" severity error;
	----------------
	        ----------------
        A <= "01";
        B <= "11";
        c_in <= '0';
        wait for time_period;
        assert ((sum = "00") and (c_out='1')) --If for A=00 AND B=00, IF S!=00 AND C!=0, then there is an error
        report "Error for input A_in=00 and B_in=00" severity error;
	----------------
	        ----------------
        A <= "01";
        B <= "01";
        c_in <= '1';
        wait for time_period;
        assert ((sum = "11") and (c_out='0')) --If for A=00 AND B=00, IF S!=00 AND C!=0, then there is an error
        report "Error for input A_in=00 and B_in=00" severity error;
	----------------
        	----------------
        A <= "11";
        B <= "11";
        c_in <= '1';
        wait for time_period;
        assert ((sum = "11") and (c_out='1')) --If for A=00 AND B=00, IF S!=00 AND C!=0, then there is an error
        report "Error for input A_in=00 and B_in=00" severity error;
  	----------------
        	----------------
        A <= "11";
        B <= "11";
        c_in <= '0';
        wait for time_period;
        assert ((sum = "10") and (c_out='1')) --If for A=00 AND B=00, IF S!=00 AND C!=0, then there is an error
        report "Error for input A_in=00 and B_in=00" severity error;
    end process;

end Behavioral;
