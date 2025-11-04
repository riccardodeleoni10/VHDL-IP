----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2025 17:22:25
-- Design Name: 
-- Module Name: tb_rom - Testbench_of_rom
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

entity tb_rom is
    generic (
         DATA_WIDTH: integer := 16;
        ROM_SIZE  : integer := 16;
        ROM_FILE : string   := "C:\Users\Riccardo\Documents\Cordic\Cordic.srcs\sources_1\new\data.txt"; -- give the complete path, read REMIND down below;
        USE_OFFSET: string  := "no" --or yes
    );
end tb_rom;

architecture Testbench_of_rom of tb_rom is
    component generic_ROM is generic (
        DATA_WIDTH: integer := 16;
        ROM_SIZE  : integer := 16;
        ROM_FILE : string   := "C:\Users\Riccardo\Documents\Cordic\Cordic.srcs\sources_1\new\data.txt"; -- give the complete path, read REMIND down below;
        USE_OFFSET: string  := "no" --or yes
      );
        Port ( 
        clk,enable,reset: in std_logic;
        load            : in std_logic;
        addr_start      : in std_logic_vector (log2(natural(ROM_SIZE))-1 downto 0);
        offset          : in std_logic_vector(log2(natural(ROM_SIZE))-1 downto 0);
        data_out        : out std_logic_vector(DATA_WIDTH-1 downto 0)
      );
    end component generic_ROM;
signal clk,enable,reset      : std_logic;
signal load                  : std_logic := '0';
signal addr_start            : std_logic_vector(log2(natural(ROM_SIZE))-1 downto 0) := (others => '0');
signal offset                : std_logic_vector(log2(natural(ROM_SIZE))-1 downto 0) := (others => '0');
signal data_out              : std_logic_vector (DATA_WIDTH-1 downto 0);
begin
DUT: generic_ROM port map (
    clk => clk,
    reset => reset,
    enable => enable,
    load => load,
    addr_start => addr_start,
    offset => offset,
    data_out => data_out
);
process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
end process;
reset <= '1', '0' after 40 ns;
enable<= '1';

end Testbench_of_rom;
