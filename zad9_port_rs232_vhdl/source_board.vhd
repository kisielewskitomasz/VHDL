library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity board is
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           rxd_i : in std_logic;
           txd_o : out std_logic);
end board;

architecture behavioral of board is

component rs232
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           rxd_i : in std_logic;
           txd_o : out std_logic);
end component;

begin
    rs:rs232
    port map ( clk_i => clk_i,
               rst_i => rst_i,
               rxd_i => rxd_i,
               txd_o => txd_o);
end behavioral;