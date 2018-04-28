LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY test_boardv2 IS
END test_boardv2;
 
ARCHITECTURE behavior OF test_boardv2 IS 
 
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
	constant ps2_clk_i_period : time := clk_i_period * 3;
 
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
	
	   -- Clock process definitions
   ps2_clk_i_process :process
   begin
		ps2_clk_i <= '0';
		wait for ps2_clk_i_period/2;
		ps2_clk_i <= '1';
		wait for ps2_clk_i_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      rst_i<='1';
		ps2_data_i<='1';
      wait for 100 ns;	
		rst_i <='0';
      wait for (ps2_clk_i_period*5)+10 ns; -- +5 ns Z przesunieciem od zegara

   
-- 0010 0100 E key down

		ps2_data_i <= '0'; -- bit startu
		wait for ps2_clk_i_period;

		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
      ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;
      ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;

		ps2_data_i <= '1'; -- bit parzystosci
		wait for ps2_clk_i_period;
		ps2_data_i <= '1'; -- bit stopu
      wait for ps2_clk_i_period*3;

---- 1111 0000 F0 symb 1111 0000
--
--		ps2_data_i <= '0'; -- bit startu
--		wait for ps2_clk_i_period;
--
--		ps2_data_i <= '0';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '0';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '0';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '0';
--		wait for ps2_clk_i_period;
--      ps2_data_i <= '1';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '1';
--		wait for ps2_clk_i_period;
--      ps2_data_i <= '1';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '1';
--		wait for ps2_clk_i_period;
--
--		ps2_data_i <= '1'; -- bit parzystosci
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '1'; -- bit stopu
--      wait for ps2_clk_i_period;
		
-- 0010 0100 E key up

		ps2_data_i <= '0'; -- bit startu
		wait for ps2_clk_i_period;

		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
      ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;
      ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;

		ps2_data_i <= '1'; -- bit parzystosci
		wait for ps2_clk_i_period;
		ps2_data_i <= '1'; -- bit stopu
      wait for ps2_clk_i_period*3;
		
		
		
		
-- 0011 0100 G key down

		ps2_data_i <= '0'; -- bit startu
		wait for ps2_clk_i_period;

		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
      ps2_data_i <= '1';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;
      ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;

		ps2_data_i <= '0'; -- bit parzystosci
		wait for ps2_clk_i_period;
		ps2_data_i <= '1'; -- bit stopu
      wait for ps2_clk_i_period*3;

---- 1111 0000 F0 symb 1111 0000
--
--		ps2_data_i <= '0'; -- bit startu
--		wait for ps2_clk_i_period;
--
--		ps2_data_i <= '0';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '0';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '0';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '0';
--		wait for ps2_clk_i_period;
--      ps2_data_i <= '1';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '1';
--		wait for ps2_clk_i_period;
--      ps2_data_i <= '1';
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '1';
--		wait for ps2_clk_i_period;
--
--		ps2_data_i <= '1'; -- bit parzystosci
--		wait for ps2_clk_i_period;
--		ps2_data_i <= '1'; -- bit stopu
--      wait for ps2_clk_i_period;
		
-- 0011 0100 G key up

		ps2_data_i <= '0'; -- bit startu
		wait for ps2_clk_i_period;

		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
      ps2_data_i <= '1';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;
      ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;

		ps2_data_i <= '0'; -- bit parzystosci
		wait for ps2_clk_i_period;
		ps2_data_i <= '1'; -- bit stopu
      wait for ps2_clk_i_period*3;

      wait;
   end process;

END;
