library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debouncer is
    port ( key_i : in std_logic;
              clk_i : in std_logic;
           key_stable_o : out std_logic);
end debouncer;

architecture behavioral of debouncer is
signal q : std_logic := '0';
signal key_synch : std_logic := '0';
signal key_stable_out : std_logic := '0';
begin
    process (clk_i) is
    variable delay_cntr : integer range 0 to 63 := 0;
    begin
      if rising_edge(clk_i) then
         q <= key_i;
         key_synch <= q;
         if (key_synch = key_stable_out) then
            delay_cntr := 0;
         else
            delay_cntr := delay_cntr + 1;
         end if;
         if (delay_cntr = 63) then
            key_stable_out <= key_synch;
            delay_cntr := 0;
         end if;
      end if;
    end process;
    key_stable_o <= key_stable_out;
end behavioral;

