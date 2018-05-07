library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity board is
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           ps2_clk_i : in std_logic;
           ps2_data_i : in std_logic;
           led7_an_o : out std_logic_vector (3 downto 0);
           led7_seg_o : out std_logic_vector (7 downto 0));
end board;

architecture behavioral of board is
signal clk_div : std_logic;
signal digit : std_logic_vector (31 downto 0) := (others => '1');
signal ps2_code : std_logic_vector (7 downto 0) := (others => '0');
signal ps2_clk_stable_i : std_logic;
--signal ps2_clk_stable_synch_i : std_logic;
signal ps2_data_stable_i : std_logic;

component divider
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           clk_o : out std_logic);
end component;

component display
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           digit_i : in std_logic_vector (31 downto 0) := (others => '1');
           led7_an_o : out std_logic_vector (3 downto 0) := "1111";
           led7_seg_o : out std_logic_vector (7 downto 0) := "11111111");
end component;

component keyboard
    port ( rst_i : in std_logic;
           ps2_clk_i : in std_logic;
           ps2_data_i : in std_logic;
           ps2_code_o : out std_logic_vector (7 downto 0));
end component;

--component debouncer
--    port ( key_i : in std_logic;
--           clk_i : in std_logic;
--           key_stable_o : out std_logic);
--end component;

--component synchro
--    port ( clk_i : in std_logic;
--           ps2_clk_i : in std_logic;
--           clk_o : out std_logic);
--end component;

function convert_ps2_code_to_7seg(ps2_code: std_logic_vector(7 downto 0)) return std_logic_vector is 
begin
    case ps2_code is
        when "01000101" => return ("0000001"); -- 0
        when "00010110" => return ("1001111"); -- 1
        when "00011110" => return ("0010010"); -- 2
        when "00100110" => return ("0000110"); -- 3
        when "00100101" => return ("1001100"); -- 4
        when "00101110" => return ("0100100"); -- 5
        when "00110110" => return ("0100000"); -- 6
        when "00111101" => return ("0001111"); -- 7
        when "00111110" => return ("0000000"); -- 8
        when "01000110" => return ("0000100"); -- 9
        when "00011100" => return ("0001000"); -- a
        when "00110010" => return ("1100000"); -- b
        when "00100001" => return ("0110001"); -- c
        when "00100011" => return ("1000010"); -- d
        when "00100100" => return ("0110000"); -- e
        when "00101011" => return ("0111000"); -- f
        when others => return ("1111111"); -- null
    end case;
end function convert_ps2_code_to_7seg;

begin
    div:divider
    port map ( clk_i => clk_i,
               rst_i => rst_i,
               clk_o => clk_div);
    dis:display
    port map ( clk_i => clk_div,
               rst_i => rst_i,
               digit_i => digit,
               led7_an_o => led7_an_o,
               led7_seg_o => led7_seg_o);
    ps2:keyboard
    port map ( rst_i => rst_i,
               ps2_clk_i => ps2_clk_i, -- ps2_clk_stable_i ps2_clk_stable_synch_i ps2_clk_i
               ps2_data_i => ps2_data_i, -- ps2_data_stable_i  ps2_data_i
               ps2_code_o => ps2_code);
--    deb_clk:debouncer
--    port map ( clk_i => clk_i,
--               key_i => ps2_clk_i,
--               key_stable_o => ps2_clk_stable_i);
--    deb_data:debouncer
--    port map ( clk_i => clk_i,
--               key_i => ps2_data_i,
--               key_stable_o => ps2_data_stable_i);
    --syn:synchro
    --port map ( clk_i => ps2_clk_stable_i,
    --           ps2_clk_i => ps2_clk_i,
    --           clk_o => ps2_clk_stable_synch_i);
                
    process (ps2_code)
    begin
        digit(7 downto 1) <= convert_ps2_code_to_7seg(ps2_code);
    end process;
end behavioral;