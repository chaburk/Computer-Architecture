LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY CU IS
   PORT( 
      Instr      : IN     std_logic_vector (n_bits_instr - 1 DOWNTO 0);
      ALUControl : OUT    std_logic_vector (n_bits_of(n_functions_alu) - 1 DOWNTO 0);
      ALUSrc     : OUT    std_logic;
      BEQ        : OUT    std_logic;
      J          : OUT    std_logic;
      MemToReg   : OUT    std_logic;
      MemWrite   : OUT    std_logic;
      RegDst     : OUT    std_logic;
      RegWrite   : OUT    std_logic
   );
END CU;

ARCHITECTURE behav OF CU IS

	SIGNAL opcode : NATURAL RANGE 0 TO (2**(opcode_end - opcode_start + 1) - 1);
	SIGNAL funct  : NATURAL RANGE 0 TO (2**(funct_end - funct_start + 1) - 1);
	SIGNAL ALUControl_int : NATURAL RANGE 0 TO (n_functions_alu - 1);

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   opcode <= to_integer(unsigned(Instr(opcode_end downto opcode_start)));
   funct <= to_integer(unsigned(Instr(funct_end downto funct_start)));
   ALUControl <= std_logic_vector(to_unsigned(ALUControl_int, n_bits_of(n_functions_alu)));
   ----- insert your code here ------
   process (opcode, funct)
   begin
        RegDst <= '0';
        ALUSrc <= '0';
        MemToReg <= '0';
        RegWrite <= '0';
        MemWrite <= '0';
        BEQ <= '0';
        J <= '0';
        ALUControl_int <= 0;
        case opcode is
            when 0 =>
                case funct is
                    when 36 =>
                        ALUControl_int <= 0;--to_integer((to_unsigned(ALUControl_int, n_functions_alu));
                        RegDst <= '1';
                        ALUSrc <= '0';
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemWrite <= '0';
                        BEQ <= '0';
                        J <= '0';
                    when 37 =>
                        ALUControl_int <= 1;
                        RegDst <= '1';
                        ALUSrc <= '0';
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemWrite <= '0';
                        BEQ <= '0';
                        J <= '0';
                    when 32 =>
                        ALUControl_int <= 2;
                        RegDst <= '1';
                        ALUSrc <= '0';
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemWrite <= '0';
                        BEQ <= '0';
                        J <= '0';
                    when 34 =>
                        ALUControl_int <= 5;
                        RegDst <= '1';
                        ALUSrc <= '0';
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemWrite <= '0';
                        BEQ <= '0';
                        J <= '0';
                    when 42 =>
                        ALUControl_int <= 7;
                        RegDst <= '1';
                        ALUSrc <= '0';
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemWrite <= '0';
                        BEQ <= '0';
                        J <= '0';
                    when 39 =>
                        ALUControl_int <= 12;
                        RegDst <= '1';
                        ALUSrc <= '0';
                        MemToReg <= '0';
                        RegWrite <= '1';
                        MemWrite <= '0';
                        BEQ <= '0';
                        J <= '0';
                    when others =>
                        ALUControl_int <= 0;
                        RegDst <= '0';
                        ALUSrc <= '0';
                        MemToReg <= '0';
                        RegWrite <= '0';
                        MemWrite <= '0';
                        BEQ <= '0';
                        J <= '0';
                end case;
            when 35 =>
                    ALUControl_int <= 2;
                    RegDst <= '0';
                    ALUSrc <= '1';
                    MemToReg <= '1';
                    RegWrite <= '1';
                    MemWrite <= '0';
                    BEQ <= '0';
                    J <= '0';   
            when 43 =>
                    ALUControl_int <= 2;
                    RegDst <= '0';
                    ALUSrc <= '1';
                    MemToReg <= '0';
                    RegWrite <= '0';
                    MemWrite <= '1';
                    BEQ <= '0';
                    J <= '0'; 
            when 4 =>
                    ALUControl_int <= 6;
                    RegDst <= '0';
                    ALUSrc <= '0';
                    MemToReg <= '0';
                    RegWrite <= '0';
                    MemWrite <= '0';
                    BEQ <= '1';
                    J <= '0';
            when 2 =>
                    ALUControl_int <= 0;
                    RegDst <= '0';
                    ALUSrc <= '0';
                    MemToReg <= '0';
                    RegWrite <= '0';
                    MemWrite <= '0';
                    BEQ <= '0';
                    J <= '1'; 
            when 8 =>
                    ALUControl_int <= 2;
                    RegDst <= '0';
                    ALUSrc <= '1';
                    MemToReg <= '0';
                    RegWrite <= '1';
                    MemWrite <= '0';
                    BEQ <= '0';
                    J <= '0';
            when others =>
                    ALUControl_int <= 0;
                    RegDst <= '0';
                    ALUSrc <= '0';
                    MemToReg <= '0';
                    RegWrite <= '0';
                    MemWrite <= '0';
                    BEQ <= '0';
                    J <= '0';
                               
        end case;
    end process;
        


   ----------------------------------  

END behav;
