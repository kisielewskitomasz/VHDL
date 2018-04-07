library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity synchronizer is
    port ( clk_i : in std_logic;
           ps2_clk_i : in std_logic;
           clk_o : out std_logic := '1');
end synchronizer;

architecture behavioral of synchronizer is

begin
   process(clk_i)
      if (rising_edge(clk_i)) then
         clk_o <= ps2_clk_i;
      end if;
  end process;
end behavioral;
