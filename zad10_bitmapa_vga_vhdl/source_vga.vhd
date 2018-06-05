library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga is
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           hs_o : out std_logic;
           vs_o : out std_logic;
           video_on_o : out std_logic;
           h_pxl_o : out integer;
           v_pxl_o : out integer);
end vga;

architecture behavioral of vga is
constant h_cols : integer := 640;
constant h_fp : integer := 18;
constant h_sync : integer := 92;
constant h_bp : integer := 50;
constant h_cnt_max : integer := h_cols+h_fp+h_sync+h_bp-1;

constant v_rows : integer := 480;
constant v_fp : integer := 10;
constant v_sync : integer := 12;
constant v_bp : integer := 33;
constant v_cnt_max : integer := v_rows+v_fp+v_sync+v_bp-1;

signal h_cnt : integer range 0 to h_cnt_max := 0;
signal v_cnt : integer range 0 to v_cnt_max := 0;

signal h_s : std_logic := '0';
signal v_s : std_logic := '0';

signal h_pxl : integer := 0;
signal v_pxl : integer := 0;

signal video_on : std_logic := '0';
--              horizontal   vertical
-- whole area   800          525
-- visible area 640          480
-- front porch  18           10
-- sync pulse   92           12
-- back porch   50           33
-- when active SYNC is 1
-- >640 or >480 SYNC is 0
begin
    process (clk_i, rst_i)
        begin
        if (rst_i = '1') then
            h_s <= '0';
            v_s <= '0';
            video_on <= '0';
            h_pxl <= 0;
            v_pxl <= 0;
            h_cnt <= 0;
            v_cnt <= 0;
            video_on <= '0';
        else
            if (rising_edge(clk_i)) then
                if (h_cnt < h_cnt_max) then
                    h_cnt <= h_cnt + 1;
                else
                    h_cnt <= 0;
                    if (v_cnt < v_cnt_max) then
                        v_cnt <= v_cnt + 1;
                    else
                        v_cnt <= 0;
                    end if;
                end if;

                if (h_cnt < h_cols) then
                    h_s <= '1';
                    h_pxl <= h_cnt;
                elsif (h_cnt < h_cols+h_fp) then
                    h_s <= '1';
                    h_pxl <= 0;
                elsif (h_cnt < h_cols+h_fp+h_sync) then
                    h_s <= '0';
                elsif (h_cnt < h_cols+h_fp+h_sync+h_bp) then
                    h_s <= '1';
                else
                    h_s <= '0';
                end if;

                if (v_cnt < v_rows) then
                    v_s <= '1';
                    v_pxl <= v_cnt;
                elsif (v_cnt < v_rows+v_fp) then
                    v_s <= '1';
                    v_pxl <= 0;
                elsif (v_cnt < v_rows+v_fp+v_sync) then
                    v_s <= '0';
                elsif (v_cnt < v_rows+v_fp+v_sync+v_bp) then
                    v_s <= '1';
                else
                    v_s <= '0';
                end if;

                if (h_s = '1' and v_s = '1') then
                    video_on <= '1';
                else
                    video_on <= '0';
                end if;
            end if;
        end if;
    end process;
    hs_o <= h_s;
    vs_o <= v_s;
    h_pxl_o <= h_pxl;
    v_pxl_o <= v_pxl;
    video_on_o <= video_on;
end behavioral;