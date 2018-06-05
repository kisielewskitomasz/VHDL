library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity board is
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           sw5_i : in std_logic;
           sw6_i : in std_logic;
           sw7_i : in std_logic;
           red_o : out std_logic;
           grn_o : out std_logic;
           blu_o : out std_logic;
           hs_o : out std_logic;
           vs_o : out std_logic);
end board;

architecture behavioral of board is
signal clk_div : std_logic;
signal red : std_logic;
signal green : std_logic;
signal blue : std_logic;
signal video_on : std_logic;
signal h_pxl : integer;
signal v_pxl : integer;

component divider
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           clk_o : out std_logic);
end component;

component vga
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           hs_o : out std_logic;
           vs_o : out std_logic;
           video_on_o : out std_logic;
           h_pxl_o : out integer; 
           v_pxl_o : out integer);
end component;

begin
    div:divider
    port map ( clk_i => clk_i,
            rst_i => rst_i,
            clk_o => clk_div);

    v:vga
    port map ( clk_i => clk_div,
               rst_i => rst_i,
               hs_o => hs_o,
               vs_o => vs_o,
               video_on_o => video_on,
               h_pxl_o => h_pxl,
               v_pxl_o => v_pxl);

    process (clk_i)
    begin
        if (rising_edge(clk_i)) then
            if (video_on = '1') then
                if(v_pxl >= 192 and v_pxl < 288) then -- 480-96=384 384/2=192 192+96=288
                    if (h_pxl >= 192 and h_pxl < 448) then -- 640-256=384 384/2=192 192+256=448
                        red <= sw5_i; -- odczyn BMP
                        green <= sw6_i; -- odczyn BMP
                        blue <= sw7_i; -- odczyn BMP
                    else
                        red <= sw5_i;
                        green <= sw6_i;
                        blue <= sw7_i;
                    end if;
                else
                    red <= sw5_i;
                    green <= sw6_i;
                    blue <= sw7_i;
                end if;
            end if;
        end if;
    end process;
    red_o <= red;
    grn_o <= green;
    blu_o <= blue;
end behavioral;