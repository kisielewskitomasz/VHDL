LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY test_display IS
END test_display;
 
ARCHITECTURE behavior OF test_display IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT display
    PORT(
         clk_i : IN  std_logic;
         rst_i : IN  std_logic;
         digit_i : IN  std_logic_vector(31 downto 0);
         led7_an_o : OUT  std_logic_vector(3 downto 0);
         led7_seg_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_i : std_logic := '0';
   signal digit_i : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal led7_an_o : std_logic_vector(3 downto 0);
   signal led7_seg_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display PORT MAP (
          clk_i => clk_i,
          rst_i => rst_i,
          digit_i => digit_i,
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
      wait for clk_i_period*10;
      digit_i <= "11111111000000000000000000000000";
      --digit_i <= "11111111000000000011110011110000";
      wait for clk_i_period*10;
      rst_i <= '1';
      wait for clk_i_period*3;
      rst_i <= '0';
      wait;
   end process;

END;
