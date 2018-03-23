library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity Queue is 
	port (
			A_client : in std_logic;
			N_client: in std_logic;
			
			
			queue_out : buffer integer;
			N_count_out: buffer integer;
			A_count_out: buffer integer
			);
end Queue;

architecture control of Queue is
signal queue : integer := 0;
signal N_client_count : integer:=0;
signal A_client_count : integer:=0;
begin
queue_out <= N_client_count + A_client_count;
N_count_out <= N_client_count;
A_count_out <= A_client_count;

		clock : process(A_client, N_client)
			begin
			if( (N_client'event and N_client = '1') )then
					N_client_count <= N_client_count + 1;
			end if;
			if( (A_client'event and A_client = '1') )then
					A_client_count <= A_client_count + 1;
			end if;
			
		end process clock;


end control;
		