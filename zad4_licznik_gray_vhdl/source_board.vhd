library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity board is
    port ( rst_i : in std_logic;
           clk_i : in std_logic;
           led_o : out std_logic_vector(1 downto 0) := "00");
end board;

architecture behavioral of board is
    signal led_out : std_logic_vector(1 downto 0) := "00";
    begin
    process(clk_i, rst_i, led_out)
    begin
        if rst_i = '1' then
            led_out <= "00";

        elsif rising_edge(clk_i) then
            case led_out is
                when "00" => led_out <= "01";
                when "01" => led_out <= "11";
                when "11" => led_out <= "10";
                when others => led_out <= "00";
            end case;
        end if;
        led_o(1 downto 0) <= led_out;
    end process;
end behavioral;