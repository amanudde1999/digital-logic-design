----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Shyama Gandhi, Amro Amanuddein and Ahmed Ahmed
-- 
-- Create Date: 10/06/2021 02:31:27 PM
-- Design Name: 
-- Module Name: full_adder_2bit - Behavioral
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

entity full_adder_2bit is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (1 downto 0);
           c_out : out STD_LOGIC);
end full_adder_2bit;

architecture Behavioral of full_adder_2bit is
signal c_intermediate: STD_LOGIC;
component full_adder_1bit is 
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

begin
adder1bit_0: full_adder_1bit port map(a=>A(0), b=>B(0), c_in => c_in, sum=>sum(0), c_out=>c_intermediate);
adder1bit_1: full_adder_1bit port map(a=>A(1), b=>B(1), c_in => c_intermediate, sum=>sum(1), c_out=>c_out);
end Behavioral;
