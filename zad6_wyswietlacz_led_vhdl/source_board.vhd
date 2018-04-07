library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity board is
    port ( clk_i : in std_logic;
           sw_i : in std_logic_vector (7 downto 0);
           btn_i : in std_logic_vector (3 downto 0);
           led7_an_o : out std_logic_vector (3 downto 0);
           led7_seg_o : out std_logic_vector (7 downto 0));
end board;

architecture behavioral of board is
signal clk_div : std_logic;
signal digit : std_logic_vector (31 downto 0) := (others => '1');
signal btn_state : std_logic_vector (3 downto 0) := "0000";

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

function convert_4bit_bin_to_7seg(data_i: std_logic_vector(3 downto 0)) return std_logic_vector is 
begin 
    case data_i is
        when "0000" => return ("0000001"); -- 0
        when "0001" => return ("1001111"); -- 1
        when "0010" => return ("0010010"); -- 2
        when "0011" => return ("0000110"); -- 3
        when "0100" => return ("1001100"); -- 4
        when "0101" => return ("0100100"); -- 5
        when "0110" => return ("0100000"); -- 6
        when "0111" => return ("0001111"); -- 7
        when "1000" => return ("0000000"); -- 8
        when "1001" => return ("0000100"); -- 9
        when "1010" => return ("0001000"); -- a
        when "1011" => return ("1100000"); -- b
        when "1100" => return ("0110001"); -- c
        when "1101" => return ("1000010"); -- d
        when "1110" => return ("0110000"); -- e
        when "1111" => return ("0111000"); -- f
      when others => return ("1111111"); -- null
    end case;
end function convert_4bit_bin_to_7seg; 

begin
        div:divider
        port map (	clk_i => clk_i,
                        rst_i => '0', -- rst_i
                        clk_o => clk_div); 
        dis:display
        port map (  clk_i => clk_div,
                        rst_i => '0', -- rst_i
                        digit_i => digit,
                        led7_an_o => led7_an_o,
                        led7_seg_o => led7_seg_o);
        
        process(clk_i)
        begin
            
            if (rising_edge(clk_i)) then
                btn_state(0) <= btn_i(0);
                btn_state(1) <= btn_i(1);
                btn_state(2) <= btn_i(2);
                btn_state(3) <= btn_i(3);
                
                if(btn_i(0) = '1' and btn_state(0) = '0') then
                    digit(7 downto 1) <= convert_4bit_bin_to_7seg(sw_i(3 downto 0));
                end if;
                if(btn_i(1) = '1' and btn_state(1) = '0') then
                    digit(15 downto 9) <= convert_4bit_bin_to_7seg(sw_i(3 downto 0));
                end if;
                if(btn_i(2) = '1' and btn_state(2) = '0') then
                    digit(23 downto 17) <= convert_4bit_bin_to_7seg(sw_i(3 downto 0));
                end if;
                if(btn_i(3) = '1' and btn_state(3) = '0') then
                    digit(31 downto 25) <= convert_4bit_bin_to_7seg(sw_i(3 downto 0));
                end if;
                    digit(0) <= not sw_i(4);
                    digit(8) <= not sw_i(5);
                    digit(16) <= not sw_i(6);
                    digit(24) <= not sw_i(7);
            end if;
    end process;
    
end behavioral;