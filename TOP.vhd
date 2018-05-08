--! @file CES265_TOP.vhd
--! @author Apratim Gupta
--! @email apratimgupta@gmail.com
--! @brief Top wrappper for connection of Qsys conduits and pll.
--! @details Top wrapper file for connection of conduit signals and generated pll Megawizard IP
--! @brief Use IEEE libraries
library ieee;
use ieee.std_logic_1164.ALL ;
use ieee.numeric_std.ALL;

entity Top is
--! @brief Ports
port ( 		
			   CONNECTED_TO_c_0_clk							: in 		std_LOGIC;            										--! clock input
            CONNECTED_TO_reset_reset_n       			: in 		std_LOGIC;													--! reset.reset_n
            SDRAM_clk												: out 	std_logic;														--! SDRAM clock o/p
			   CONNECTED_TO_sdram_0_wire_addr   		: out 	std_logic_vector(12 downto 0);						--! SDRAM.addr
            CONNECTED_TO_sdram_0_wire_ba     		: out 	std_logic_vector(1 downto 0);							--!.SDRAM ba
            CONNECTED_TO_sdram_0_wire_cas_n  	: out  	std_logic;														--! SDRAM cas_n
            CONNECTED_TO_sdram_0_wire_cke    		: out   	std_logic; 														--! SDRAM.cke
            CONNECTED_TO_sdram_0_wire_cs_n   	: out   	std_logic;														--! SDRAM cs_n
            CONNECTED_TO_sdram_0_wire_dq     		: inout 	std_logic_vector(31 downto 0) := (others => 'X');--! SDRAM dq
            CONNECTED_TO_sdram_0_wire_dqm    	: out   	std_logic_vector(3 downto 0); 							--! SDRAM dqm
            CONNECTED_TO_sdram_0_wire_ras_n  	: out   	std_logic;														--! SDRAM ras_n
            CONNECTED_TO_sdram_0_wire_we_n   	: out   	std_logic 														--! SDRAM we_n 
			
);	
end entity Top;


architecture Behavioral of Top is
--! brief@ Qsys conduit component
component MULTICORE_SOBEL is
        port (
            clk_clk          		: in    	std_logic                     := 'X';           
            reset_reset_n      		: in    	std_logic                     := 'X';             
            sdram_0_wire_addr  	: out   	std_logic_vector(12 downto 0);           
            sdram_0_wire_ba    	: out   	std_logic_vector(1 downto 0);                    
            sdram_0_wire_cas_n : out   	std_logic;                                       
            sdram_0_wire_cke   	: out   	std_logic;                                       
            sdram_0_wire_cs_n  	: out   	std_logic;                                       
            sdram_0_wire_dq    	: inout 	std_logic_vector(31 downto 0) := (others => 'X'); 
            sdram_0_wire_dqm   	: out   	std_logic_vector(3 downto 0);                  
            sdram_0_wire_ras_n 	: out   	std_logic;                                        
            sdram_0_wire_we_n  	: out   	std_logic													
			);
end component MULTICORE_SOBEL;
--! brief@ Megawizard pll component
component SDRAM_PLL is
		 port (
				
				inclk0			: IN STD_LOGIC  := '0';
				c0				: OUT STD_LOGIC ;
				c1				: OUT STD_LOGIC 
				);
	end component SDRAM_PLL;

signal clk_143M : std_logic;
	
begin
    u0:component SDRAM_PLL
		  port map (
				inclk0 	 => CONNECTED_TO_c_0_clk, 
				c0		 => SDRAM_clk,
				c1         => clk_143M		
				);
    u1 : component MULTICORE_SOBEL
        port map (		
            clk_clk          		=> clk_143M,           
            reset_reset_n     	 	=> CONNECTED_TO_reset_reset_n,   
            sdram_0_wire_addr  	=> CONNECTED_TO_sdram_0_wire_addr,  
            sdram_0_wire_ba    	=> CONNECTED_TO_sdram_0_wire_ba,   
            sdram_0_wire_cas_n  => CONNECTED_TO_sdram_0_wire_cas_n, 
            sdram_0_wire_cke   	=> CONNECTED_TO_sdram_0_wire_cke,   
            sdram_0_wire_cs_n  	=> CONNECTED_TO_sdram_0_wire_cs_n,  
            sdram_0_wire_dq    	=> CONNECTED_TO_sdram_0_wire_dq,   
            sdram_0_wire_dqm   	=> CONNECTED_TO_sdram_0_wire_dqm,  
            sdram_0_wire_ras_n 	=> CONNECTED_TO_sdram_0_wire_ras_n, 
            sdram_0_wire_we_n  => CONNECTED_TO_sdram_0_wire_we_n  				                 					
			);
	
end architecture Behavioral;	
