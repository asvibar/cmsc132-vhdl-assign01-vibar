--  Aron John S. Vibar
--  2013-03369
--  T-4L

library IEEE;
use IEEE.std_logic_1164.all;

entity alarm is
	port(
		buzz_in: in std_logic_vector(2 downto 0); --input for buzzer_in
		buzz_out: in std_logic_vector(2 downto 0); --input for buzzer_out
		alrm: out std_logic --alarm
	);
end entity;

architecture am of alarm is
	begin
		process(buzz_in,buzz_out) is
			begin	
				if ((buzz_in(2) = '1' or buzz_in(1) = '1' or buzz_in(0) = '1') and (buzz_out(2) = '1' or buzz_out(1) = '1'
					or buzz_out(0) = '1'))
					then alrm <= '1';
				else
					alrm <= '0';
				end if;
			end process;
end architecture;
				
