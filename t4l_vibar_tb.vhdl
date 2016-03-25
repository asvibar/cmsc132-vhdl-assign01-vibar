--  Aron John S. Vibar
--  2013-03369
--  T-4L

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alarm_tb is
end;

architecture alarm_tb of alarm_tb is
	signal inBuzz : std_logic_vector(2 downto 0);
	signal outBuzz : std_logic_vector(2 downto 0);
	signal a : std_logic;
	component alarm is
		port(
			buzz_in: in std_logic_vector(2 downto 0);
			buzz_out: in std_logic_vector(2 downto 0);
			alrm: out std_logic
		);
	end component;

	begin
		uut : component alarm port map(inBuzz,outBuzz,a);
		process	
			variable input: unsigned(5 downto 0);
			variable outputz: std_logic;
			variable ecount: integer :=0;
			begin
				input:=B"000000";
				for count in 0 to 64 loop
					inBuzz(0) <= input(5);
					inBuzz(1) <= input(4);
					inBuzz(2) <= input(3);
					outBuzz(0) <= input(2);
					outBuzz(1) <= input(1);
					outBuzz(2) <= input(0);
					wait for 10 ns;

					if ((inBuzz(2) = '1' or inBuzz(1) = '1' or inBuzz(0) = '1') and (outBuzz(2) = '1' or outBuzz(1) = '1'
						or outBuzz(0) = '1'))
						then outputz := '1';
					else
						outputz := '0';
					end if;

					
					assert(outputz = a) report "Design Error"
						severity error;
					if(outputz /= a) then
						ecount := ecount + 1;
					end if;
					input := input+1;
				end loop;
				report "Done testing. Errors: "&integer'image(ecount);
				wait;
		end process;
end architecture;



