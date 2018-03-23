library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity Stream is 
	port (
			clk : in std_logic;
			peak: in std_logic;
			
			A_Client : buffer std_logic;
			N_Client: buffer std_logic;
			second_LED : buffer std_logic;
			arrival_LED: buffer std_logic
			
			);
end Stream;

architecture control of Stream is
signal arrival_rate : integer:= 50000000;
signal count : integer:= 1;

signal N_Client_count : integer:=0;
begin
arrival_rate <= 50000000 when (peak = '0') else -- alter these as parameters
					 25000000;
		clock : process(clk)
			begin
			if( (clk'event and clk = '1') )then
				second_LED <= not second_LED;
				count <= count + 1;
				if(count >= (arrival_rate/2))then 
					arrival_LED <= not arrival_LED;
					-- use half arival rate - only every rise is used by queue block
					if(N_Client_count < 3)then  -- this method generates a specific ATM user for every n normal users, can easily use a specific clock instead.
						N_Client <= not N_Client;
						N_client_count <= N_client_count + 1;
					else
						A_Client <= not A_Client;
						N_Client_count <= 0;
					end if;
				count <= 0;
				end if;
				
			end if;
			
		end process clock;


end control;
		