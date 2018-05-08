
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--! @brief Avalon Memory Mapped Slave Interface
entity multicore_interface is
	--! @brief Generics
	generic (daughter_processors: integer := 1);		--! Number of Daughter processors connected
	--! @brief Ports
    port 
    (
		i_address			 	: in std_logic_vector(7 downto 0);  	--! Avalon MM Adresses
        i_clock               	: in std_logic;                      		  	--! clock input
        i_resetn              	: in std_logic;                      			--! reset_n input
        i_av_read          	: in std_logic;                      			--! Avalon MM read input
        i_av_write          	: in std_logic;                      			--! Avalon MM write input
        o_wait_req          	: out std_logic;                     		   	--! Avalon MM wait request o/p
        o_readdata_valid 	: out std_logic;                     			--! Avalon MM data valid o/p
        i_writedata           	: in  std_logic_vector(31 downto 0); 	--! Avalon MM writedata i/p to slave reg.
        o_readdata            : out std_logic_vector(31 downto 0)  --! Avalon MM readdata o/p from slave reg.
    );
end entity multicore_interface;

Architecture Behavioral of multicore_interface is
	type row_t is array(0 to ((daughter_processors*11)-1)) of std_logic_vector(31 downto 0) ;
	  signal r_reg          : row_t ;	  
 
--! details@ r_reg register array of 11 of each 32 bits --  
--! -------------------------------------------------------------------------------------
--! |R0|R1|R2|R3|R4|R5|R6|R7|R8|R9|R10| ---
--!	 ------------------------------------------------------------------------------------
--!	For First Daughter Processor	 
--!	 --R0 = 0x00000001.
--!	 --R1 to R09 = DATA.
--!	 --R10 = Status bit. 0x00000010=> read ready
--!								 0x00000080=> processing done
--!	 							 0xF0=> wait
--!	For 2nd Daughter Processor	 
--!	 --R11 = 0x00000002.
--!	 --R12 to R20 = DATA.
--!	 --R21 = Status bit. 0x00000020=> read ready
--!								 0x00000080=> processing done
--!	 							 0xF0=> wait
--!	For 3rd Daughter Processor	 
--!	 --R22 = 0x00000003.
--!	 --R23 to R31 = DATA.
--!	 --R32 = Status bit. 0x00000030=> read ready
--!								 0x00000080=> processing done
--!	 							 0xF0=> wait
--!-------------------------------------------------------------------------------------- 
   
begin
				  
	interface:process(i_clock, i_resetn)
    begin
--! brief@ INITIALIZE
        if(i_resetn = '0') then
			 
				o_wait_req <= '0';
            o_readdata_valid <= '0';
				r_reg<= (others=> x"00000000");	
								
        elsif rising_edge(i_clock) then
--! brief@ WRITE CYCLE		  
            if(i_av_write = '1') then				
					r_reg(to_integer(unsigned(i_address))) <= i_writedata;	--! write data to reg file				
				end if;	 
						
--! brief@ READ CYCLE		
				if((i_av_read = '1'))then
			
					o_readdata <= r_reg(to_integer(unsigned(i_address ))); --! read data from reg file
				   o_readdata_valid <= '1';
					else 
					o_readdata_valid<= '0';			
					
            end if;
			
        end if;
    end process interface;

end architecture Behavioral;
