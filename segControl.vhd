library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity segControl is 
	port (
	
			queue: in integer;
			N_queue: in integer;
			A_queue: in integer;
			dedicated_queue: in std_logic;
			
			
			A_0: out std_logic_vector(6 downto 0) := "0111111";
			A_1: out std_logic_vector(6 downto 0) := "0111111";
			
			N_0: out std_logic_vector(6 downto 0) := "0111111";
			N_1: out std_logic_vector(6 downto 0) := "0111111"
			);
end segControl;

architecture control of segControl is
signal N_units : integer;
signal A_units : integer;
signal q_units : integer;

signal A_tens : integer;
signal N_tens : integer;
signal q_tens : integer;
begin
N_units <= N_queue mod 10 when (N_queue > 0 and N_queue < 16)else
			0;
A_units <= A_queue mod 10 when (A_queue > 0 and A_queue < 16);
q_units <= queue mod 10 when (queue >0 and queue<16);

N_tens <= (N_queue - N_units)/10;
A_tens <= (A_queue - A_units)/10;
q_tens <= (queue - q_units)/10;

N_0 <= "1000000" when (N_units = 0 and dedicated_queue = '0' )else
"1111001" when (N_units = 1 and dedicated_queue = '0' )else
"0100100" when (N_units = 2 and dedicated_queue = '0' )else
"0110000" when (N_units = 3 and dedicated_queue = '0' )else
"0011001" when (N_units = 4 and dedicated_queue = '0' )else
"0010010" when (N_units = 5 and dedicated_queue = '0' )else
"0000011" when (N_units = 6 and dedicated_queue = '0' )else
"1111000" when (N_units = 7 and dedicated_queue = '0' )else
"0000000" when (N_units = 8 and dedicated_queue = '0' )else
"0011000" when (N_units = 9 and dedicated_queue = '0' )else
"1000000" when (q_units = 0 and dedicated_queue = '1' )else
"1111001" when (q_units = 1 and dedicated_queue = '1' )else
"0100100" when (q_units = 2 and dedicated_queue = '1' )else
"0110000" when (q_units = 3 and dedicated_queue = '1' )else
"0011001" when (q_units = 4 and dedicated_queue = '1' )else
"0010010" when (q_units = 5 and dedicated_queue = '1' )else
"0000011" when (q_units = 6 and dedicated_queue = '1' )else
"1111000" when (q_units = 7 and dedicated_queue = '1' )else
"0000000" when (q_units = 8 and dedicated_queue = '1' )else
"0011000" when (q_units = 9 and dedicated_queue = '1' )else
"0111111";

A_0 <= "1000000" when (A_units = 0 and dedicated_queue = '0' )else
"1111001" when (A_units = 1 and dedicated_queue = '0' )else
"0100100" when (A_units = 2 and dedicated_queue = '0' )else
"0110000" when (A_units = 3 and dedicated_queue = '0' )else
"0011001" when (A_units = 4 and dedicated_queue = '0' )else
"0010010" when (A_units = 5 and dedicated_queue = '0' )else
"0000011" when (A_units = 6 and dedicated_queue = '0' )else
"1111000" when (A_units = 7 and dedicated_queue = '0' )else
"0000000" when (A_units = 8 and dedicated_queue = '0' )else
"0011000" when (A_units = 9 and dedicated_queue = '0' )else
"0111111";

A_1 <= "1000000" when (A_tens = 0 and dedicated_queue = '0' )else
"1111001" when (A_tens = 1 and dedicated_queue = '0' )else
"0100100" when (A_tens = 2 and dedicated_queue = '0' )else
"0110000" when (A_tens = 3 and dedicated_queue = '0' )else
"0011001" when (A_tens = 4 and dedicated_queue = '0' )else
"0010010" when (A_tens = 5 and dedicated_queue = '0' )else
"0000011" when (A_tens = 6 and dedicated_queue = '0' )else
"1111000" when (A_tens = 7 and dedicated_queue = '0' )else
"0000000" when (A_tens = 8 and dedicated_queue = '0' )else
"0011000" when (A_tens = 9 and dedicated_queue = '0' )else
"0111111";

N_1 <= "1000000" when (N_tens = 0 and dedicated_queue = '0' )else
"1111001" when (N_tens = 1 and dedicated_queue = '0' )else
"0100100" when (N_tens = 2 and dedicated_queue = '0' )else
"0110000" when (N_tens = 3 and dedicated_queue = '0' )else
"0011001" when (N_tens = 4 and dedicated_queue = '0' )else
"0010010" when (N_tens = 5 and dedicated_queue = '0' )else
"0000011" when (N_tens = 6 and dedicated_queue = '0' )else
"1111000" when (N_tens = 7 and dedicated_queue = '0' )else
"0000000" when (N_tens = 8 and dedicated_queue = '0' )else
"0011000" when (N_tens = 9 and dedicated_queue = '0' )else
"1000000" when (q_tens = 0 and dedicated_queue = '1' )else
"1111001" when (q_tens = 1 and dedicated_queue = '1' )else
"0100100" when (q_tens = 2 and dedicated_queue = '1' )else
"0110000" when (q_tens = 3 and dedicated_queue = '1' )else
"0011001" when (q_tens = 4 and dedicated_queue = '1' )else
"0010010" when (q_tens = 5 and dedicated_queue = '1' )else
"0000011" when (q_tens = 6 and dedicated_queue = '1' )else
"1111000" when (q_tens = 7 and dedicated_queue = '1' )else
"0000000" when (q_tens = 8 and dedicated_queue = '1' )else
"0011000" when (q_tens = 9 and dedicated_queue = '1' )else
"0111111";


end control;
		