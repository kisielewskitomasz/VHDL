LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY test_keyboard IS
END test_keyboard;
 
ARCHITECTURE behavior OF test_keyboard IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keyboard
    PORT(
         rst_i : IN  std_logic;
         ps2_clk_i : IN  std_logic;
         ps2_data_i : IN  std_logic;
         ps2_code_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst_i : std_logic := '0';
   signal ps2_clk_i : std_logic := '0';
   signal ps2_data_i : std_logic := '0';

 	--Outputs
   signal ps2_code_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant ps2_clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keyboard PORT MAP (
          rst_i => rst_i,
          ps2_clk_i => ps2_clk_i,
          ps2_data_i => ps2_data_i,
          ps2_code_o => ps2_code_o
        );

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
    wait for (ps2_clk_i_period*9)+10 ns; --Z przesunieciem od zegara
		ps2_data_i <= '0'; -- bit startu
		wait for ps2_clk_i_period;

  -- 0001 1100 A key

		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;

    ps2_data_i <= '1';
		wait for ps2_clk_i_period;
		ps2_data_i <= '1';
		wait for ps2_clk_i_period;
    ps2_data_i <= '0';
		wait for ps2_clk_i_period;
		ps2_data_i <= '0';
		wait for ps2_clk_i_period;

		ps2_data_i <= '0'; -- bit parzystości
		wait for ps2_clk_i_period;
		ps2_data_i <= '1'; -- bit stopu

      wait;
   end process;

END;
