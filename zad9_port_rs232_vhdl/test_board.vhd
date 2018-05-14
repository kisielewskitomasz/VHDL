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
         clk_i : IN  std_logic;
         rst_i : IN  std_logic;
         RXD_i : IN  std_logic;
         TXD_o : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal RXD_i : std_logic := '1';

 	--Outputs
   signal TXD_o : std_logic := '1';

   -- Clock period definitions
   constant n : integer := 4;
   constant clk_i_period : time := 20 ns;
 
BEGIN

 
	-- Instantiate the Unit Under Test (UUT)
   uut: board PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          RXD_i => RXD_i,
          TXD_o => TXD_o
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

      RXD_i <= '1'; -- ready bit
		wait for 50 ns;

		RXD_i <= '0'; -- start bit
      wait for clk_i_period*1*n;
		
		RXD_i <= '0'; -- B: 0100 0010 / 0x42 / 66
      wait for clk_i_period*1*n;
      RXD_i <= '1';
      wait for clk_i_period*1*n;
		RXD_i <= '0';
      wait for clk_i_period*1*n;
		RXD_i <= '0';
      wait for clk_i_period*1*n;
		
		RXD_i <= '0';
      wait for clk_i_period*1*n;
		RXD_i <= '0';
      wait for clk_i_period*1*n;
		RXD_i <= '1';
      wait for clk_i_period*1*n;
		RXD_i <= '0';
      wait for clk_i_period*1*n;
      
		RXD_i <= '1'; -- stop bit
      wait for clk_i_period*1*n;
		
      wait;
   end process;

END;
