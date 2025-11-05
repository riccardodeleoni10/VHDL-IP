----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2025 22:18:35
-- Design Name: 
-- Module Name: tb_ROM - Testbench_ROM
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
    use work.my_pkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_ROM is
--  Port ( );
end tb_ROM;

architecture Testbench_ROM of tb_ROM is
    component generic_ROM is
        generic (
        DATA_WIDTH: integer ;
        ROM_SIZE  : integer ;
        ROM_FILE : string   ;
        USE_OFFSET: string   --or yes
        );
        port(
        clk,enable,reset: in std_logic;
        load            : in std_logic;
        addr_start      : in std_logic_vector (log2(natural(ROM_SIZE))-1 downto 0);
        offset          : in std_logic_vector(log2(natural(ROM_SIZE))-1 downto 0);
        data_out        : out std_logic_vector(DATA_WIDTH-1 downto 0)
        );
end component;
    signal clk,reset,load: std_logic;
    signal data_out: std_logic_vector(15 downto 0);
begin
DUT: generic_ROM 
    generic map(
        DATA_WIDTH => 16,
        ROM_SIZE  => 16, 
        ROM_FILE  => "data.txt", --give the complete path
        USE_OFFSET => "no"     
    )
    port map (
        clk => clk,
        reset => reset,
        enable => '1',
        load => load,
        addr_start => "0100",
        offset => "0011",
        data_out => data_out
    );

process
    begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5ns;
end process;
reset <= '1','0' after 20 ns;
load <= '1','0' after 60 ns;
end Testbench_ROM;
