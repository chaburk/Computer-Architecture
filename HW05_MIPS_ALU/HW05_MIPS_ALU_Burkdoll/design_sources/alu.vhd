LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY ALU IS
   PORT( 
      A           : IN     std_logic_vector (n_bits_alu  - 1 DOWNTO 0);
      ALUControl  : IN     std_logic_vector (n_bits_of(n_functions_alu) - 1 DOWNTO 0);
      B           : IN     std_logic_vector (n_bits_alu  - 1 DOWNTO 0);
      C           : OUT    std_logic_vector (n_bits_alu  - 1 DOWNTO 0);
      zero        : OUT    std_logic;
      overflow    : OUT    std_logic
   );
END ALU;

ARCHITECTURE behav OF ALU IS

   -- Internal signal declarations
   SIGNAL ALUControl_int : natural RANGE 0 TO (n_functions_alu - 1);
   SIGNAL C_internal : std_logic_vector(n_bits_alu  - 1 DOWNTO 0);
   SIGNAL s_A, s_B, s_C : std_logic; -- Sign bits of A, B, C

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------
   
   C <= C_internal;
   s_A <= A(n_bits_alu  - 1);
   s_B <= B(n_bits_alu  - 1);
   s_C <= C_internal(n_bits_alu  - 1);
   ALUControl_int <= to_integer(unsigned(ALUControl));
   
   alu : PROCESS (A,B, ALUControl, C_internal, s_A, s_B, s_C)
   ---------------------------------------------------------------------------
   BEGIN
       CASE(ALUControl) IS
            WHEN "0000" =>
                C_internal <= A AND B;
                IF (signed(C_internal) = to_signed(0, n_bits_alu)) THEN
                    zero <= '1';
                ELSE
                    zero <= '0';
                END IF;
                overflow <= '0';
            WHEN "0001" =>
                C_internal <= A OR B;
                IF (signed(C_internal) = to_signed(0, n_bits_alu)) THEN
                    zero <= '1';
                ELSE
                    zero <= '0';
                END IF;
                overflow <= '0';
            WHEN "0010" =>
                C_internal <= std_logic_vector(TO_SIGNED(TO_INTEGER(SIGNED(A)) + TO_INTEGER(SIGNED(B)), n_bits_alu));
                IF (signed(C_internal) = to_signed(0, n_bits_alu)) THEN
                    zero <= '1';
                ELSE
                    zero <= '0';
                END IF;
--                IF (C_internal < ALUControl_int) THEN
--                    overflow <= '1';
--                ELSE
--                    overflow <= '0';
--                END IF;
                overflow <= (not(s_A) and not(s_B) and s_C) or (s_A and s_B and not(s_C));
            WHEN "0110" =>
                C_internal <= std_logic_vector(TO_SIGNED(TO_INTEGER(SIGNED(A)) - TO_INTEGER(SIGNED(B)), n_bits_alu));
                IF (signed(C_internal) = to_signed(0, n_bits_alu)) THEN
                    zero <= '1';
                ELSE
                    zero <= '0';
                END IF;
--                IF (C_internal > ALUControl_int) THEN
--                    overflow <= '1';
--                ELSE
--                    overflow <= '0';
--                END IF;
                overflow <= (not(s_A) and s_B and s_C) or (s_A and not(s_B) and not(s_C));
            WHEN "0111" =>
                IF(signed(A) < signed(B)) THEN
                    C_internal <= std_logic_vector(TO_SIGNED(1, n_bits_alu));
                    zero <= '0';
                ELSE
                    C_internal <= std_logic_vector(TO_SIGNED(0, n_bits_alu));
                    zero <= '1';
                END IF;
                overflow <= '0';
            WHEN "1100" =>
                C_internal <= A NOR B;
                IF (signed(C_internal) = to_signed(0, n_bits_alu)) THEN
                    zero <= '1';
                ELSE
                    zero <= '0';
                END IF;
                overflow <= '0';
            WHEN OTHERS =>
                C_internal <= std_logic_vector(to_signed(0, n_bits_alu));
                zero <= '1';
                overflow <= '0';
       END CASE;
       
   END PROCESS alu;


   ----------------------------------    

END behav;
