library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use std.textio.ALL;
use ieee.numeric_std.all;


entity sevenseg_decoder_tb is
    -- Testbenches do not have ports!
end sevenseg_decoder_tb;

architecture tb_arch of sevenseg_decoder_tb is
    -- Declare component under test (CUT)
    component sevenseg_decoder
        Port ( i_Hex   : in  STD_LOGIC_VECTOR (3 downto 0);
               o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    -- Signals for testbench stimulus
    signal i_Hex   : STD_LOGIC_VECTOR (3 downto 0);
    signal o_seg_n : STD_LOGIC_VECTOR (6 downto 0);

begin
    -- Instantiate the component under test (CUT)
    uut: sevenseg_decoder
        port map(
            i_Hex   => i_Hex,
            o_seg_n => o_seg_n
        );

    -- Test process
    stimulus: process
    begin
        -- Apply all 16 input values and wait for results
        for i in 0 to 15 loop
            i_Hex <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;  -- Allow time for signals to propagate
        end loop;

        -- End simulation
        wait;
    end process;
end tb_arch;
