library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity calculadora is
    port(
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        saida : out std_logic_vector(7 downto 0);
        opcao : in std_logic_vector(3 downto 0);
        carry : out std_logic
    );
end calculadora;

architecture behavioral of calculadora is
    signal resultado : std_logic_vector(7 downto 0);
    signal temporal : std_logic_vector(8 downto 0);
    begin
        process(A, B, opcao)
        begin
            case(opcao) is
                when "0000" =>
                    resultado <= A + B;
                when "0001" =>
                    resultado <= A - B;
                when "0010" =>
                    resultado <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) * to_integer(unsigned(B)),8));
                when "0011" =>
                    resultado <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) / to_integer(unsigned(B)),8));
                when others =>
                    resultado <= A + B;
            end case;
        end process;
        
    saida <= resultado;
    temporal <= ('0' & A) + ('0' & B);
    carry <= temporal(8);
end behavioral;
