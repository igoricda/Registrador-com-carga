library ieee;
use ieee.std_logic_1164.all;

entity regCarga1bit is
    port(
        d : in bit;
        clk : in bit;
        pr, cl : in bit;
        nrw : in bit;
        s : out bit
        );
end entity;

architecture reg1bit of regCarga1bit is
    component ffjkd is
        port(
            d : in bit;
            clock : in bit;
            pr, cl : in bit;
            q, nq : out bit
            );
    end component;
    
    signal datain, dataout : bit;
    
    begin
    -- envio de dataout para saída s
    s <= dataout;
    
    -- multiplexador
    -- nrw = 1 -> entrada principal de interface d
    -- nrw = 0 -> saida temporária dataout (mantém estado)
    datain <= d when nrw = '1' else dataout;
    
    -- instância do reg
    u_reg : ffjkd port map(datain, clk, pr, cl, dataout);
    
end architecture;
