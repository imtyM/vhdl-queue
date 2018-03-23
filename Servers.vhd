library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity Servers is 
	port (
				clk: in std_logic;
				
				queue: in integer;
				N_queue: in integer;
				A_queue: in integer;
				dedicated_queue: in std_logic;
				damaged_A_ATM: in std_logic;
				damaged_N_ATM: in std_logic;
				
				q_out: buffer integer;
				N_out: buffer integer;
				A_out: buffer integer
				
			);
end Servers;

architecture control of Servers is
signal N_regular_rate : integer;
signal A_regular_rate : integer;

signal N_service_rate : integer;
signal N_count: integer:= 0;

signal A_service_rate : integer;
signal A_count : integer:= 0;

signal q_service_rate : integer;
signal q_count: integer:=0;

signal A_server: integer;
signal N_server: integer;
signal q_server: integer;

signal N: integer := 0;
signal A: integer := 0;
signal q: integer := 0;

begin
N_regular_rate <= 50000000 when (damaged_N_ATM = '0')else
						140000000;

A_regular_rate <=	130000000 when (damaged_A_ATM = '0')else
						300000000;


N_service_rate <= N_regular_rate when (dedicated_queue = '0')else
						N_regular_rate - 20000000; -- alter these as paramters
A_service_rate <= A_regular_rate;

A_out <= A_server;
N_out <= N_server;
q_out <= q_server;

		clock : process(clk)
			begin
			if( (clk'event and clk = '1') )then
				N_server <= N_queue + N;
				A_server <= A_queue + A;
				q_server <= A_server + N_server + q;
				
				N_count <= N_count + 1;
				q_count <= q_count + 1;
				A_count <= A_count + 1;
				if(N_count >= (N_service_rate))then 
					if (N_server > 0)then
						N <= N - 1;
					end if;
					N_count <= 0;
				end if;
				if(A_count >= (A_service_rate))then 
					if (A_server > 0)then
						A <= A - 1;
					end if;
					A_count <= 0;
				end if;
			end if;	
			
		end process clock;

end control;
		