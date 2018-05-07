library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity keyboard is
    port ( rst_i : in std_logic;
           ps2_clk_i : in std_logic;
           ps2_data_i : in std_logic;
           ps2_code_o : out std_logic_vector (7 downto 0) := (others => '0'));
end keyboard;

architecture behavioral of keyboard is
signal ps2_code : std_logic_vector (7 downto 0) := (others => '0');
signal ps2_code_old : std_logic_vector (7 downto 0) := (others => '0');
signal ps2_break : std_logic := '0';
signal ps2_data_bit_counter : integer range 0 to 10 := 0;
signal ps2_data_recived : std_logic_vector (10 downto 0) := (others => '0');

begin
    process (ps2_clk_i, rst_i)
    begin
        if (rst_i = '1') then
            ps2_code <= "00000000";
				ps2_code_old <= "00000000";
				ps2_break <= '0';
            ps2_data_recived <= "00000000000";
        elsif (falling_edge(ps2_clk_i)) then
            case ps2_data_bit_counter is 
                when 0 =>
                    if (ps2_data_i = '0') then
                        ps2_data_recived(ps2_data_bit_counter) <= ps2_data_i;
                        ps2_data_bit_counter <= ps2_data_bit_counter + 1;
                    end if;
                when 1 to 9 =>
                    ps2_data_recived(ps2_data_bit_counter) <= ps2_data_i;
                    ps2_data_bit_counter <= ps2_data_bit_counter + 1;
                when 10 =>
                    ps2_data_recived(ps2_data_bit_counter) <= ps2_data_i;
                    ps2_data_bit_counter <= 0;
						  
                    if (ps2_data_i = '1' and ps2_data_recived(9) /= (ps2_data_recived(1) xor ps2_data_recived(2) xor ps2_data_recived(3) xor ps2_data_recived(4) xor ps2_data_recived(5) xor ps2_data_recived(6) xor ps2_data_recived(7) xor ps2_data_recived(8))) then
                        if (ps2_data_recived(8 downto 1) /= "11110000") then
									if(ps2_break = '1') then
										ps2_code_old <= ps2_data_recived(8 downto 1);
										ps2_break <= '0';
									end if;
									
									if(ps2_code = ps2_code_old) then
										ps2_code_old <= "00000000";
										ps2_code <= ps2_data_recived(8 downto 1);
									end if;
								else
									ps2_break <= '1';
								end if;
                    else
                        ps2_code <= "00000000";
								ps2_code_old <= "00000000";
								ps2_break <= '0';
								ps2_data_recived <= "00000000000";
                    end if;
                when others => 
						ps2_data_bit_counter <= 0;
						ps2_break <= '0';
            end case;
        end if;
    end process;
    ps2_code_o <= ps2_code;
end behavioral;