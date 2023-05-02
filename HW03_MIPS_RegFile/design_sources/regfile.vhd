LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY RegFile IS
   PORT( 
      RA1      : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
      RA2 	   : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
      RegWrite : IN  std_logic;
      WA  	   : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
      WD  	   : IN  std_logic_vector (reg_file_width - 1 DOWNTO 0);
      clk      : IN  std_logic;
      rst      : IN  std_logic;
      RD1 	   : OUT std_logic_vector (reg_file_width - 1 DOWNTO 0);
      RD2 	   : OUT std_logic_vector (reg_file_width - 1 DOWNTO 0)
   );
END RegFile;

ARCHITECTURE behav OF RegFile IS

   -- Internal signal declarations
   SIGNAL reg_file  : mem_type(0 to reg_file_depth - 1);

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------
   --three concurrent process
   --one to write
   --two to read

   rp1 : PROCESS(RA1, reg_file)
    BEGIN
        IF (unsigned(RA1) >= 0 and unsigned(RA1) < reg_file_depth) THEN
            RD1 <= reg_file(TO_INTEGER(unsigned(RA1)));
        ELSE
            RD1 <= (others => '0');
        END IF;
    END PROCESS;
    
    rp2 : PROCESS(RA2, reg_file)
    BEGIN
        IF (unsigned(RA2) >= 0 and unsigned(RA2) < reg_file_depth) THEN
            RD2 <= reg_file(TO_INTEGER(unsigned(RA2)));
        ELSE
            RD2 <= (others => '0');
        END IF;
    END PROCESS;
    
   wp : PROCESS(clk, rst, WA, WD, RegWrite)
    BEGIN
        IF (rst ='1') THEN
            reg_file <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (unsigned(WA) > 0 and unsigned(WA) < reg_file_depth) THEN
                IF (RegWrite = '1') THEN
                    reg_file(TO_INTEGER(unsigned(WA))) <= WD;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    

   ---------------------------------- 

END behav;
