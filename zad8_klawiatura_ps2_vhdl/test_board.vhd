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
         ps2_clk_i : IN  std_logic;
         ps2_data_i : IN  std_logic;
         led7_an_o : OUT  std_logic_vector(3 downto 0);
         led7_seg_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal ps2_clk_i : std_logic := '0';
   signal ps2_data_i : std_logic := '0';

 	--Outputs
   signal led7_an_o : std_logic_vector(3 downto 0);
   signal led7_seg_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: board PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          ps2_clk_i => ps2_clk_i,
          ps2_data_i => ps2_data_i,
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

		rst_i<='1';
		ps2_data_i<='1';
      wait for 100 ns;	
		rst_i <='0';
      wait for (clk_i_period*9)+5 ns; --Z przesunieciem od zegara



-- 0001 1100 A key

		ps2_data_i <= '0'; -- bit startu
		wait for clk_i_period;

		ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '1';
		wait for clk_i_period;

    ps2_data_i <= '1';
		wait for clk_i_period;
		ps2_data_i <= '1';
		wait for clk_i_period;
    ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '0';
		wait for clk_i_period;

		ps2_data_i <= '0'; -- bit parzystosci
		wait for clk_i_period;
		ps2_data_i <= '1'; -- bit stopu
      wait for clk_i_period;
      
      wait for 400 ns;
   
-- 1111 0000 F0
   
		ps2_data_i <= '0'; -- bit startu
		wait for clk_i_period;

		ps2_data_i <= '1';
		wait for clk_i_period;
		ps2_data_i <= '1';
		wait for clk_i_period;
		ps2_data_i <= '1';
		wait for clk_i_period;
		ps2_data_i <= '1';
		wait for clk_i_period;

      ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '0';
		wait for clk_i_period;
    ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '0';
		wait for clk_i_period;

		ps2_data_i <= '1'; -- bit parzystosci
		wait for clk_i_period;
		ps2_data_i <= '1'; -- bit stopu
      wait for clk_i_period;
      
      wait for 400 ns;
      
      
-- 0001 1100 A key

		ps2_data_i <= '0'; -- bit startu
		wait for clk_i_period;

		ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '1';
		wait for clk_i_period;

      ps2_data_i <= '1';
		wait for clk_i_period;
		ps2_data_i <= '1';
		wait for clk_i_period;
      ps2_data_i <= '0';
		wait for clk_i_period;
		ps2_data_i <= '0';
		wait for clk_i_period;

		ps2_data_i <= '0'; -- bit parzystosci
		wait for clk_i_period;
		ps2_data_i <= '1'; -- bit stopu
      wait for 400 ns;

      wait;
   end process;

END;
