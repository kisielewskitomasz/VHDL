library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divider is
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           clk_o : out std_logic);
end divider;

architecture behavioral of divider is
constant n : integer := 2;
signal cnt_n : integer range 0 to n - 1 := 0;
signal clk : std_logic := '0';
begin
    process (clk_i, rst_i)
        begin
        if (rst_i = '1') then
            cnt_n <= 0;
            clk <= '0';
        elsif (rising_edge(clk_i)) then
            cnt_n <= cnt_n + 1;
            if (cnt_n = (n / 2) - (1 - (n mod 2))) then
                clk <= '1';
            end if;
            if cnt_n = n - 1 then
                clk <= '0';
                cnt_n <= 0;
            end if;
        end if;
    end process;
clk_o <= clk;
end behavioral;