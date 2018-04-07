library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity board is
    port ( sw_i : in  std_logic_vector (7 downto 0);
           led7_seg_o : out  std_logic_vector (7 downto 0);
           led7_an_o : out  std_logic_vector (3 downto 0));
end board;

architecture behavioral of board is

begin
    led7_an_o <= "1110";
    led7_seg_o(0) <= '1';
    led7_seg_o(1) <= sw_i(0) xor sw_i(1) xor sw_i(2) xor sw_i(3) xor sw_i(4) xor sw_i(5) xor sw_i(6) xor sw_i(7);
    led7_seg_o(2) <= '0';
    led7_seg_o(3) <= '0';
    led7_seg_o(4) <= '0';
    led7_seg_o(5) <= not (sw_i(0) xor sw_i(1) xor sw_i(2) xor sw_i(3) xor sw_i(4) xor sw_i(5) xor sw_i(6) xor sw_i(7));
    led7_seg_o(6) <= not (sw_i(0) xor sw_i(1) xor sw_i(2) xor sw_i(3) xor sw_i(4) xor sw_i(5) xor sw_i(6) xor sw_i(7));
    led7_seg_o(7) <= '0';
end behavioral;

