library ieee;
use ieee.std_logic_1164.all;

entity tb_4bregCarga is
    -- entidade vazia
end tb_4bregCarga;

architecture test of tb_4bregCarga is
    constant CLK_PERIOD : time := 20 ns;
    
    component regCarga4bit is
        port(
            d : in bit_vector(3 downto 0);
            clk : in bit;
            pr, cl : in bit;
            nrw : in bit;
            s : out bit_vector(3 downto 0)
            );
    end component;
    
    signal spr, scl, snrw : bit;
    signal sclk : bit := '1';
    signal sd, ss : bit_vector (3 downto 0);
    
begin
    -- instancia de JK e port map
    u_tbrg4b : regCarga4bit port map(sd, sclk, spr, scl, snrw, ss);
    
    -- process
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        
        wait for CLK_PERIOD;
        
        -- desativação de clear
        scl <= '1';
        snrw <= '1';
        
        wait for CLK_PERIOD;
        
        -- Gravacao de numero 2
        sd <= "0010";
        
        wait for CLK_PERIOD;
        
        -- Gravacao de numero 12
        sd <= "1100";
        wait for CLK_PERIOD;
        
        --Testar armazenamento
        snrw <= '0';
        wait for CLK_PERIOD;
        
        -- Gravacao de numero 15
        snrw <= '1';
        sd <= "1111"; 
        wait for CLK_PERIOD;
        
        -- Sem gravacao
        snrw <= '0';
        wait for CLK_PERIOD;
        
        -- Gravacao de numero 0
        snrw <= '1';
        sd <= "0000"; 
        wait for CLK_PERIOD;
        
        -- Sem gravacao
        snrw <= '0';
        wait for CLK_PERIOD;
        
    end process;
    
    -- process para Clock
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;
    
end architecture test;
