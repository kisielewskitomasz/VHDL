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
         start_stop_button_i : IN  std_logic;
         rst_i : IN  std_logic;
         led7_an_o : OUT  std_logic_vector(3 downto 0);
         led7_seg_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal start_stop_button_i : std_logic := '0';
   signal rst_i : std_logic := '0';

 	--Outputs
   signal led7_an_o : std_logic_vector(3 downto 0);
   signal led7_seg_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: board PORT MAP (
          clk_i => clk_i,
          start_stop_button_i => start_stop_button_i,
          rst_i => rst_i,
          led7_an_o => led7_an_o,
          led7_seg_o => led7_seg_o
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
		wait for clk_i_period * 10; 
		start_stop_button_i <= '1'; -- start
		wait for clk_i_period * 10;
		start_stop_button_i <= '0';
		wait for clk_i_period * 80; 
		
		wait for clk_i_period * 10; 
		start_stop_button_i <= '1'; -- start
		wait for clk_i_period * 80;
		start_stop_button_i <= '0';
		wait for clk_i_period * 10; 

	
		wait for clk_i_period * 300;
		start_stop_button_i <= '1'; -- stop
		wait for clk_i_period * 80;
		start_stop_button_i <= '0';
      
      wait for clk_i_period * 100;
		start_stop_button_i <= '1'; -- reset
		wait for clk_i_period * 80;
		start_stop_button_i <= '0';
	
		wait for clk_i_period * 300;
		start_stop_button_i <= '1'; -- start
		wait for clk_i_period * 80;
		start_stop_button_i <= '0';
		
		wait for clk_i_period * 300;
		rst_i <= '1';					 -- hard reset
		wait for clk_i_period * 80;
		rst_i <= '0';
	
      wait;
   end process;

END;
