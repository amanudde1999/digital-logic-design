----------------------------------------------------------------------------------
-- Company: Department of Electrical and Computer Engineering, University of Alberta
-- Engineer: Shyama Gandhi and Bruce Cockburn
-- 
-- Create Date: 08/10/2020 11:28:43 AM
-- Design Name: 
-- Module Name: s0_16_1_mux - Behavioral
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

entity S0_mux is
  Port ( cin        : in std_logic;
         select_in  : in std_logic_vector(3 downto 0);
         y_s0       : out std_logic );
end S0_mux;

architecture Behavioral of S0_mux is

begin
    process(cin,select_in)
    begin
    -- write the input line functions generated for 16:1 to derive the S(0) output.
    -- The input lines can be '0' / '1' / Cin / (not) Cin.
    -- It is possible to use if...else or case statements here. 
    case select_in is 
    when "0000" => y_s0 <= cin;
    when "0001" => y_s0 <= not cin;
    when "0010" => y_s0 <= cin;
    when "0011" => y_s0 <= not cin;
    when "0100" => y_s0 <= not cin;
    when "0101" => y_s0 <= cin;
    when "0110" => y_s0 <= not cin;
    when "0111" => y_s0 <= cin;
    when "1000" => y_s0 <= cin;
    when "1001" => y_s0 <= not cin;
    when "1010" => y_s0 <= cin;
    when "1011" => y_s0 <= not cin;
    when "1100" => y_s0 <= not cin;
    when "1101" => y_s0 <= cin;
    when "1110" => y_s0 <= not cin;
    when others => y_s0 <= cin;
    -- Write the VHDL codes for all the input cases.
    end case;    
    end process;

end Behavioral;
