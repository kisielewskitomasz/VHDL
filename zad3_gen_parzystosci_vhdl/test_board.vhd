LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY test_board IS
END test_board;
 
ARCHITECTURE behavior OF test_board IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT board
    PORT(
         sw_i : IN  std_logic_vector(7 downto 0);
         led7_seg_o : OUT  std_logic_vector(7 downto 0);
         led7_an_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sw_i : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal led7_seg_o : std_logic_vector(7 downto 0);
   signal led7_an_o : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: board PORT MAP (
          sw_i => sw_i,
          led7_seg_o => led7_seg_o,
          led7_an_o => led7_an_o
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      wait for 100 ns;		

      -- insert stimulus here 
		wait for 100 ns;
		
		sw_i <= "00000001";
		wait for 100 ns;

		sw_i <= "00000011";
		wait for 100 ns;

		sw_i <= "00000111";
		wait for 100 ns;

		sw_i <= "00001111";
		wait for 100 ns;

		sw_i <= "00011111";
		wait for 100 ns;

		sw_i <= "00111111";
		wait for 100 ns;

		sw_i <= "01111111";
		wait for 100 ns;

		sw_i <= "11111111";
		wait for 100 ns;

      wait;
   end process;

END;
