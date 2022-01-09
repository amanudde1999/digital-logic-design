----------------------------------------------------------------------------------
-- Company: Department of Electrical and Computer Engineering, University of Alberta
-- Engineer: Shyama Gandhi and Bruce Cockburn
-- 
-- Create Date: 08/10/2020 10:04:58 AM
-- Design Name: 
-- Module Name: fa_2bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 2-BIT FULL ADDER CREATED USING THREE 16:1 MULTIPLEXERS each for carry out, S(1) and S(0).
            --  The components for S0, S1 and C0 are to be included in this top module using the port map statements.
        
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
use IEEE.std_logic_unsigned.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_2bit is
  Port ( A      : in std_logic_vector(1 downto 0); --input vector A
         B      : in std_logic_vector(1 downto 0); --input vector B
         C_in   : in std_logic;                    --CARRY INPUT : 0/1
         Sum    : out std_logic_vector(1 downto 0);--sum output
         C_out  : out std_logic;
         led6_r : out std_logic;
         led6_g : out std_logic;
         led6_b : out std_logic
         );                   --carry output
         --compare_result : out std_logic_vector(2 downto 0));  -- compare the input vector A and B : mapped to RGB led in xdc file
end full_adder_2bit;

architecture Behavioral of full_adder_2bit is

component Co_mux is
  Port ( cin        : in std_logic;
         select_in  : in std_logic_vector(3 downto 0);
         y_cout     : out std_logic );
end component;

component S1_mux is
  Port ( cin        : in std_logic;
         select_in  : in std_logic_vector(3 downto 0);
         y_s1       : out std_logic );
end component;

component S0_mux is
  Port ( cin        : in std_logic;
         select_in  : in std_logic_vector(3 downto 0);
         y_s0       : out std_logic );
end component;

begin

-- PART 3....
-- The "LD6" - RGB led on board is used as an indication if A>B or A<B or A=B. 
-- Write 3 lines of conditional signal assignment code (say using "WHEN/ELSE")
-- to turn the LED red when A>B, green when A<B and blue when A=B.
    -- led6_r
    -- led6_b
    -- led6_g
    led6_r <= '1' when unsigned(A) > unsigned(B) else '0';
    led6_b <= '1' when unsigned(A) = unsigned(B) else '0';
    led6_g <= '1' when unsigned(A) < unsigned(B) else '0';

    

                      
    -- port map the component for generating carry output                     
    carry_map : Co_mux port map( cin                   => C_in,
                                        select_in(3 downto 2) => A,
                                        select_in(1 downto 0) => B, 
                                        y_cout                => C_out);

    -- port map the component for generating the S(1)
    carry_map_S1 : S1_mux port map( cin                   => C_in,
                                            select_in(3 downto 2) => A,
                                            select_in(1 downto 0) => B, 
                                            y_s1                => Sum(1));
    

    -- port map the component for generating the S(0)                                    
    carry_map_S0 : S0_mux port map( cin                   => C_in,
                                            select_in(3 downto 2) => A,
                                            select_in(1 downto 0) => B, 
                                            y_s0                => Sum(0));
                                      
end Behavioral;
