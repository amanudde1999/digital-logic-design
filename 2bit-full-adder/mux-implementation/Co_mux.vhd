----------------------------------------------------------------------------------
-- Company: Department of Electrical and Computer Engineering, University of Alberta
-- Engineer: Shyama Gandhi and Bruce Cockburn
-- 
-- Create Date: 08/10/2020 11:28:43 AM
-- Design Name: 
-- Module Name: cout_16_1_mux - Behavioral
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

entity Co_mux is
  Port ( cin        : in std_logic;
         select_in  : in std_logic_vector(3 downto 0);
         y_cout     : out std_logic );
end Co_mux;

architecture Behavioral of Co_mux is

begin
    process(cin,select_in)
    begin
    -- write the input line functions generated for 16:1 to derive the carry output.
    -- The input lines can be '0' / '1' / Cin / (not) Cin.
    -- It is possible to use if...else or case statements here. 
    case select_in is 
    when "0000" =>   y_cout <= '0';
    when "0001" =>   y_cout <= '0';
    when "0010" =>   y_cout <= '0';
    when "0011" =>   y_cout <= cin;
    when "0100" =>   y_cout <= '0';
    when "0101" =>   y_cout <= '0';
    when "0110" =>   y_cout <= cin;
    when "0111" =>   y_cout <= '1';
    when "1000" =>   y_cout <= '0';
    when "1001" =>   y_cout <= cin;
    when "1010" =>   y_cout <= '1';
    when "1011" =>   y_cout <= '1';
    when "1100" =>   y_cout <= cin;
    when "1101" =>   y_cout <= '1';
    when "1110" =>   y_cout <= '1';
    when others =>   y_cout <= '1';
    -- Write the VHDL codes for all the input cases.
    end case;     
    end process;

end Behavioral;
