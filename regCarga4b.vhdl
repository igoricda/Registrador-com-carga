library ieee;
use ieee.std_logic_1164.all;

entity regCarga4bit is
    port(
        d : in bit_vector(3 downto 0);
        clk : in bit;
        pr, cl : in bit;
        nrw : in bit;
        s : out bit_vector(3 downto 0)
        );
end entity;

architecture reg4bit of regCarga4bit is
    component regCarga1bit is
        port(
            d : in bit;
            clk : in bit;
            pr, cl : in bit;
            nrw : in bit;
            s : out bit
            );
    end component;
    
begin
    -- instâncias de regCarga1bit (4 vezes)
    u_reg0 : regCarga1bit port map(d(0), clk, pr, cl, nrw, s(0));
    u_reg1 : regCarga1bit port map(d(1), clk, pr, cl, nrw, s(1));
    u_reg2 : regCarga1bit port map(d(2), clk, pr, cl, nrw, s(2));
    u_reg3 : regCarga1bit port map(d(3), clk, pr, cl, nrw, s(3));
    -- como alternativa e sugestão, é possível trocar as 4 linhas anteriores
    -- por um generate do VHDL!
end architecture;
