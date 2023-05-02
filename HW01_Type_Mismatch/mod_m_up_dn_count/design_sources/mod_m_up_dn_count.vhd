LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.my_package.ALL;

ENTITY mod_m_up_dn_count IS
	GENERIC (m : NATURAL := 16);
	PORT (up_down	: IN	STD_LOGIC; -- direction of count, 1 --> counting up, 0 --> counting down
	      clk, rst	: IN	STD_LOGIC;
	      count	    : OUT	STD_LOGIC_VECTOR(n_bits_of(m) - 1 DOWNTO 0)
	     );
END mod_m_up_dn_count;

ARCHITECTURE behavioral OF mod_m_up_dn_count IS

   -- Internal signal declarations
   SIGNAL count_int : STD_LOGIC_VECTOR(count'length - 1 DOWNTO 0) := (OTHERS => '0');

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------
   count <= count_int;
   asynch_reset : PROCESS(clk, rst, up_down)
    BEGIN
    --problem with switching from logic vector to integer
        IF (rst ='1') THEN
            count_int <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF up_down = '1' THEN
                count_int <= STD_LOGIC_VECTOR(unsigned(count_int) + 1);
                --if statement switches the direction
                IF unsigned(count_int) = m-1 THEN
                    count_int <= (others => '0');
                END IF;
            ELSE
                count_int <= std_logic_vector(unsigned(count_int) - 1);
                --count_int is a std logic vector convert 0 to vector
                IF unsigned(count_int) = 0 THEN
                --m is a natural need to convert to vector
                    count_int <= std_logic_vector(to_unsigned(m - 1, n_bits_of(m)));
                END IF;
            END IF;
        END IF;
    END PROCESS;
   ----------------------------------	

END behavioral;
