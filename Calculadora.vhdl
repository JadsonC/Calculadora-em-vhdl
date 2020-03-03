library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Calculadora is
    port(
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        opcao : in std_logic_vector(1 downto 0);
        carry : out std_logic;
		  
		  bar0 : out std_logic_vector(6 downto 0);
		  bar1 : out std_logic_vector(6 downto 0);
		  bar2 : out std_logic_vector(6 downto 0);
		  bar3 : out std_logic_vector(6 downto 0);
		  bar4 : out std_logic_vector(6 downto 0);
		  bar5 : out std_logic_vector(6 downto 0);
		  bar6 : out std_logic_vector(6 downto 0);
		  bar7 : out std_logic_vector(6 downto 0)
    );
end Calculadora;

architecture comportamento of calculadora is
    signal resultado : std_logic_vector(7 downto 0);
    signal temporal : std_logic_vector(8 downto 0);
	 
    begin
        process(A, B, opcao)
		  
        begin
            case(opcao) is
                when "00" =>
                    resultado <= A + B;
                when "01" =>
                    resultado <= A - B;
                when "10" =>
                    resultado <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) * to_integer(unsigned(B)),8));
                when "11" =>
                    resultado <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) / to_integer(unsigned(B)),8));
                when others =>
                    resultado <= A + B;
            end case;
				
				case resultado(0) is
					when '0' => bar0 <= "0000001";
					when '1' => bar0 <= "1001111";
				end case;
				
				case resultado(1) is
					when '0' => bar1 <= "0000001";
					when '1' => bar1 <= "1001111";
				end case;
				case resultado(2) is
					when '0' => bar2 <= "0000001";
					when '1' => bar2 <= "1001111";
				end case;
				case resultado(3) is
					when '0' => bar3 <= "0000001";
					when '1' => bar3 <= "1001111";
				end case;
				case resultado(4) is
					when '0' => bar4 <= "0000001";
					when '1' => bar4 <= "1001111";
				end case;
				case resultado(5) is
					when '0' => bar5 <= "0000001";
					when '1' => bar5 <= "1001111";
				end case;
				case resultado(6) is
					when '0' => bar6 <= "0000001";
					when '1' => bar6 <= "1001111";
				end case;
				case resultado(7) is
					when '0' => bar7 <= "0000001";
					when '1' => bar7 <= "1001111";
				end case;

											
			end process;
		
    temporal <= ('0' & A) + ('0' & B);
    carry <= temporal(8);
	 
	 
end comportamento;
