LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY InstrMem IS
   PORT( 
      A     : IN  std_logic_vector (n_bits_address - 1 DOWNTO 0);
      rst   : IN  std_logic;
      Instr : OUT std_logic_vector (instr_mem_width - 1 DOWNTO 0)
   );
END InstrMem;

ARCHITECTURE behav OF InstrMem IS

   -- Internal signal declarations
   SIGNAL instr_mem  : mem_type(0 to instr_mem_depth - 1);

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------
   instr_read_port : PROCESS (A, instr_mem, rst)
   ---------------------------------------------------------------------------
   BEGIN
       Instr <= (OTHERS => '0');
       IF (rst = '1') THEN
        instr_mem <= my_program;
       ELSE
          --Instr <= (OTHERS => '0');
          IF ((TO_INTEGER(UNSIGNED(A)) >= 0) AND (TO_INTEGER(UNSIGNED(A)) < instr_mem_depth)) THEN
             Instr <= instr_mem(TO_INTEGER(UNSIGNED(A)));
          END IF;
       END IF;
   END PROCESS instr_read_port;
   
   


   ----------------------------------    

END behav;
