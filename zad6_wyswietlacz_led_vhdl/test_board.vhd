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
         sw_i : IN  std_logic_vector(7 downto 0);
         btn_i : IN  std_logic_vector(3 downto 0);
         led7_an_o : OUT  std_logic_vector(3 downto 0);
         led7_seg_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal clk_i : std_logic := '0';
   signal sw_i : std_logic_vector(7 downto 0) := (others => '0');
   signal btn_i : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal led7_an_o : std_logic_vector(3 downto 0);
   signal led7_seg_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: board PORT MAP (
          clk_i => clk_i,
          sw_i => sw_i,
          btn_i => btn_i,
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
		wait for clk_i_period*4;
		sw_i <= "00000001";
		wait for clk_i_period*2;
      btn_i(1) <= '1';
		wait for clk_i_period*2;
      btn_i(1) <= '0';
		wait for clk_i_period*16;
		
		sw_i <= "00100000";
		wait for clk_i_period*2;
		
      wait;
   end process;

END;
