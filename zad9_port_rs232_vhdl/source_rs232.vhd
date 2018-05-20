library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rs232 is
    port ( clk_i : in std_logic;
           rst_i : in std_logic;
           rxd_i : in std_logic;
           txd_o : out std_logic := '1');
end rs232;

architecture behavioral of rs232 is
signal rxd_code : std_logic_vector (7 downto 0) := (others => '0');
signal txd_code : std_logic_vector (7 downto 0) := (others => '0');
signal rxd_data_recived : std_logic_vector (9 downto 0) := (others => '0');
signal txd_data_transmited : std_logic_vector (9 downto 0) := (others => '0');
signal rxd_data_counter : integer range 0 to 10 := 0;
signal txd_data_counter : integer range 0 to 10 := 0;
signal rxd_status : integer range 0 to 4 := 0;
signal txd_status : integer range 0 to 1 := 0;
signal rxd_timer : integer range 0 to 65535 := 0;
signal txd_timer : integer range 0 to 65535 := 0;
constant rs232_period : integer := 4; -- for 9600 bps == 50000000/9600 -- for simulation == 4
constant rs232_half_period : integer := rs232_period/2;
begin
    process (clk_i, rst_i)
    begin
        if (rst_i = '1') then
            rxd_timer <= 0;
            rxd_status <= 0;
            rxd_code <= "00000000";
            rxd_data_recived <= "0000000000";

            txd_timer <= 0;
            txd_status <= 0;
            txd_code <= "00000000";
            txd_data_transmited <= "0000000000";
            txd_o <= '1';
        elsif(rising_edge(clk_i)) then
            if (rxd_status = 0 and rxd_i = '0') then
                rxd_status <= 1;
            elsif (rxd_status = 1) then
                rxd_timer <= rxd_timer + 1;
                case rxd_timer is
                    when 0*rs232_period + rs232_half_period =>
                            rxd_data_recived(0) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 1*rs232_period + rs232_half_period =>
                            rxd_data_recived(1) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 2*rs232_period + rs232_half_period =>
                            rxd_data_recived(2) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 3*rs232_period + rs232_half_period =>
                            rxd_data_recived(3) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 4*rs232_period + rs232_half_period =>
                            rxd_data_recived(4) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 5*rs232_period + rs232_half_period =>
                            rxd_data_recived(5) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 6*rs232_period + rs232_half_period =>
                            rxd_data_recived(6) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 7*rs232_period + rs232_half_period =>
                            rxd_data_recived(7) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 8*rs232_period + rs232_half_period =>
                            rxd_data_recived(8) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 9*rs232_period + rs232_half_period =>
                            rxd_data_recived(9) <= rxd_i;
                            rxd_data_counter <= rxd_data_counter + 1;
                    when 10*rs232_period =>
                            rxd_timer <= 0;
                            rxd_status <= 2;
                            rxd_data_counter <= 0;
                    when others => null;
                end case;
            elsif (rxd_status = 2) then
                if (rxd_data_recived(9) = '1') then
                    rxd_code <= rxd_data_recived(8 downto 1);
                    rxd_status <= 3;
                else
                    rxd_code <= "00000000";
                    rxd_data_recived <= "0000000000";
                    rxd_status <= 0;
                end if;
            elsif (rxd_status = 3) then
                txd_code <= rxd_code;
                rxd_status <= 4;
            elsif (rxd_status = 4) then
                txd_data_transmited(0) <= '0';
                txd_data_transmited(8 downto 1) <= txd_code;
                txd_data_transmited(9) <= '1';
                txd_status <= 1;

                rxd_status <= 0;
                rxd_code <= "00000000";
                rxd_data_recived <= "0000000000";
            end if;

            if (txd_status = 1) then
                txd_timer <= txd_timer + 1;
                case txd_timer is
                    when 0*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(0);
                            txd_data_counter <= txd_data_counter + 1;
                    when 1*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(1);
                            txd_data_counter <= txd_data_counter + 1;
                    when 2*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(2);
                            txd_data_counter <= txd_data_counter + 1;
                    when 3*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(3);
                            txd_data_counter <= txd_data_counter + 1;
                    when 4*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(4);
                            txd_data_counter <= txd_data_counter + 1;
                    when 5*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(5);
                            txd_data_counter <= txd_data_counter + 1;
                    when 6*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(6);
                            txd_data_counter <= txd_data_counter + 1;
                    when 7*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(7);
                            txd_data_counter <= txd_data_counter + 1;
                    when 8*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(8);
                            txd_data_counter <= txd_data_counter + 1;
                    when 9*rs232_period + rs232_half_period =>
                            txd_o <= txd_data_transmited(9);
                            txd_data_counter <= txd_data_counter + 1;
                    when 10*rs232_period =>
                            txd_timer <= 0;
                            txd_status <= 0;
                            txd_data_counter <= 0;
                    when others => null;
                end case;
            else
                txd_o <= '1';
            end if;
        end if;
    end process;
end behavioral;

