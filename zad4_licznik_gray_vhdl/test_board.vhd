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
         rst_i : IN  std_logic;
         clk_i : IN  std_logic;
         led_o : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst_i : std_logic := '0';
   signal clk_i : std_logic := '0';

 	--Outputs
   signal led_o : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: board PORT MAP (
          rst_i => rst_i,
          clk_i => clk_i,
          led_o => led_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      -- wait for 2*clk_i_period;

      -- insert stimulus here 
		wait for 600 ns;	
			rst_i <= '1';
			wait for 100 ns;
			rst_i <= '0';
      wait;
   end process;

END;
